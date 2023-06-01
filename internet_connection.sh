#!/bin/bash

# LOG_FILE="internet_connection.log"
# PREV_STATUS=""

# # Function to log connection failures
# log_failure() {
#     echo "$(date): Internet connection failed" >> "$LOG_FILE"
#     # echo "$(date="%::z"): Internet connection failed"
# }

# # Infinite loop to continuously check the internet connection
# while true; do
#     # Check internet connection status
#     status=$(ping -c 1 8.8.8.8 >/dev/null 2>&1 && echo "online" || echo "offline")

#     # Check if connection status has changed
#     if [[ "$status" != "$PREV_STATUS" ]]; then
#         # If the connection has changed from online to offline, log the failure
#         if [[ "$status" == "offline" ]]; then
#             log_failure
#         fi
#         PREV_STATUS="$status"
#     fi

#     sleep 0.5  # Wait for 1 second before checking again
# done
#
while true; do
    if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
      echo "IPv4 is up"
    else
      echo "IPv4 is down"
    fi
done

