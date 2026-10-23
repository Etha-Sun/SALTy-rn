#!/usr/bin/env python3
"""Exact original NEON plus public contract and fail-closed proof comments."""
import hashlib,json,re,subprocess,tempfile
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def text():
    identity=json.loads((CASE/'proof/originals.json').read_text())['files']['neon']
    if sha(CASE/'impl/testNEON.c')!=identity['sha256'] or sha(ROOT/identity['path'])!=identity['sha256']:raise ValueError('Original NEON identity changed')
    raw=(CASE/'impl/testNEON.c').read_text();spec=(CASE/'spec.c').read_text();at=spec.index('void test_neon(')
    contract=re.search(r'/\*@.*?\*/',spec[at:],re.S).group()
    if not re.search(r'\bRequire\b',contract) or not re.search(r'\bEnsure\b',contract) or raw.count('\n{')!=1:raise ValueError('Missing unique public contract/body')
    annotated=raw.replace('\n{','\n'+contract+'\n{',1)
    ann=json.loads((CASE/'proof/c/neon.annotations.json').read_text())
    if tokens(ann['entry_cut']):raise ValueError('Executable entry cut')
    annotated=annotated.replace('\n{','\n{\n'+ann['entry_cut'],1)
    for anchor,key in [('  for (; batch >= 64;','bulk_invariant'),('  for (; batch >= 8;','tail_invariant')]:
        if annotated.count(anchor)!=1 or tokens(ann[key]):raise ValueError('Unknown loop annotation shape')
        annotated=annotated.replace(anchor,ann[key]+'\n'+anchor)
    for anchor,rule in ann['where'].items():
        if annotated.count(anchor)!=rule['count']:raise ValueError('Unknown call shape: '+anchor)
        comment='/*@ where '+rule['binding']+' */'
        if tokens(comment):raise ValueError('Executable annotation')
        annotated=annotated.replace(anchor,anchor+' '+comment)
    anchor='    if (batch & 4) {'
    if annotated.count(anchor)!=1 or tokens(ann['tail_exposure']):raise ValueError('Unknown final byte tail shape')
    annotated=annotated.replace(anchor,ann['tail_exposure']+'\n'+anchor,1)
    if tokens(raw)!=tokens(annotated):raise ValueError('Original executable tokens changed')
    frontend='#include "'+str(CASE/'shim/neon_frontend.h')+'"\n'
    return frontend+annotated,frontend+raw
def main():
    run=Path(tempfile.mkdtemp(prefix='neon-unit-',dir=CASE/'.build'));status={'passed':False,'whole_kernel_verified':False,'scope':'fresh goal generation only','run_directory':str(run),'records':[]}
    try:
        current,raw=text();(run/'neon_unit.c').write_text(current);(run/'original.c').write_text(raw)
        for stem in ['neon_unit','original']:
            cmd=['gcc','-E','-P','-CC','-nostdinc',str(run/(stem+'.c')),'-o',str(run/(stem+'-expanded.c'))]
            with (run/(stem+'-cpp.log')).open('w') as out:r=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=120)
            status['records'].append({'label':stem+'-cpp','command':cmd,'exit_code':r.returncode})
            if r.returncode:raise RuntimeError('CPP failed')
        if tokens((run/'neon_unit-expanded.c').read_text())!=tokens((run/'original-expanded.c').read_text()):raise ValueError('Same-frontend CPP token mismatch')
        (run/'neon_unit.c').write_bytes((run/'neon_unit-expanded.c').read_bytes());out=run/'generated';out.mkdir()
        cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit','1024','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',str(CASE/'shim'),'S8Clamp','-slp',str(CASE/'proof/c'),'S8Clamp']
        with (run/'qcp.log').open('w') as log:r=subprocess.run(cmd,cwd=run,stdout=log,stderr=log,timeout=1200)
        status['records'].append({'label':'qcp','command':cmd,'exit_code':r.returncode})
        if r.returncode:raise RuntimeError((run/'qcp.log').read_text()[-3000:])
        goal=out/'neon_unit_goal.v'
        if re.search(r'\(\s*0\s*\)\s*#\s*"int8x8_t"',goal.read_text()):raise ValueError('Unused ghost zero became a real vector field address')
        fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        status.update(passed=True,kernel_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(run/'neon_unit-expanded.c'),same_frontend_cpp_tokens_identical=True)
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status,indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
