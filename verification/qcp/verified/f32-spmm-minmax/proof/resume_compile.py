#!/usr/bin/env python3
"""Continue this same fresh environment while preserving every successful object.

Keep every earlier failure and successful object identity. This does not import
objects from another run or skip obligations. Explicit source updates are allowed
only for failed/uncompiled modules; successful modules and their dependencies stay exact.
"""
from pathlib import Path
import argparse
import concurrent.futures
import datetime
import hashlib
import json
import re
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parents[1]
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--run', required=True)
p.add_argument('--attempt', required=True)
p.add_argument('--jobs', type=int, default=32)
p.add_argument('--source-updates',type=Path,required=True)
p.add_argument('--added-modules',type=Path,help='explicit newly required modules, compiled from source in this same environment')
p.add_argument('--keep-going',action='store_true')
p.add_argument('--budget-runner', type=Path, required=True)
a = p.parse_args()
assert a.jobs == 32
assert all(re.fullmatch(r'[A-Za-z0-9_-]+', s) for s in [a.run, a.attempt])
sha = lambda f: hashlib.sha256(f.read_bytes()).hexdigest()
O = ROOT / '.build' / a.run / 'compile'
old = json.loads((O / 'result.json').read_text())
dep = json.loads((O / 'manifest.json').read_text())
launch = json.loads((O / 'launch.json').read_text())
flags = json.loads((O / 'flags.json').read_text())
assert not old['passed'] and old['inputs_unchanged'] and old['configured_jobs'] == 32
newdep=json.loads((ROOT/'proof/dependencies.json').read_text())
# Project the live graph to this run's original selected closure. Newly added,
# independent modules are not imported into this environment.
live=newdep
assert live['external_flags']==dep['external_flags']
assert all(live['namespaces'][k]==v for k,v in dep['namespaces'].items())
live_modules={m['path']:m for m in live['modules']}
previous_selected=set(dep['source_paths'])
added=set(json.loads(a.added_modules.read_text())) if a.added_modules else set()
assert added.isdisjoint(previous_selected)
selected=previous_selected|added
assert selected<=set(live_modules)
assert all(d not in live_modules or d in selected for k in selected for d in live_modules[k]['dependencies'])
closure=set()
def visit(k):
    if k in closure:return
    closure.add(k)
    for d in live_modules[k]['dependencies']:
        if d in live_modules:visit(d)
for k in dep['roots']:visit(k)
assert closure==selected,(sorted(selected-closure),sorted(closure-selected))
newdep={**dep,'source_paths':sorted(selected),
        'modules':[live_modules[m['path']] for m in dep['modules']]+[live_modules[k]for k in sorted(added)]}
newmods={m['path']:m for m in newdep['modules']}
allowed=set(json.loads(a.source_updates.read_text()))
assert allowed<=previous_selected

assert sha(Path(launch['coqc'])) == launch['coqc_sha256']
mods = {m['path']: m for m in dep['modules']}
for k, m in mods.items():
    assert sha(O/k)==m['sha256'],k
    assert {x:y for x,y in m.items()if x not in ('sha256','dependencies')}=={x:y for x,y in newmods[k].items()if x not in ('sha256','dependencies')},k
    if k not in allowed:assert m['dependencies']==newmods[k]['dependencies'],k
    assert sha(ROOT/k)==newmods[k]['sha256'],k
assert {k for k,m in mods.items()if m['sha256']!=newmods[k]['sha256']}==allowed
assert all(sha(ROOT/k)==newmods[k]['sha256']for k in added)

records = [r for r in old['records'] if r['exit'] == 0]
done = {r['path'] for r in records}
assert len(done) == len(records)
assert allowed.isdisjoint(done)
assert all(sha(ROOT/k)==mods[k]['sha256']for k in done)
for r in records:
    assert sha((O / r['path']).with_suffix('.vo')) == r['vo_sha256'], r['path']
graph = {k: {d for d in m['dependencies'] if d in newmods} for k,m in newmods.items()}
assert all(graph[k] <= done for k in done)
history = O / 'continuations' / a.attempt
history.mkdir(parents=True, exist_ok=False)
for name in ['result.json', 'records.json', 'progress.json', 'manifest.json', 'launch.json', 'flags.json']:
    shutil.copy2(O / name, history / name)
updates=[]
for k in sorted(allowed):
    dest=history/'previous-sources'/k;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/k,dest)
    updates.append({'path':k,'old_sha256':mods[k]['sha256'],'new_sha256':newmods[k]['sha256']})
    assert not(O/k).with_suffix('.vo').exists(),k
    shutil.copy2(ROOT/k,O/k)
for k in sorted(added):
    assert not(O/k).exists(),k
    (O/k).parent.mkdir(parents=True,exist_ok=True)
    shutil.copy2(ROOT/k,O/k)
    launch['module_memory_gib'][k]=16
