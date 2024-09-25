import os

def read_config(config_file):
    config_data = {}
    try:
        with open(config_file, 'r') as file:
            for line in file:
                if "=" in line:
                    key, value = line.strip().split('=', 1)
                    config_data[key.strip()] = value.strip()
    except IOError as e:
        print(f"Error reading config file {config_file}: {e}")
    
    return config_data

def find_file(start_dir, target_file):
    matches = []
    
    for root, dirs, files in os.walk(start_dir):
        if target_file in files:
            full_path = os.path.join(root, target_file)
            matches.append(full_path)
    
    return matches

def replace_keywords(file_path, config):
    raptor_path = config.get('raptor_path')
    my_strategy = config.get('my_strategy')
    my_option = config.get('my_option')

    replacements = {
        'raptor --version': raptor_path + ' --version',
        'raptor_path=$(which raptor)': 'raptor_path=' + raptor_path,
        'raptor --batch': raptor_path + ' --batch',
        'strategy="delay"': f'strategy={my_strategy}',
        'synth_options=""': f'synth_options={my_option}'
    }

    try:
        with open(file_path, 'r') as file:
            content = file.read()

        updated_content = content
        for old, new in replacements.items():
            updated_content = updated_content.replace(old, new)

        if updated_content != content:
            with open(file_path, 'w', newline='') as file:
                file.write(updated_content)
            print(f"Replaced keywords in {file_path}")
        else:
            print(f"No changes made in {file_path}")

    except IOError as e:
        print(f"Error processing file {file_path}: {e}")

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    start_directory = script_dir
    config_file = os.path.join(script_dir, 'config.txt')
    
    config = read_config(config_file)
    
    if not config.get('raptor_path') or not config.get('my_strategy') or not config.get('my_option'):
        print(f"Missing parameters in {config_file}. Exiting.")
    else:
        found_files = find_file(start_directory, "raptor_run.sh")
        
        if found_files:
            print(f"Found raptor_run.sh at:")
            for file in found_files:
                print(file)
                replace_keywords(file, config)
        else:
            print(f"No raptor_run.sh found in {start_directory}.")
