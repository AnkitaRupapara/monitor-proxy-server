#!/bin/bash

# Refresh interval (in seconds)
INTERVAL=5

# Function to display the top 10 applications by CPU and memory usage
top_apps() {
  echo "Top 10 Applications by CPU and Memory Usage:"
  ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 11
}

# Function to monitor network statistics
network_monitor() {
  echo "Network Monitoring:"
  echo "Number of concurrent connections:"
  ss -tun | wc -l
  
  echo "Packet Drops:"
  netstat -s | grep -i 'segments retransmited'
  
  echo "Network MB in and out:"
  ifstat -t 1 1 | tail -n 1
}

# Function to monitor disk usage
disk_usage() {
  echo "Disk Usage:"
  df -h | awk '$5+0 > 80 {print $0}'
}

# Function to display system load
system_load() {
  echo "System Load and CPU Usage:"
  uptime
  echo "CPU Usage:"
  mpstat
}

# Function to monitor memory usage
memory_usage() {
  echo "Memory Usage:"
  free -h
  echo "Swap Usage:"
  swapon --show
}

# Function to monitor processes
process_monitor() {
  echo "Active Processes:"
  ps aux | wc -l
  echo "Top 5 Processes by CPU and Memory Usage:"
  ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
}

# Function to monitor essential services
service_monitor() {
  echo "Service Monitoring:"
  services=("sshd" "nginx" "apache2" "iptables")
  for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
      echo "$service is running"
    else
      echo "$service is NOT running"
    fi
  done
}

# Function to display the custom dashboard based on the command-line argument
custom_dashboard() {
  case $1 in
    -cpu)
      system_load
      ;;
    -memory)
      memory_usage
      ;;
    -network)
      network_monitor
      ;;
    -disk)
      disk_usage
      ;;
    -process)
      process_monitor
      ;;
    -services)
      service_monitor
      ;;
    *)
      echo "Usage: $0 {-cpu|-memory|-network|-disk|-process|-services}"
      exit 1
      ;;
  esac
}

# Main script
if [ $# -eq 0 ]; then
  while true; do
    clear
    echo "System Monitoring Dashboard"
    echo "==========================="
    top_apps
    echo
    network_monitor
    echo
    disk_usage
    echo
    system_load
    echo
    memory_usage
    echo
    process_monitor
    echo
    service_monitor
    sleep $INTERVAL
  done
else
  custom_dashboard "$1"
fi
