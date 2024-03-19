#!/bin/bash

dd if=/dev/zero of=large_file bs=1M count=50

mv large_file /home/john

# Check if the script is executed with superuser(root) privileges

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Check if the file name is "passwd"
if [ "$(basename /etc/passwd)" != "passwd" ]; then
    echo "The file /etc/passwd does not exist."
    exit 1
fi

print_home_directory() {
    echo "Home Directory for $USER: $HOME"
}

list_all_usernames() {
    echo "All usernames from /etc/passwd:"
    awk -F: '{ print $1 }' /etc/passwd
}

count_users() {
    local user_count=$(awk -F: '{ print $1 }' /etc/passwd | wc -l)
    echo "Number of users: $user_count"
}

find_user_home() {
    read -p "Enter the username to find their home directory: " username
    local home_dir=$(grep "^$username:" /etc/passwd | cut -d: -f6)
    if [ -n "$home_dir" ]; then
        echo "Home directory of $username: $home_dir"
    else
        echo "User $username not found."
    fi
}

list_users_in_uid_range() {
    echo "Users with UID between 1000 and 1010:"
    awk -F: '($3 >= 1000) && ($3 <= 1010) { print $1 }' /etc/passwd
}

find_users_with_standard_shells() {
    echo "Users with /bin/bash or /bin/sh shells:"
    grep -E '/bin/bash|/bin/sh' /etc/passwd | cut -d: -f1
}

replace_characters_in_passwd() {
    sed 's/\//\\/g' /etc/passwd > /home/john/passwd_modified
    echo "Modified /etc/passwd file saved to /home/john/passwd_modified"
}

print_private_ip() {
    echo "Private IP address: "
    hostname -I
}

print_public_ip() {
    echo "Public IP address:"
    curl -s https://ipecho.net/plain
}


# Call the functions here
print_home_directory
list_all_usernames
count_users
find_user_home
list_users_in_uid_range
find_users_with_standard_shells
replace_characters_in_passwd
print_private_ip
print_public_ip