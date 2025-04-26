#!/usr/bin/env python3
import os
import json
import argparse

def is_text_file(filepath, blocksize=512):
    """
    Check if a file is likely a text file by trying to decode a small block.
    """
    try:
        with open(filepath, 'rb') as f:
            block = f.read(blocksize)
        block.decode('utf-8')
        return True
    except Exception:
        return False

def scan_directory(path):
    """
    Recursively scans path and returns a dict representing files/folders.
    Returns None if this path should be ignored.
    """
    name = os.path.basename(path) or path
    # Skip any file named exactly "data"
    if os.path.isfile(path) and name == "data":
        return None

    entry = {
        "name": name,
        "path": os.path.abspath(path),
    }

    if os.path.isdir(path):
        entry["type"] = "folder"
        entry["children"] = []
        for item in sorted(os.listdir(path)):
            child_path = os.path.join(path, item)
            child_entry = scan_directory(child_path)
            if child_entry is not None:
                entry["children"].append(child_entry)
    else:
        entry["type"] = "file"
        if is_text_file(path):
            try:
                with open(path, 'r', encoding='utf-8') as f:
                    entry["content"] = f.read()
            except Exception:
                entry["content"] = None
        else:
            entry["content"] = None

    return entry

def main():
    parser = argparse.ArgumentParser(
        description="Recursively scan a directory into JSON, skipping files named 'data'."
    )
    parser.add_argument(
        "path",
        help="Root directory (or single file) to scan"
    )
    parser.add_argument(
        "-o", "--output",
        required=True,
        help="Output JSON file"
    )
    args = parser.parse_args()

    tree = scan_directory(args.path)
    if tree is None:
        print(f"Ignored top‑level file named 'data': {args.path}")
        return

    with open(args.output, "w", encoding="utf-8") as out:
        json.dump(tree, out, indent=2, ensure_ascii=False)

    print(f"Directory tree written to {args.output}")

if __name__ == "__main__":
    main()
