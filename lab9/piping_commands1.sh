#!/bin/bash
# Shell Script for Piping Commands
# Usage: ./piping_commands.sh
# Function to display the contents of the current directory
list_directory_contents() {
echo "Listing contents of the current directory:"
ls -l
echo ""
}
# Function to filter and sort directory contents
filter_and_sort_contents() {
read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
echo "Filtering and sorting files with pattern '$pattern'..."
# Use ls, grep, and sort in a pipeline
ls -l | grep "$pattern" | sort
echo ""
}
# Function to search or count files and directories
search_or_count_files() {
    read -p "Do you want to search for a file/directory (S) or count all files and directories (C)? [S/C]: " choice
    choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')  # Convert to uppercase for consistency

    if [ "$choice" == "S" ]; then
        read -p "Enter the name or pattern of the file/directory to search for: " search_pattern
        echo "Searching for '$search_pattern'..."
        # Use find to search the current directory and its subdirectories
        find . -name "$search_pattern"
        echo ""
    elif [ "$choice" == "C" ]; then
        echo "Counting all files and directories in the system..."
        # Count all files and directories in the system
        file_count=$(find / -type f | wc -l)   # Count files
        dir_count=$(find / -type d | wc -l)    # Count directories
        echo "Total files: $file_count"
        echo "Total directories: $dir_count"
        echo ""
    else
        echo "Invalid choice. Please select S to search or C to count."
        echo ""
    fi
}

echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. search the file"
echo "4. Exit"
# Loop until the user chooses to exit
while true; do
read -p "Select an option (1-4): " option
case $option in
1) # List directory contents
list_directory_contents
;;
2) # Filter and sort directory contents
filter_and_sort_contents
;;
3) # search the file
 search_or_count_files
;;
4) # Exit the script
echo "Exiting the Piping Commands Manager. Goodbye!"
exit 0
;;
*) # Invalid option
echo "Invalid option. Please select 1-4."
;;
esac
echo "" # Print a newline for better readability
done
