#!/bin/bash

source_dir="./source"
counter=0

for file in "$source_dir"/*; do
  extension="${file##*.}"
  mv "$file" "$source_dir/$counter.$extension"
  counter=$((counter + 1))
done

echo "Files count: $counter"
