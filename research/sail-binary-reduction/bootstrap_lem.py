#!/usr/bin/env python3
"""Build pinned Lem in vendor/, using unpacked (not system-installed) OCaml."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import urllib.request

ROOT = Path(__file__).resolve().parent


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--cache", type=Path, default=ROOT / "vendor/archives")
    a = p.parse_args()
    a.cache.mkdir(parents=True, exist_ok=True)
    lock = json.loads((ROOT / "lem-tools.lock.json").read_text())
    local = ROOT / "vendor/ocaml-root"
    local.mkdir(parents=True, exist_ok=True)

    def download(name, url, sha):
        file = a.cache / name
        if not file.exists():
            temporary = file.with_suffix(file.suffix + ".partial")
            urllib.request.urlretrieve(url, temporary)
            temporary.rename(file)
        if hashlib.sha256(file.read_bytes()).hexdigest() != sha:
            raise SystemExit(f"SHA256 mismatch: {file}")
        return file

    for item in lock["ubuntu_packages"]:
        file = download("qu8-" + item["Package"] + ".deb",
                        "https://archive.ubuntu.com/ubuntu/" + item["Filename"], item["SHA256"])
        subprocess.run(["dpkg-deb", "-x", str(file), str(local)], check=True)
    rev = lock["lem_revision"]
    archive = download("qu8-lem.tar.gz", f"https://codeload.github.com/rems-project/lem/tar.gz/{rev}",
                       lock["lem_archive_sha256"])
    source = ROOT / "vendor" / ("lem-" + rev)
    if not source.exists():
        subprocess.run(["tar", "-xzf", str(archive), "-C", str(ROOT / "vendor")], check=True)
    lib = local / "usr/lib/ocaml"
    out = ROOT / "out"
    out.mkdir(exist_ok=True)
    conf = out / "ocamlfind.conf"
    conf.write_text(f'destdir="{lib}"\npath="{lib}"\nstdlib="{lib}"\nldconf="{lib}/ld.conf"\n')
    (lib / "ld.conf").write_text(str(lib / "stublibs") + "\n")
    env = {**os.environ, "PATH": str(local / "usr/bin") + ":" + os.environ["PATH"],
           "OCAMLLIB": str(lib), "OCAMLPATH": str(lib), "OCAMLFIND_CONF": str(conf),
           "LIBRARY_PATH": str(local / "usr/lib/x86_64-linux-gnu")}
    with (out / "lem-build.log").open("w") as log:
        subprocess.run(["make", "bin/lem", "LEMVERSION=" + rev], cwd=source, env=env,
                       stdout=log, stderr=subprocess.STDOUT, check=True)
    subprocess.run([str(source / "bin/lem"), "-v"], check=True)


if __name__ == "__main__":
    main()
