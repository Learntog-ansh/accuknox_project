#!/bin/bash
URL="http://example.com"

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# Function to check the status
check_app_status() {
    if [ "$RESPONSE" -eq 200 ]; then
        echo "The application is UP (Status: $RESPONSE)"
    elif [ "$RESPONSE" -ge 400 ] && [ "$RESPONSE" -lt 600 ]; then
        echo "The application is DOWN (Status: $RESPONSE)"
    else
        echo "The application is in an unknown state (Status: $RESPONSE)"
    fi
}

check_app_status
