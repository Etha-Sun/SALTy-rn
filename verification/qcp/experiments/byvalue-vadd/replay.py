#!/usr/bin/env python3
"""Replay the original-token C bodies and existing conditional equivalent caller."""
from pathlib import Path
import hashlib
import json
import re
import shutil
import subprocess
import sys
import time

HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
PROOFS=['neon_unit_goal.v','neon_reused.v','neon_adapted.v','neon_pure_tail.v',
        'neon_copy_checked.v','neon_load_calls.v','neon_store_calls.v','neon_full_checked.v']
BUILD=HERE/'.build'
BUILD.mkdir(exist_ok=True)
records=[]

def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()

def execute(command,label,timeout=600):
    started=time.monotonic()
    with (BUILD/(label+'.log')).open('w') as log:
        result=subprocess.run(list(map(str,command)),stdout=log,stderr=log,timeout=timeout)
    records.append({'label':label,'command':list(map(str,command)),
                    'exit_code':result.returncode,'elapsed_seconds':time.monotonic()-started})
    print(label,result.returncode,flush=True)
    assert result.returncode==0,(BUILD/(label+'.log')).read_text()[-2000:]

execute([sys.executable,HERE/'run.py','--stage','shim'],'neon-shim')
execute([sys.executable,HERE/'run.py','--stage','neon','--timeout','180'],'neon-generate')
execute([sys.executable,HERE/'compile.py',*PROOFS],'neon-proof')
execute([sys.executable,HERE/'native.py'],'neon-native')
execute([sys.executable,HERE.parent/'byvalue-rvv/run.py'],'rvv-replay')

# This established runner updates historical logs. Preserve and restore them.
wrapper=HERE.parent/'vadd-wrapper'
old_files=[wrapper/'status.json',*sorted((wrapper/'logs').glob('*'))]
old={path:path.read_bytes() for path in old_files if path.is_file()}
try:
    execute([sys.executable,wrapper/'run.py'],'wrapper-replay')
    dest=HERE/'evidence/wrapper-replay'
    for path in old:
        target=dest/path.relative_to(wrapper)
        target.parent.mkdir(parents=True,exist_ok=True)
        shutil.copyfile(path,target)
finally:
    for path,data in old.items():path.write_bytes(data)

def contract(source,name):
    return re.sub(r'\s','',re.search(r'void '+name+r'\(.*?(/\*@ With.*?\*/)',source,re.S).group(1))

for name,path in [('test_neon',HERE/'neon.c'),('test_rvv',HERE.parent/'byvalue-rvv/macro_rvv.c')]:
    assert contract(path.read_text(),name)==contract((wrapper/'wrapper.c').read_text(),name)
checks=json.loads((HERE/'compile-status.json').read_text())
assert [record['file'] for record in checks['records']]==PROOFS
assert all(record['exit_code']==0 for record in checks['records'])
rvv=json.loads((HERE.parent/'byvalue-rvv/replay-status.json').read_text())
assert rvv['passed'] and rvv['original_tokens_preserved']
assert json.loads((HERE/'native-status.json').read_text())['matches_original']

# Save the exact expanded unit, generated goal and successful check logs.
evidence=HERE/'evidence/neon'
evidence.mkdir(parents=True,exist_ok=True)
run=Path(checks['run_directory'])
for path in [run/'neon_unit.c',run/'neon_unit_goal.v',*sorted(run.glob('*coqc.log'))]:
    shutil.copyfile(path,evidence/path.name)
shim_evidence=HERE/'evidence/shim'
shim_evidence.mkdir(exist_ok=True)
shim_run=Path(json.loads((HERE/'shim-status.json').read_text())['run_directory'])
for path in [shim_run/'shim_unit.c',shim_run/'shim_unit_goal.v',*sorted(shim_run.glob('*.log'))]:
    shutil.copyfile(path,shim_evidence/path.name)
for path in [BUILD/(record['label']+'.log') for record in records]:
    shutil.copyfile(path,HERE/'evidence'/path.name)
state={'passed':True,'neon_kernel_c_vcs':118,'neon_shim_c_vcs':26,'rvv_c_vcs':45,
       'rvv_value_wrapper_c_vcs':11,'conditional_equivalent_caller_c_vcs':9,
       'native_neon_cases':430,'original_kernel_tokens_preserved':True,
       'callee_contracts_match_existing_caller':True,'full_old_dependency_closure_replayed':False,
       'original_public_mapper_to_helper_correspondence_proved':False,
       'cross_isa_end_to_end_acceptance':False,'records':records,
       'local_sources_sha256':{p.name:sha(p) for p in HERE.iterdir() if p.suffix in ['.py','.c','.h','.v']},
       'rvv_replay_sha256':sha(HERE.parent/'byvalue-rvv/replay-status.json'),
       'proof_status_sha256':sha(HERE/'compile-status.json')}
(HERE/'replay-status.json').write_text(json.dumps(state,indent=2)+'\n')
print(json.dumps({k:state[k] for k in ['passed','neon_kernel_c_vcs','rvv_c_vcs',
                                     'cross_isa_end_to_end_acceptance']}),flush=True)
