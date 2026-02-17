import difflib
import os

def compare_files(file1_path, file2_path):
    """
    Compares two text files and prints the differences in a human-readable format.
    """
    # Ensure files exist before attempting to open
    if not os.path.exists(file1_path):
        print(f"Error: {file1_path} not found.")
        return
    if not os.path.exists(file2_path):
        print(f"Error: {file2_path} not found.")
        return

    try:
        with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
            file1_lines = file1.readlines()
            file2_lines = file2.readlines()
    except IOError as e:
        print(f"Error reading files: {e}")
        return

    differ = difflib.Differ()
    diff = list(differ.compare(file1_lines, file2_lines))

    print(f"\n--- Differences between {file1_path} and {file2_path} ---")
    has_differences = False
    for line in diff:
        if line.startswith('+') or line.startswith('-') or line.startswith('?'):
            has_differences = True
        print(line, end='')
    
    if not has_differences:
        print("The files are identical (no differences found).")

# Example Usage:
# Define the paths to your files
# Make sure to replace 'path/to/file1.txt' and 'path/to/file2.txt' with your actual file paths
file_a = 'path/to/file1.txt'
file_b = 'path/to/file2.txt'

# Call the function to compare the files
compare_files(file_a, file_b)
