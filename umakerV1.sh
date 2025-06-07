#!/bin/bash

# --- Script to create a new sudo user ---
# --- By: WizardOfOz669 ---
# --- Reviewed and enhanced for security and clarity ---

# Check if running as root. If not, re-execute with sudo.
if [[ "$EUID" -ne 0 ]]; then
    echo "This script needs root privileges to create a user."
    read -n 1 -p "Do you want to run it with sudo? (Y/N): " RMODE
    printf "\n"
    if [[ "$RMODE" =~ [Yy] ]]; then
        echo "Re-launching with sudo..."
        # Re-execute the script with root privileges, passing all arguments
        exec sudo bash "$0" "$@"
    else
        echo "Aborted by user."
        exit 1
    fi
fi

# Now we are definitely running as root
echo "** Running in Root Mode **"
printf "\n"
echo "Welcome To User Maker By:-WizardOfOz669"
echo "Please wait....."
sleep 1
printf "\n"

# --- User Input ---

DEFAULT_USER="new_user"
read -e -p "Please enter the new username: " -i "$DEFAULT_USER" USER

# Validate username: no spaces
if [[ "$USER" =~ \  ]]; then
    echo "❌ Invalid username: spaces are not allowed."
    exit 1
fi

# Validate username: check if it already exists
if id "$USER" &>/dev/null; then
    echo "❌ User '$USER' already exists."
    exit 1
fi

printf "\n"

# --- Password Input (Securely) ---
PASS=""
PASSCON=""
# Use -s to hide password input (silent mode)
read -s -p "Please enter password for '$USER': " PASS
printf "\n"
read -s -p "Please confirm the password: " PASSCON
printf "\n\n"

if [[ -z "$PASS" ]]; then
    echo "❌ Password cannot be empty."
    exit 1
fi

if [[ "$PASS" != "$PASSCON" ]]; then
    echo "❌ Passwords do not match. Please try again."
    exit 1
fi

# --- User Creation ---
echo "Creating user '$USER' and adding to 'sudo' group..."

# Create the user with a home directory (-m), bash shell (-s), and add to the sudo group (-G)
useradd -m -s /bin/bash -G sudo "$USER"

if [ $? -ne 0 ]; then
    echo "❌ Failed to create the user. An error occurred with 'useradd'."
    exit 1
fi

# Set the password for the new user
echo "$USER:$PASS" | chpasswd

if [ $? -ne 0 ]; then
    echo "❌ Failed to set the password. An error occurred with 'chpasswd'."
    # Optional: clean up by deleting the user if password setting fails
    # userdel -r "$USER"
    exit 1
fi

echo "Please wait...."
sleep 1
printf "\n"

echo "✅ Done! User has been created successfully."
echo "   Username: $USER"
echo "   Password: [hidden for security]"
printf "\n"
sleep 0.5
echo "Welcome to \"Kali Linux\""
printf "\n"
# This link seems to be a placeholder, you might want to change or remove it.
echo "📌 Powered by: https://youtube.com/@wizardofoz669/"

exit 0
