#!/bin/bash

#ascii art here (dont eat the cat)
printf -v holycat "\n                             █                                                \n                             ████                                             \n                       ███   ███████                                          \n                        ███████████████                                       \n                         ██████████████████                                   \n                         █████████████████████                                \n                         ████████████████████████                             \n                         ██████████████████████████                           \n                       █████████████████████████████                          \n                      ████████████████████████████████                        \n                      █████████████████████████████████                       \n                      █████  ███████████████████████████                      \n                      ████  █████████████████████████████                     \n                       ██████████████████████████ ███████                     \n                      ██████████████████████████  ███████                     \n                     ███████████████████████████  ███████                     \n                      ███████████      ████████  ████████                     \n                         █████          ██████   ████████                     \n                                       ██████   █████████                     \n                                      █████     ████████                      \n                                     █████     █████████                      \n                                    ████      █████████                       \n                                   ████      █████████                        \n                                  ███      █████████                          \n                                  ███    █████████                            \n                                 ███    ████████                              \n                                 ██    ███████                                \n                                 ██   █████                                   \n                                 ██  █████                                    \n                                  █ ████                                      \n                                    ███                                       \n                                    ██                                        \n                                    █                                         \n"

printf "\033[2J\033[H"

printf "\033[7d%s" "$holycat"
#$(printf "%s" "$holycat" | wc -l) returns 34

printf "\033[3;78H===== SYSTEM ====="
printf "\033[4;78HUser: $(whoami)"
printf "\033[5;78HHostname: $(hostname)"
printf "\033[6;78HOS: $(uname -s)"
printf "\033[7;78HKernel: $(uname -r)"

printf "\033[9;78H===== HARDWARE ====="
printf "\033[10;78HCPU cores: $(nproc)"
printf "\033[11;78HMemory:\n"
counter=0
free -g | while read line; do
	((counter++))
	if [[ $counter -eq 1 ]]; then
		printf "\033[95G%s" "$line"
	else
		printf "\n\033[80G%s" "$line"
	fi
done
#$(free -g| wc -l) returns 3
printf "\033[15;78HUptime: $(uptime)"

printf "\033[17;78H===== STORAGE ====="
df -h | while read line; do
	printf "\n\033[78G%s" "$line"
done
#$(df -h | wc -l) returns 20

printf "\033[39;78H===== ENVIRONMENT ====="
printf "\033[40;78HShell: $(echo $0)"
printf "\033[41;78HTime:"
timedatectl status | while read line; do
	printf "\n\033[80G%s" "$line"
done
#$(timedatectl status | wc -l) returns 7

for i in {1..2}; do
	printf "\n"
done

#This is for reference
#===== SYSTEM =====
#User:
#Hostname:
#OS:
#Kernel:

#===== HARDWARE =====
#CPU cores:
#Memory:
#Uptime:

#===== STORAGE =====
#Filesystem:
#Used:
#Available:

#===== ENVIRONMENT =====
#Shell:
#Date:
