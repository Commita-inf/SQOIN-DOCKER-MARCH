#!/bin/bash

# Define the name of the directory to copy
dir_name="./hello-world-node"

# Create a copy of the directory with "-copy" appended to its name
copy_name="${dir_name}-copy"
cp -r "$dir_name" "$copy_name"

# Ignore files listed in .gitignore by using rsync
rsync -r --exclude-from="$dir_name/.gitignore" "$dir_name/" "$copy_name/"

# Compress the copied directory into a zip file
zip -r "$copy_name.zip" "$copy_name"

# Send the zip file as an email attachment
to_email="receiver@example.com"
from_email="sender@example.com"
subject="My Project Copy"
body="Attached is a copy of my project directory."
attachment="$copy_name.zip"
echo "$body" | mutt -s "$subject" -a "$attachment" -- "$to_email" -- -f "$from_email"

# Remove the copied directory (optional)
rm -r "$copy_name"