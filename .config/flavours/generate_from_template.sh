#!/bin/bash

# Check if correct number of arguments provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <template_file> <words_file> <output_file>"
    echo "Template file should contain {WORD} as placeholder"
    exit 1
fi

TEMPLATE_FILE="$1"
WORDS_FILE="$2"
OUTPUT_FILE="$3"

# Check if input files exist
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file '$TEMPLATE_FILE' not found"
    exit 1
fi

if [ ! -f "$WORDS_FILE" ]; then
    echo "Error: Words file '$WORDS_FILE' not found"
    exit 1
fi

# Read template content
TEMPLATE=$(cat "$TEMPLATE_FILE")

# Clear output file
> "$OUTPUT_FILE"

# Process each word
while IFS= read -r word; do
    # Skip empty lines
    if [ -n "$word" ]; then
        # Replace {WORD} placeholder with the current word
        output_line="${TEMPLATE//\{WORD\}/$word}"
        echo "$output_line" >> "$OUTPUT_FILE"
    fi
done < "$WORDS_FILE"

echo "Generated output saved to: $OUTPUT_FILE"
