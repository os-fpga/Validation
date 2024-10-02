#!/bin/bash

ROOT_PATH=$(git rev-parse --show-toplevel)
CONFIG_FILE="$ROOT_PATH/scripts/config.txt"

function read_config() {
    local file=$1
    while IFS='=' read -r key value; do
        [[ "$key" =~ ^#.* ]] || [[ -z "$key" ]] && continue
        
        value=$(echo "$value" | sed 's/^"\(.*\)"$/\1/')

        case "$key" in
            synth_options)
                synth_options_value=$value
                ;;
            strategy)
                strategy_value=$value
                ;;
            # Add more options here if needed
        esac
    done < "$file"
}

# Ensure the config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: $CONFIG_FILE not found!"
    exit 1
fi

read_config "$CONFIG_FILE"
strategy=$strategy_value
synth_options=$synth_options_value