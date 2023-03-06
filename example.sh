#!/bin/bash

input_string='This is a "sample" string with "quotes" in it.'

# Extract the text between the first set of quotes
first_quote=$(echo "$input_string" | grep -o '".*"' | head -n1 | sed 's/"//g' | awk -F'"' '{print $1}')

# Extract the text between the second set of quotes
second_quote=$(echo "$input_string" | grep -o '".*"' | tail -n1 | sed 's/"//g' | awk -F'"' '{print $1}')

echo "First quote: $first_quote"
echo "Second quote: $second_quote"

