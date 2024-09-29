#!/bin/bash

# Get the absolute path of the repository's root directory
ROOT_PATH=$(git rev-parse --show-toplevel)

# Set the absolute path for config.txt
config_txt_path="$ROOT_PATH/scripts/config.txt"

# Step 1: Read values from config.txt
while IFS='=' read -r key value; do
  key=$(echo $key | tr -d ' ')     # Remove spaces from the key
  value=$(echo $value | tr -d '"' ) # Remove quotes from the value
  
  # Assign values to variables
  case "$key" in
    raptor_path) raptor_path=$value ;;
    my_strategy) my_strategy=$value ;;
    my_option) my_option=$value ;;
  esac
done < "$config_txt_path"

# Step 2: Replace strategy="delay" and synth_option="" in raptor_run.sh
sed -i "s/strategy=\"delay\"/strategy=\"$my_strategy\"/" raptor_run.sh
sed -i "s/synth_options=\"\"/synth_options=\"$my_option\"/" raptor_run.sh

# Step 3: Replace raptor with raptor_path for specific commands
sed -i "s|raptor --version|$raptor_path --version|" raptor_run.sh
sed -i "s|raptor >/dev/null|$raptor_path >/dev/null|" raptor_run.sh
sed -i "s|which raptor|which $raptor_path|" raptor_run.sh
sed -i "s|raptor --batch|$raptor_path --batch|" raptor_run.sh
