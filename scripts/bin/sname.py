#!/usr/bin/env python
import sys

def main(student_name: str):
    full_name = " ".join(student_name).title()
    print(full_name)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <student_name>")
        sys.exit(1)

    main(sys.argv[1:])
