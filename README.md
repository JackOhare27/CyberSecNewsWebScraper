# Cybersecurity RSS Feed Aggregator

This project is a **Bash-based tool** designed to fetch and display news articles from cybersecurity-focused RSS feeds. It uses customizable keywords to filter relevant articles and provides a GUI display of matching news items.

---

## Features

- **Default and Customizable Settings**:
  - Predefined keywords and RSS feed URLs for ease of use.
  - Update keywords and feed URLs to match personal preferences.
- **Configuration Management**:
  - Save and load user preferences through a configuration file.
  - Reset settings to default or clear configurations as needed.
- **Article Filtering**:
  - Automatically extracts and filters RSS feed articles based on keywords.
  - Saves matched titles and URLs for quick reference.
- **GUI-Based News Display**:
  - Articles are displayed in a clean graphical interface.
  - Clicking on a title opens the corresponding article in your browser.
- **Logging**:
  - Maintains a log of activities, including fetched articles and user interactions.

---

## Getting Started

### Prerequisites

Ensure you have the following tools installed:
- Bash (standard on most UNIX-like systems)
- `curl` (for fetching RSS feeds)
- `yad` (Yet Another Dialog, for GUI display)
- `xdg-open` (for opening URLs in the browser)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Cybersecurity-RSS-Feed-Aggregator.git
   cd Cybersecurity-RSS-Feed-Aggregator
