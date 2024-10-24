#!/bin/bash

source_dir="./source"
index_html="./index.html"
counter=0

# Rename files in the source directory
for file in "$source_dir"/*; do
  new_name="$source_dir/$counter.${file##*.}"
  mv "$file" "$new_name"
  counter=$((counter + 1))
done

# Replace const max in index.html
while IFS= read -r line; do
  if [[ $line =~ const\ max\ =\ [0-9]*; ]]; then
    line="const max = $counter;"
  fi
  echo "$line"
done < "$index_html" > index.tmp

mv index.tmp "$index_html"

echo "Files count: $counter"
