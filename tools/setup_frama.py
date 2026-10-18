"""Extract the pinned official Linux x86_64 Frama-C bundle into a local directory."""
import argparse
import hashlib
from pathlib import Path
import subprocess
import urllib.request

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--directory', type=Path, default=Path(__file__).resolve().parent / '.local/frama-c')
args = parser.parse_args()
target = args.directory.resolve()
target.mkdir(parents=True, exist_ok=True)
archive = target / 'frama-c-33.0.run'
url = 'https://www.frama-c.com/download/frama-c-linux-x86-64-33.0-Arsenic.run'
expected = 'c754c31bb32d151acf7db3bcfdc5181b076bdbff813b19049e984f639eba3735'
if not archive.exists():
    urllib.request.urlretrieve(url, archive)
digest = hashlib.sha256()
with archive.open('rb') as source:
    for chunk in iter(lambda: source.read(1024 * 1024), b''):
        digest.update(chunk)
if digest.hexdigest() != expected:
    raise SystemExit('Archive checksum mismatch; extraction refused.')
bundle = target / 'bundle'
if not (bundle / 'bin/frama-c').exists():
    subprocess.run(['sh', str(archive), '--noexec', '--target', str(bundle)], check=True)
subprocess.run([str(bundle / 'bin/frama-c'), '-version'], check=True)
print('FRAMAC=' + str(bundle / 'bin/frama-c'))
