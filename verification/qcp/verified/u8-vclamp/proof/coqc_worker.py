"""Ordinary Coq compiler with isolated caches, finite limits and peak-RSS evidence."""
from pathlib import Path
import hashlib, json, os, resource, subprocess, sys, time

root = Path.cwd().resolve(); env = json.loads((root.parent/'environment.json').read_text())
args = sys.argv[1:]; source = next(Path(s).resolve() for s in reversed(args) if s.endswith('.v'))
relative = source.relative_to(root); work = root/'.work'/relative.with_suffix('')
work.mkdir(parents=True, exist_ok=False)
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
before = sha(source); args = [str(source) if s.endswith('.v') else s for s in args]
assert not set(args) & {'-vos','-vok','-quick'}
if relative.as_posix() in ['U8PackedKernel/unit_goal.v','RvvRepair/unit_goal.v']:
    args = ['-require-import','U8PackedKernel.Prelude',*args]
cmd = [env['coqc'],'-time',*args]
resource.setrlimit(resource.RLIMIT_AS,(16*1024**3,)*2)
resource.setrlimit(resource.RLIMIT_CPU,(1800,1805))
start = time.monotonic()
with (work/'coqc.log').open('w') as log:
    try: rc = subprocess.run(cmd,cwd=work,stdout=log,stderr=subprocess.STDOUT,
                             timeout=1815,env={**os.environ,'COQPATH':''}).returncode
    except subprocess.TimeoutExpired: rc = 124
record = dict(source=str(relative),command=cmd,exit=rc,seconds=time.monotonic()-start,
              source_sha256=before,source_unchanged=before==sha(source),
              object_sha256=sha(source.with_suffix('.vo')) if rc==0 else None,
              peak_RSS_KiB=resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss)
(work/'result.json').write_text(json.dumps(record,indent=2)+'\n')
print('ORDINARY_COQC',relative,rc,round(record['seconds'],2),flush=True)
raise SystemExit(0 if rc==0 and record['source_unchanged'] else 1)
