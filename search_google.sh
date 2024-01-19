#!/bin/bash

# Function to add two numbers
add_numbers() {
    sum=$(($1 + $2))
    echo "Sum of $1 and $2 is: $sum"
}

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <number1> <number2>"
    exit 1
fi

# Parse command line arguments
number1=$1
number2=$2

# Call the function to add numbers
add_numbers $number1 $number2
