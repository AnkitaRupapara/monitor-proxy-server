# monitor-proxy-server
System Monitoring Dashboard
**Overview**
This script provides a comprehensive dashboard for monitoring various system metrics, including CPU and memory usage, network statistics, disk usage, system load, memory usage, process information, and the status of essential services. You can run the script in full dashboard mode or specify individual sections using command-line arguments.

**Script Features**
**Top 10 Applications by CPU and Memory Usage**
**Network Monitoring**: Concurrent connections, packet drops, network throughput
**Disk Usage**: Displays disks with usage above 80%
**System Load and CPU Usage**
**Memory and Swap Usage**
**Active Processes**: Count and top 5 by CPU and memory usage
**Service Status**: Checks the status of essential services

**Usage**
**Full Dashboard Mode**
To run the script in full dashboard mode, simply execute:
./script.sh

//This will continuously refresh every 5 seconds, displaying all monitoring sections.

**Custom Dashboard Mode**
To display a specific section of the dashboard, use the following command-line arguments:

**CPU Usage:**
./script.sh -cpu

**Memory Usage:**
./script.sh -memory

**Network Statistics:**
./script.sh -network

**Disk Usage:**
./script.sh -disk

**Process Information:**
./script.sh -process

**Service Status:**
./script.sh -services

**Example**
To check only the memory usage, you will run:
./script.sh -memory

//This command will display the current memory usage and swap status.

**Requirements**
ps
ss
netstat
ifstat
mpstat
free
swapon
systemctl

**Notes**
1: Ensure that the script has execute permissions. You can set this using **chmod +x script.sh**
2: The script assumes you are running it with appropriate permissions to access system information.
3: The refresh interval is set to 5 seconds by default but can be adjusted within the script.
