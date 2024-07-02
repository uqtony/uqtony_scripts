#!/bin/bash

# Directory to process
DIRECTORY=$1

# Check if directory is provided
if [ -z "$DIRECTORY" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if the provided argument is a directory
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: $DIRECTORY is not a directory"
  exit 1
fi

# Iterate over each item in the directory
for item in "$DIRECTORY"/*; do
  # Check if the item is a symbolic link
  if [ -L "$item" ]; then
    # Get the target of the symbolic link
    target=$(readlink "$item")

    # Copy the content of the real file to a temporary file
    cp --dereference "$item" /tmp/tempfile

    # Remove the symbolic link
    rm "$item"

    # Move the temporary file to the original location
    mv /tmp/tempfile "$item"

    echo "Converted symbolic link $item to real file"
  fi
done

echo "All symbolic links in $DIRECTORY have been converted to real files."

