"""Compile this run's Coq modules after their local dependencies succeed."""
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
from pathlib import Path
import shlex
import subprocess


def compile_modules(modules, run, flags, execute, jobs, completed=()):
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
    command = ['qcp-env', 'coqdep', *mappings, *map(str, paths)]
    result = subprocess.run(command, cwd=run, capture_output=True, text=True, timeout=180)
    (run / 'dependencies.mk').write_text(result.stdout)
    (run / 'coqdep.log').write_text(result.stderr)
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
    with ThreadPoolExecutor(max_workers=jobs) as pool:
        while pending or active:
            for path, item in list(pending.items()):
                if len(active) == jobs:
                    break
                if dependencies[path] <= finished:
                    label = (item['namespace'] or 'relations') + '-' + Path(item['name']).stem
                    future = pool.submit(execute, ['qcp-env', 'coqc', *flags, path], label, 180)
                    active[future] = path
                    del pending[path]
            if not active:
                raise RuntimeError('Cyclic or unresolved local Coq dependencies: ' + str(list(pending)))
            done, _ = wait(active, return_when=FIRST_COMPLETED)
            # Any exception exits the pool only after every submitted task finishes.
            for future in done:
                future.result()
                finished.add(active.pop(future))
