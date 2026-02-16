#!/bin/bash

##### network related functions #####

function speedtest {
    if ! command -v speedtest-cli &>/dev/null; then
        echo "speedtest-cli not found. install with: brew install speedtest-cli"
        return 1
    fi
    speedtest-cli "$@"
}

function whoisusing {
    lsof -i tcp:$1
}

function get-open-ports {
    if ! command -v nmap &>/dev/null; then
        echo "nmap not found. brewing..."
        brew install nmap
    fi

    ip=$(ifconfig | grep -e 'inet.*broadcast' | awk  '{print $2}')
    nmap $ip/24 | grep "open" -B 4
}
