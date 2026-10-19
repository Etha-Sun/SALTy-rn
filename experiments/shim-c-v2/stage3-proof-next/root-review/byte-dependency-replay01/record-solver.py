#!/usr/bin/env python3
"""Record exact prover input/output, then forward unchanged bytes and exit code."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time

args = sys.argv[1:]
root = Path(os.environ['DEPENDENCY_REPLAY_DIR'])
call = Path(tempfile.mkdtemp(prefix='call-', dir=root))
source = Path(args[-1])
data = source.read_bytes()
(call / 'input.smt2').write_bytes(data)
record = {'argv': args, 'input_sha256': hashlib.sha256(data).hexdigest(),
          'executable_sha256': hashlib.sha256(Path(args[0]).read_bytes()).hexdigest(),
          'started_unix': time.time()}
(call / 'request.json').write_text(json.dumps(record, indent=2) + '\n')
started = time.monotonic()
result = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
(call / 'stdout').write_bytes(result.stdout)
(call / 'stderr').write_bytes(result.stderr)
record.update(exit=result.returncode, seconds=time.monotonic() - started,
              input_unchanged=source.read_bytes() == data,
              stdout_sha256=hashlib.sha256(result.stdout).hexdigest(),
              stderr_sha256=hashlib.sha256(result.stderr).hexdigest())
(call / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
sys.stdout.buffer.write(result.stdout)
sys.stderr.buffer.write(result.stderr)
sys.exit(result.returncode)
