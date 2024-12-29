# 🚀 Cybersecurity RSS Feed Aggregator 🌐

This project is a **Bash-based tool** that fetches and displays 🔐 **cybersecurity news** from RSS feeds. Customize your keywords and feeds to stay updated on the latest trends in hacking, data breaches, and software vulnerabilities! 🛡️

---

## ✨ Features ✨

🔥 **Default & Customizable Settings**  
- 🚀 Predefined keywords and RSS feeds for instant setup.  
- 🛠️ Update keywords and feeds to suit your needs.  

📁 **Configuration Management**  
- 💾 Save and load your preferences anytime.  
- 🗑️ Reset to defaults or clear configurations with ease.  

🔍 **Smart Article Filtering**  
- 📰 Extract and filter RSS articles based on keywords.  
- 💡 Save matched titles and links for quick access.  

🖥️ **GUI Display of News**  
- 🎨 Beautiful graphical interface for article browsing.  
- 🔗 Clickable links that open in your default browser.  

📝 **Activity Logging**  
- 🕒 Maintain a log of fetched articles and user actions.  

---
## 📸 Screenshots
![Screenshot 2024-11-17 204617](https://github.com/user-attachments/assets/4b3d5cbe-3877-4359-9f99-bf10073de028)
![Screenshot 2024-11-17 213250](https://github.com/user-attachments/assets/58fb9efe-c0b1-48db-868a-4f1c9437ddad)
![Screenshot 2024-11-17 213420](https://github.com/user-attachments/assets/b0663d03-ea22-415b-b632-cee804198727)



## 🚀 Getting Started

### 📋 Prerequisites

Ensure the following tools are installed:  
- 🐚 **Bash**  
- 🌐 **curl** (for fetching RSS feeds)  
- 🖼️ **yad** (for GUI)  
- 🔗 **xdg-open** (to open URLs)  

### 📥 Installation

1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/Cybersecurity-RSS-Feed-Aggregator.git
   cd Cybersecurity-RSS-Feed-Aggregator
   ```
2. Make the script executable:  
   ```bash
   chmod +x CSC320_JackOhare_0589474_PJ.sh
   ```

### ▶️ Running the Script

Run the script:  
```bash
./CSC320_JackOhare_0589474_PJ.sh
```

Follow the 🧭 **menu prompts** to:  
- 🛠️ Load default or custom settings.  
- 🔍 View and manage news articles.  

---

## 📂 File Structure

- 📄 **`cleanTitles.txt`**: Matched article titles.  
- 📄 **`cleanURL.txt`**: URLs of matched articles.  
- 🗒️ **`news_log.txt`**: Logs actions and matched articles.  
- 🛠️ **`user_preferences.cfg`**: Stores user keywords and RSS feeds.  

---

## 🎨 Customization

### 🔧 Updating Keywords and RSS Feeds

1. Select "Update Preferences" in the menu.  
2. 🖋️ Enter new keywords (comma-separated).  
3. 🌐 Enter new RSS feed URLs (comma-separated).  

### 🗑️ Resetting Configuration

Select "Clear Configuration" to return to default settings.  

---

## 🛠️ Troubleshooting

- **❌ No Articles Found**:  
  - Check if RSS feed URLs are active.  
  - Ensure your keywords match current cybersecurity trends.  

- **❌ Missing GUI**:  
  - Install `yad`:  
    ```bash
    sudo apt-get install yad
    ```  

---

## 🌟 Future Enhancements

- 🛡️ Improved error handling for RSS parsing.  
- 🎨 Additional GUI themes and options.  
- 🔄 Background daemon for scheduled updates.  

---

## 📜 License

📝 This project is open-source under the **WTFPL License**.  

---

## 👨‍💻 Author

**Jack O'Hare**  

