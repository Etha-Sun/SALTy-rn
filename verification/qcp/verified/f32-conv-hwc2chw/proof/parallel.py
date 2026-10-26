# Framework implementation migration only; no proof or certificate credit.
"""Compile this run's Coq modules after their local dependencies succeed."""
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
from pathlib import Path
import shlex
import subprocess
import json
import hashlib
import time


def compile_modules(modules, run, flags, execute, jobs, completed=(), live_limit_file=None):
    if jobs < 1:
        raise ValueError('jobs must be positive')
    run = Path(run).resolve()
    paths = [(run / item['path']).resolve() for item in modules]
    if len(set(paths)) != len(paths):
        raise ValueError('Duplicate Coq module path')
    finished = {Path(path) for path in completed}
    if any(not path.is_absolute() or path not in paths for path in finished):
        raise ValueError('completed must contain absolute module paths from this run')

    mappings = []
    position = 0
    while position < len(flags):
        if flags[position] in ('-Q', '-R'):
            mappings.extend(flags[position:position + 3])
            position += 3
        else:
            position += 1
    command = ['prlimit','--as=17179869184:17179869184','--','qcp-env', 'coqdep', *mappings, *map(str, paths)]
    started=time.monotonic()
    result = subprocess.run(command, cwd=run, capture_output=True, text=True, timeout=180)
    (run / 'dependencies.mk').write_text(result.stdout)
    (run / 'coqdep.log').write_text(result.stderr)
    (run/'coqdep-status.json').write_text(json.dumps({'command':command,'exit_code':result.returncode,'seconds':time.monotonic()-started,'stdout_sha256':hashlib.sha256((run/'dependencies.mk').read_bytes()).hexdigest(),'stderr_sha256':hashlib.sha256((run/'coqdep.log').read_bytes()).hexdigest()},indent=2)+'\n')
    if result.returncode:
        raise RuntimeError('coqdep failed: ' + result.stderr[-3000:])

    local = {path.with_suffix('.vo'): path for path in paths}
    dependencies = {path: set() for path in paths}
    seen = set()
    for line in result.stdout.replace('\\\n', ' ').splitlines():
        targets, separator, prerequisites = line.partition(':')
        if not separator:
            continue
        targets = [(run / word).resolve() for word in shlex.split(targets)]
        needed = {(run / word).resolve() for word in shlex.split(prerequisites)}
        for target in targets:
            if target in local:
                source = local[target]
                seen.add(source)
                dependencies[source].update(local[node] for node in needed if node in local)
    if seen != set(paths):
        raise RuntimeError('coqdep omitted local modules: ' + str(sorted(set(paths) - seen)))

    pending = {path: item for path, item in zip(paths, modules) if path not in finished}
    active = {}
    held_since = None
    with ThreadPoolExecutor(max_workers=jobs) as pool:
        while pending or active:
            limit = jobs
            if live_limit_file is not None:
                limit = min(jobs, int(json.loads(Path(live_limit_file).read_text())['live_admission_slots']))
                if limit < 0:
                    raise ValueError('Live admission slots must be nonnegative')
            for path, item in list(pending.items()):
                if len(active) >= limit:
                    break
                if dependencies[path] <= finished:
                    label = (item['namespace'] or 'relations') + '-' + Path(item['name']).stem
                    future = pool.submit(execute, ['qcp-env', 'coqc', *flags, path], label, 180)
                    active[future] = path
                    del pending[path]
            if not active and limit == 0:
                held_since = held_since or time.monotonic()
                if time.monotonic() - held_since >= 1800:
                    raise RuntimeError('Finite admission hold expired with unstarted modules')
                time.sleep(1)
                continue
            held_since = None
            if not active:
                raise RuntimeError('Cyclic or unresolved local Coq dependencies: ' + str(list(pending)))
            done, _ = wait(active, return_when=FIRST_COMPLETED)
            # Any exception exits the pool only after every submitted task finishes.
            for future in done:
                future.result()
                finished.add(active.pop(future))
