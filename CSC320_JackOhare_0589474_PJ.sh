#Jack O'Hare
#jmohare@cn.edu 0589474
# default keywords to use
default_keywords=("CYBERSECURITY" "HACK" "BREACH" "DATA" "SOFTWARE" "VULNERABILITY")
default_RSS_URLS=("https://feeds.feedburner.com/eset/blog" "https://feeds.feedburner.com/TheHackersNews?format=xml")

CONFIG_FILE="user_preferences.cfg"

# Variables to store active settings
active_keywords=()
active_RSS_URLS=()

# Load configuration from file
load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        source "$CONFIG_FILE"
        active_keywords=("${keywords[@]}")
        active_RSS_URLS=("${RSS_URLS[@]}")
        echo "Loaded settings from configuration file"
    else
        echo "Configuration file not found"
    fi
}

# Use default keywords and sites
load_defaults() {
    active_keywords=("${default_keywords[@]}")
    active_RSS_URLS=("${default_RSS_URLS[@]}")
    echo "Loaded default settings."
}

# Save user preferences to config file
save_preferences() {
    echo "keywords=(${active_keywords[@]})" > "$CONFIG_FILE"
    echo "RSS_URLS=(${active_RSS_URLS[@]})" >> "$CONFIG_FILE"
    echo "Preferences saved to $CONFIG_FILE."
}

# Update user preferences
update_preferences() {
    echo "Current Keywords: ${active_keywords[*]}"
    read -p "Enter new keywords (comma-separated): " new_keywords
    IFS=',' read -ra active_keywords <<< "$new_keywords"

    echo "Current RSS Feeds: ${active_RSS_URLS[*]}"
    read -p "Enter new RSS feed URLs (comma-separated): " new_rss
    IFS=',' read -ra active_RSS_URLS <<< "$new_rss"

    save_preferences
}

# Clear user configuration
clear_config() {
    rm -f "$CONFIG_FILE"
    echo "Configuration cleared."
}

# Output files
> cleanTitles.txt
> cleanURL.txt
LOG_FILE="news_log.txt"

# Logging function
log_event() {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Fetch and process articles
fetch_articles() {
    local iters=0
    > cleanTitles.txt
    > cleanURL.txt

    for RSS_URL in "${active_RSS_URLS[@]}"; do
        rss_data=$(curl -s "$RSS_URL")
        if [[ -z "$rss_data" ]]; then
            echo "Error: Failed to retrieve data from $RSS_URL" >&2
            log_event "Failed to retrieve data from $RSS_URL"
            continue
        fi

        titles=$(echo "$rss_data" | grep -o '<title>.*</title>' | sed 's/<\/\?title>//g' | sed '1d' | awk '{print toupper($0)}')
        links=($(echo "$rss_data" | grep -oP '(?<=<link>)[^<]+' | sed '1d'))

	#if title has keyword we need, port to txt files
        echo "$titles" | while read -r title; do
            if echo "$title" | grep -iqE "$(IFS="|"; echo "${active_keywords[*]}")"; then
                echo "$title" >> cleanTitles.txt
                echo "${links[iters]}" >> cleanURL.txt
                log_event "Matched: $title"
            fi
            ((iters++))
        done
    done
    log_event "Fetched new articles."
}

# Display articles
display_news() {
    fetch_articles

    news_items=()
    news_links=()
    #ports textfiles to arrays
    while IFS= read -r line; do
        news_items+=("$line")
    done < cleanTitles.txt
    while IFS= read -r line; do
        news_links+=("$line")
    done < cleanURL.txt
	
    if [[ ${#news_items[@]} -eq 0 ]]; then
        yad --text="No new articles found." --no-buttons --timeout=5 --width=300 --height=50
        return
    fi
    #GUI Display
    while true; do
        for ((i=0; i < ${#news_items[@]}; i++)); do
            link_text="<a href='${news_links[i]}'>${news_items[i]}</a>"
            yad --text-info --posx=100 --posy=100 --html --text="$link_text" --no-buttons --timeout=5 \
                --undecorated --skip-taskbar --width=300 --height=50 \
                --text-align=center --fixed --moveable
            if [[ $? -eq 0 ]]; then
                xdg-open "${news_links[i]}"
                log_event "User clicked: ${news_links[i]}"
            fi
        done
        sleep 3600  # Wait for 1 hour before refreshing the list
        fetch_articles
    done
}

# Menu choices
main_menu() {
    echo "Select an option:"
    echo "1. Start with Default Settings"
    echo "2. Start with Configuration File"
    echo "3. Update Preferences"
    echo "4. Clear Configuration"
    echo "5. Display News"
    echo "6. Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1) load_defaults ;;
        2) load_config ;;
        3) update_preferences ;;
        4) clear_config ;;
        5) display_news ;;
        6) break ;;
        *) echo "Invalid choice!" ;;
    esac
}

while true; do
    main_menu
done
