#!/usr/bin/python3

import os
import sys


def get_dir_containing(dirname, filename):
    current_dir = dirname
    while current_dir and current_dir != '/':
        filepath = os.path.join(current_dir, filename)
        if os.path.exists(filepath):
            return current_dir
        current_dir = os.path.dirname(current_dir)
    # If not found, return the original dirname.
    return dirname


def main(argv):
    if len(argv) < 1:
        sys.exit('usage: {} <filename>'.format(argv[0]))
        return

    filename = argv[1]
    dirname = get_dir_containing(os.getcwd(), filename)
    print(dirname)


if __name__ == '__main__':
    main(sys.argv)
