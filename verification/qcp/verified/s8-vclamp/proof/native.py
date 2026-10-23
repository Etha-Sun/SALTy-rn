#!/usr/bin/env python3
"""Native original/repaired replay; finite evidence, not QCP or ISA proof."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import time

CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--variant',choices=['original','repaired'],default='repaired')
    args=parser.parse_args()
    run=Path(tempfile.mkdtemp(prefix='native-'+args.variant+'-',dir=CASE/'.build'))
    records=[]
    status={'passed':False,'variant':args.variant,'scope':'finite native C-shim regression',
            'whole_kernel_verified':False,'qcp_c_vcs':0,'actual_hardware_executed':False,
            'run_directory':str(run),'records':records}
    def execute(cmd,label):
        log=run/(label+'.log');start=time.monotonic()
        # ASan reserves a large, nonresident shadow mapping; RLIMIT_AS rejects
        # startup even though this bounded replay allocates only small buffers.
        # Compile/patch processes use the normal 16-GiB virtual-address cap.
        if label!='replay':cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]
        with log.open('w') as f:
            result=subprocess.run(list(map(str,cmd)),cwd=run,stdout=f,stderr=f,timeout=300,
                                  env={**os.environ,'ASAN_OPTIONS':'detect_leaks=1:abort_on_error=1','UBSAN_OPTIONS':'halt_on_error=1'})
        records.append({'label':label,'command':list(map(str,cmd)),'exit_code':result.returncode,
                        'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if result.returncode: raise RuntimeError(label+': '+log.read_text()[-3000:])
        return log.read_text()
    try:
        originals=json.loads((CASE/'proof/originals.json').read_text())
        repair=json.loads((CASE/'proof/repair.json').read_text())
        for item in originals['files'].values():
            if sha(ROOT/item['path'])!=item['sha256']:raise ValueError('Original source identity changed')
        if sha(CASE/'impl/testNEON.c')!=originals['files']['neon']['sha256']:raise ValueError('NEON identity changed')
        if (sha(CASE/'impl/testRVV.c')!=repair['repaired_rvv_sha256'] or
                sha(CASE/'proof/repair.patch')!=repair['patch_sha256']):raise ValueError('Repair identity changed')
        (run/'patch/impl').mkdir(parents=True)
        shutil.copyfile(ROOT/originals['files']['rvv']['path'],run/'patch/impl/testRVV.c')
        execute(['patch','--batch','--fuzz=0','-p1','-d',run/'patch','-i',CASE/'proof/repair.patch'],'exact-patch')
        if (run/'patch/impl/testRVV.c').read_bytes()!=(CASE/'impl/testRVV.c').read_bytes():raise ValueError('Patch is not exact')
        selected=ROOT/originals['files']['rvv']['path'] if args.variant=='original' else CASE/'impl/testRVV.c'
        shutil.copyfile(selected,run/'selected-rvv.c')
        files=['spec.c','impl/testNEON.c','impl/testRVV.c','shim/runtime.h','shim/harness.c',
               'proof/originals.json','proof/repair.json','proof/repair.patch','proof/native.py']
        source_hashes={n:sha(CASE/n) for n in files}
        compiler=shutil.which('gcc')
        cmd=[compiler,'-std=c11','-O1','-g','-Wall','-Wextra','-Werror','-fno-omit-frame-pointer',
             '-fsanitize=address,undefined','-fno-pie','-no-pie','-include',CASE/'shim/runtime.h',
             CASE/'impl/testNEON.c',run/'selected-rvv.c',CASE/'spec.c',CASE/'shim/harness.c','-o',run/'replay']
        execute(cmd,'compile')
        checks=json.loads(execute([run/'replay',args.variant],'replay'))
        if args.variant=='repaired' and checks['disagreements']!=0:raise ValueError('Repaired outputs differ')
        if args.variant=='original' and checks['disagreements']==0:raise ValueError('Original counterexamples were lost')
        if source_hashes!={n:sha(CASE/n) for n in files}:raise ValueError('Inputs changed during native replay')
        status.update(passed=True,checks=checks,input_sha256=source_hashes,
                      selected_rvv_sha256=sha(selected),patch_exact_application_checked=True,
                      compiler_sha256=sha(compiler),asan_ubsan_checked=True,
                      oracle='Independent scalar signed-byte narrowing and initial-n bulk64/remainder schedule',
                      limits=['Finite native C-shim checks only, not QCP proof or physical ISA execution',
                              'Fixed VLEN128/SEW8/LMUL8/VLMAX128 and legal vl=min(AVL,128)',
                              'All signed-byte bounds permitted, including narrowed min>max; int32 params use two-complement low-byte conversion'])
    except Exception as e:
        status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof'/(args.variant+'-native-status.json')
    if dest.exists():
        old=dest.read_bytes();(CASE/'proof/history'/(dest.stem+'-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checks':status.get('checks')},indent=2))
    return 0 if status['passed'] else 1

if __name__=='__main__':raise SystemExit(main())
