#!/usr/bin/env python3
"""Download SHA-256 pinned tools into vendor/, without modifying system packages.

Needs network access. Existing installations are reused; archives are checked
before extraction. Run with --verify-archives to check only cached downloads.
The system must supply Python 3, Clang/llvm-objdump 14, make, and Lean 4.29.1.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import urllib.request

ROOT = Path(__file__).resolve().parent


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--verify-archives", action="store_true")
    a = p.parse_args()
    vendor = ROOT / "vendor"
    cache = vendor / "archives"
    cache.mkdir(parents=True, exist_ok=True)
    for t in json.loads((ROOT / "tools.lock.json").read_text())["tools"]:
        archive = cache / t["archive"]
        if not a.verify_archives and (vendor / t["marker"]).exists():
            print("Present:", t["name"])
            continue
        if not archive.exists():
            if a.verify_archives:
                raise SystemExit(f"missing archive: {archive}")
            print("Downloading:", t["url"], flush=True)
            temporary = archive.with_suffix(archive.suffix + ".partial")
            urllib.request.urlretrieve(t["url"], temporary)
            temporary.rename(archive)
        if hashlib.sha256(archive.read_bytes()).hexdigest() != t["sha256"]:
            raise SystemExit(f"SHA-256 mismatch: {archive}")
        print("Verified:", t["name"], flush=True)
        if a.verify_archives:
            continue
        destination = vendor / t.get("destination", "")
        destination.mkdir(parents=True, exist_ok=True)
        if t["archive"].endswith(".deb"):
            subprocess.run(["dpkg-deb", "-x", str(archive), str(destination)], check=True)
        else:
            cmd = ["tar", "-xzf", str(archive), "-C", str(destination)]
            if t.get("strip_components"):
                cmd.append(f"--strip-components={t['strip_components']}")
            subprocess.run(cmd, check=True)
        if not (vendor / t["marker"]).exists():
            raise SystemExit(f"archive layout changed: {t['name']}")


if __name__ == "__main__":
    main()
