#!/usr/bin/env python3
"""Diagnose current declarations against historical goals; no proof credit.
The complete frozen gate must independently regenerate every current C unit.
"""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import json,os,subprocess,tempfile,time
from full_inputs import CASE,units,render_unit,sha

def main():
    run=Path(tempfile.mkdtemp(prefix='current-cpp-drift-goals-',dir=CASE/'.build'))
    selected={'output_active','public_compare','wrapper_unit'}
    rows=[r for r in units(require_checked=False)if r['stem']in selected]
    assert {r['stem']for r in rows}==selected
    def check(unit):
        folder=run/unit['stem'];folder.mkdir();rendered=render_unit(unit)
        source=folder/'current.c';source.write_text(rendered['text']);cpp=folder/(unit['stem']+'.c')
        records=[]
        for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(source),'-o',str(cpp)]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(cpp),'--coq-output-dir='+str(folder),'--coq-logic-path=Qu8Rdsum','-slp',str(CASE/'shim'),'Qu8Rdsum','-slp',str(CASE/'proof/c'),'Qu8Rdsum'])]:
            cmd=['prlimit','--as=17179869184:17179869184','--',*cmd];log=folder/(label+'.log');start=time.monotonic()
            with log.open('w')as f:code=subprocess.run(cmd,cwd=folder,stdout=f,stderr=f,timeout=7200).returncode
            records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-start,log_sha256=sha(log)))
            assert code==0,(unit['stem'],label,log.read_text()[-1500:])
        goal=folder/(unit['stem']+'_goal.v');same=sha(goal)==unit['goal_sha256']
        result=dict(stem=unit['stem'],passed=same,exit_code=0,current_cpp_sha256=sha(cpp),current_goal_sha256=sha(goal),expected_goal_sha256=unit['goal_sha256'],records=records)
        (folder/'status.json').write_text(json.dumps(result,indent=2)+'\n');print(unit['stem'],same,flush=True);assert same,'Goal changed';return result
    with ThreadPoolExecutor(max_workers=32)as pool:records=list(pool.map(check,rows))
    result=dict(passed=True,formal_proof=False,whole_kernel_verified=False,scope='Only declaration drift diagnostic; identical generated goals do not establish their proofs',run_directory=str(run),parallel_jobs=32,per_process_memory_GiB=16,records=records)
    (run/'status.json').write_text(json.dumps(result,indent=2)+'\n');(CASE/'proof/current-cpp-drift-status.json').write_text(json.dumps(result,indent=2)+'\n');print('RUN',run,flush=True)
if __name__=='__main__':main()
