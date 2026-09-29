#!/usr/bin/env python3
"""Generate the RVV kernel with upstream Sail semantics, check Lem, export HOL."""
import argparse
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parent


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--timeout", type=int, default=1200, help="maximum seconds per generation/check")
    a = p.parse_args()
    rev = json.loads((ROOT / "lem-tools.lock.json").read_text())["lem_revision"]
    if not (ROOT / "vendor" / ("lem-" + rev) / "bin/lem").exists():
        subprocess.run([sys.executable, str(ROOT / "bootstrap_lem.py")], check=True)
    for script, args in [
        ("formal_attempt.py", ["rvv", "--backend", "lem", "--kernel"]),
        ("check_lem.py", []),
        ("check_lem.py", ["--target", "isabelle"]),
    ]:
        subprocess.run([sys.executable, str(ROOT / script), *args, "--timeout", str(a.timeout)], check=True)
    print("Lem checked; Isabelle source generated. Isabelle checking and kernel proof are NOT completed.")


if __name__ == "__main__":
    main()
