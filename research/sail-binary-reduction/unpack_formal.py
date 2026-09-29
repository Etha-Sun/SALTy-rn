#!/usr/bin/env python3
"""Restore readable formal sources beside their SHA256-pinned gzip archives."""
import gzip
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent / "artifacts/formal"


def main():
    manifest = json.loads((ROOT / "Result.json").read_text())
    pending = []
    for name, info in manifest["archives"].items():
        if Path(name).name != name or not name.endswith((".lem.gz", ".thy.gz")):
            raise SystemExit(f"Unexpected archive name: {name}")
        compressed = (ROOT / name).read_bytes()
        if hashlib.sha256(compressed).hexdigest() != info["archive_sha256"]:
            raise SystemExit(f"Archive hash mismatch: {name}")
        data = gzip.decompress(compressed)
        if hashlib.sha256(data).hexdigest() != info["sha256"]:
            raise SystemExit(f"Source hash mismatch: {name}")
        output = ROOT / name[:-3]
        if output.exists() and output.read_bytes() != data:
            raise SystemExit(f"Refusing to overwrite changed source: {output}")
        pending.append((output, data))
    for output, data in pending:
        if not output.exists():
            output.write_bytes(data)
        print(f"{output} ({len(data):,} bytes; SHA256 verified)")
    text = (ROOT / "rv64_kernel.lem").read_text()
    excerpts = ["(* Exact excerpts from rv64_kernel.lem; NOT a standalone module.\n"
                "   No instruction body has been simplified or rewritten. *)\n"]
    for name in ("kernel_step", "execute_VSETVLI", "execute_RMVVTYPE"):
        start = text.index("\nval " + name + " :") + 1
        stop = text.find("\nval ", start + 1)
        if stop < 0:
            stop = len(text)
        line = text[:start].count("\n") + 1
        excerpts.append(f"(* Source: rv64_kernel.lem:{line} *)\n" + text[start:stop] + "\n")
    excerpt_path = ROOT / "Impl.focus.lem.txt"
    content = "\n".join(excerpts)
    if excerpt_path.exists() and excerpt_path.read_text() != content:
        raise SystemExit(f"Refusing to overwrite changed excerpt: {excerpt_path}")
    excerpt_path.write_text(content)
    print(excerpt_path)


if __name__ == "__main__":
    main()
