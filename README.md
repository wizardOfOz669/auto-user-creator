# Linux Auto User Creator

A simple and secure Bash script to automate the creation of new sudo users on Debian/Ubuntu based systems. This script is designed to be interactive and safe, making it ideal for system administrators and power users.

## ✨ Features

- **Secure Password Entry:** Hides password input using `read -s`.
- **Root Check:** Automatically checks for root privileges and re-runs with `sudo` if needed.
- **Input Validation:** Prevents the use of existing usernames or usernames with spaces.
- **Error Handling:** Checks if commands like `useradd` and `chpasswd` were successful.
- **Interactive & User-Friendly:** Clear prompts guide the user through the process.

## 🚀 How to Use

1.  **Download the script:**
    ```bash
    git clone [https://github.com/ wizardOfOz669/linux-user-creator.git](https://github.com/ wizardOfOz669/linux-user-creator.git)
    cd linux-user-creator
    ```
    (استبدل `YourUsername` باسم المستخدم الخاص بك)

2.  **Make it executable:**
    ```bash
    chmod +x umakerV1.sh 
    ```
    (استبدل `umaker.sh` بالاسم الذي اخترته لملف السكربت)

3.  **Run the script:**
    ```bash
    ./umaker.sh
    ```

## ⚠️ Disclaimer

This script performs administrative tasks. Please review the code carefully before executing it on your system. Use at your own risk.