launch['module_count']=len(newmods)
(O/'launch.json').write_text(json.dumps(launch,indent=2)+'\n')
dep=newdep;mods=newmods
(O/'manifest.json').write_text(json.dumps(dep,indent=2)+'\n')
failed_before = set(old['failed'])
assert failed_before.isdisjoint(done)
for k in failed_before:
    dest = O / k
    assert not dest.with_suffix('.vo').exists(), k
    for suffix in ['.log', '.glob', '.budget']:
        src = dest.with_suffix(suffix)
        if src.exists():
            target = history / 'failed' / k
            target = target.with_suffix(suffix)
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(src, target)
start = time.monotonic()
meta = {
    'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'configured_jobs': 32, 'attempt': a.attempt,
    'scope': 'Same fresh environment; exact successful source/object identities; explicitly listed failed/uncompiled proof-source updates only; no foreign local objects',
    'source_updates':updates,
    'added_modules':[newmods[k]for k in sorted(added)],
    'closure_policy':'Successful sources, objects and direct dependencies unchanged; failed/uncompiled updates explicit; added dependencies compiled freshly here, no imported local objects',
    'previous_manifest_sha256':sha(history/'manifest.json'),
    'source_manifest_sha256': sha(O / 'manifest.json'),
    'runner_sha256': sha(Path(__file__)),
    'previous_result_sha256': sha(history / 'result.json'),
    'preserved_successful_modules': len(done), 'retry_first': sorted(failed_before),
}
(history / 'resume-launch.json').write_text(json.dumps(meta, indent=2) + '\n')


def run(k):
    dest = O / k
    mem = launch['module_memory_gib'][k]
    t = time.monotonic()
    cmd = ['python3', str(a.budget_runner.resolve()), '--out', str(dest.with_suffix('.budget')),
           '--timeout', '7230', '--reserve-gib', str(mem), '--memory-gib', str(mem), '--',
           '/usr/bin/prlimit', '--as=' + str(mem * 2**30), '--cpu=7200', '--',
           launch['coqc'], *flags, str(dest)]
    with dest.with_suffix('.log').open('w') as out:
        result = subprocess.run(cmd, stdout=out, stderr=subprocess.STDOUT, cwd=O)
    budget_path=dest.with_suffix('.budget')/'result.json'
    budget=json.loads(budget_path.read_text())if budget_path.exists()else{}
    budget_ok='seconds'in budget and budget.get('kind')!='service_or_resource_failure'
    proof_object=dest.with_suffix('.vo').exists()
    rc=result.returncode
    if rc==0 and(not proof_object or not budget_ok or budget.get('exit_code')!=0):rc=125
    return {'path':k,'exit':rc,'launcher_exit':result.returncode,'proof_object_exists':proof_object,'budget_ok':budget_ok,'seconds': round(time.monotonic() - t, 3),
            'memory_gib': mem, 'source_sha256': sha(dest),
            'vo_sha256': sha(dest.with_suffix('.vo')) if dest.with_suffix('.vo').exists() else None,
            'log': str(dest.with_suffix('.log').relative_to(O)), 'continuation': a.attempt}


pending = set(mods) - done
failed = []
futures = {}


def save():
    progress = {'completed': len(done), 'total': len(mods), 'active': len(futures),
                'pending': len(pending), 'failed': failed,
                'seconds': round(old['seconds'] + time.monotonic() - start, 1),
                'continuation': a.attempt}
    (O / 'progress.json').write_text(json.dumps(progress, indent=2) + '\n')
    (O / 'records.json').write_text(json.dumps(records, indent=2) + '\n')


# Retry failed ready modules through the same dependency scheduler and32-worker pool.
with concurrent.futures.ThreadPoolExecutor(max_workers=32) as pool:
    while pending or futures:
        ready = sorted((k for k in pending if graph[k] <= done), key=lambda k:(k not in failed_before,k))
        while ready and len(futures) < 32 and (not failed or a.keep_going):
            k = ready.pop(0)
            pending.remove(k)
            futures[pool.submit(run, k)] = k
        if not futures:
            break
        completed, _ = concurrent.futures.wait(futures, return_when=concurrent.futures.FIRST_COMPLETED)
        for future in completed:
            k = futures.pop(future)
            r = future.result()
            records.append(r)
            if r['exit']:
                failed.append(k)
                print('FAIL', k, flush=True)
            else:
                done.add(k)
        save()
unchanged = all(sha(ROOT / k) == sha(O / k) == m['sha256'] for k, m in mods.items())
result = {'passed': len(done) == len(mods) and not failed and unchanged,
          'fresh_modules': len(done), 'total_modules': len(mods), 'configured_jobs': 32,
          'seconds': old['seconds'] + time.monotonic() - start, 'failed': failed,
          'not_compiled': sorted(pending), 'inputs_unchanged': unchanged,
          'roots': dep['roots'], 'records': records,
          'continuations': old.get('continuations', []) + [meta]}
(O / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
print({k: v for k, v in result.items() if k not in ['records', 'not_compiled', 'roots', 'continuations']}, flush=True)
raise SystemExit(not result['passed'])
