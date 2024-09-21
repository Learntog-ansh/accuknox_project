#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

LOG_FILE="/code/system_health/system_health.log"

# Function to log message
log_message() {
    local message=$1
    echo "$(date): $message" >> $LOG_FILE
}

# Check CPU usage
check_cpu_usage() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        log_message "High CPU usage detected: $CPU_USAGE%"
        echo "High CPU usage detected: $CPU_USAGE%"
    fi
}

# Check memory usage
check_memory_usage() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
        log_message "High memory usage detected: $MEMORY_USAGE%"
        echo "High memory usage detected: $MEMORY_USAGE%"
    fi
}

# Check disk usage
check_disk_usage() {
    DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
    if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
        log_message "High disk usage detected: $DISK_USAGE%"
        echo "High disk usage detected: $DISK_USAGE%"
    fi
}

# Check running processes
check_running_processes() {
    RUNNING_PROCESSES=$(ps ax | wc -l)
    log_message "Currently running processes: $RUNNING_PROCESSES"
    echo "Currently running processes: $RUNNING_PROCESSES"
}

# Running checks
check_cpu_usage
check_memory_usage
check_disk_usage
check_running_processes
