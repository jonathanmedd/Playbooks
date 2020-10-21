#!/usr/bin/python3

import glob
import yaml
import sys
import argparse

parser = argparse.ArgumentParser(description='Process args')
parser.add_argument("--files")

args = parser.parse_args()
files = args.files
print(files)

# files = glob.glob('*.yml', recursive=True)

for f in files:
    if f.lower().endswith('.yml'):
        with open(f, 'r') as stream:
            try:
                yaml.safe_load(stream)
                print("OK ", f)
            except yaml.YAMLError as err:
                print(err)
                sys.exit(1)
