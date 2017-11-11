import os
import argparse
from shutil import copytree


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="vim_projects")
    parser.add_argument("--name", help="Name of template project")
    parser.add_argument("--dir", help="Directory containing templates")

    args = parser.parse_args()

    if args.name is None:
        raise ValueError("Missing argument name")

    if args.dir is None:
        raise ValueError("Missing argument dir")

    current_dir = os.getcwd()
    copytree(current_dir, args.dir + os.sep + args.name + os.sep)
