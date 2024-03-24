#!/usr/bin/env bash

for dir in */; do
  # Remove trailing slash to get directory name
  dir_name=$(basename "$dir")

  # Create a zip file with the directory name
  zip -jr "${dir_name}.zip" "$dir_name"/*
done
