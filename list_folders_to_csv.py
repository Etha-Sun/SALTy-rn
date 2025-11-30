#!/usr/bin/env python3
"""
Script to list all folder names in benchmark/xnnpack/src 
that contain at least one file with 'neon' in its name,
and save them to a CSV file.
"""

import os
import csv
from pathlib import Path

# Define the directory to scan
src_directory = Path(__file__).parent / "benchmark" / "xnnpack" / "src"

# Get all folder names that contain files with 'neon' in the name
folder_names = []
if src_directory.exists():
    for item in sorted(src_directory.iterdir()):
        if item.is_dir():
            # Check if any file in this directory has 'neon' in its name
            has_neon_file = False
            for file in item.iterdir():
                if file.is_file() and 'neon' in file.name.lower():
                    has_neon_file = True
                    break
            
            if has_neon_file:
                folder_names.append(item.name)
else:
    print(f"Error: Directory {src_directory} does not exist")
    exit(1)

# Define output CSV file
output_csv = Path(__file__).parent / "xnnpack_folders.csv"

# Write folder names to CSV
with open(output_csv, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Folder Name'])  # Header
    for folder in folder_names:
        writer.writerow([folder])

print(f"Successfully wrote {len(folder_names)} folder names to {output_csv}")

