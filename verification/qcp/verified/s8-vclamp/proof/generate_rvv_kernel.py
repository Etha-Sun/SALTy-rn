#!/usr/bin/env python3
"""Materialize the unchanged repaired RVV body with checked annotation cuts."""
import argparse,hashlib,json,re,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(text):
    pattern=r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*[\s\S]*?\*/|//[^\n]*|[A-Za-z_]\w*|\d+(?:[uUlL]+)?|>>=|<<=|->|==|!=|<=|>=|&&|\|\||\+\+|--|<<|>>|\+=|-=|\S'
    return [x for x in re.findall(pattern,text) if not x.startswith(('/*','//'))]
def contract():
    text=(CASE/'spec.c').read_text();start=text.index('void test_rvv(');a=text.index('/*@',start);b=text.index('*/',a)+2
    return text[a:b]
def kernel_text():
    raw=(CASE/'impl/testRVV.c').read_text();a=json.loads((CASE/'proof/c/rvv.annotations.json').read_text());body=raw
    for anchor,insert,expected in [('\n{\n','\n{\n'+a['entry']+'\n',1),
       ('  size_t batch64 = batch & ~((size_t)63);','  size_t batch64 = batch & ~((size_t)63);\n'+a['after_mask'],1),
       ('  while (batch64 > 0) {',a['bulk_invariant']+'\n  while (batch64 > 0) {',1),
       ('  while (batch > 0) {',a['tail_invariant']+'\n  while (batch > 0) {',1),
       ('size_t vl = __riscv_vsetvl_e8m8(batch64);','size_t vl = __riscv_vsetvl_e8m8(batch64);\n'+a['bulk_after_vl'],1),
       ('size_t vl = __riscv_vsetvl_e8m8(batch);','size_t vl = __riscv_vsetvl_e8m8(batch);\n'+a['tail_after_vl'],1),
       ('__riscv_vle8_v_i8m8(input, vl)','__riscv_vle8_v_i8m8(input, vl) '+a['where_load'],2)]:
        if body.count(anchor)!=expected:raise ValueError('Annotation anchor occurrences changed: '+anchor)
        body=body.replace(anchor,insert)
    i=body.index('\n{');body=body[:i]+'\n'+contract()+body[i:]
    if tokens(raw)!=tokens(body):raise ValueError('Annotation materialization changed actual repaired C tokens')
    return body

def included_sources(p):
    result=set()
    def visit(q):
        q=q.resolve()
        if q in result:return
        if not q.is_relative_to(CASE):raise ValueError('Include escaped case: '+str(q))
        result.add(q)
        for name in re.findall(r'^\s*#\s*include\s+"([^\"]+)"',q.read_text(),re.M):visit(q.parent/name)
    visit(p)
    return result

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--run-directory',type=Path);p.add_argument('--materialize-only',action='store_true');a=p.parse_args()
    (CASE/'.build').mkdir(exist_ok=True);run=a.run_directory or Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=CASE/'.build'));run.mkdir(parents=True,exist_ok=True);run=run.resolve();out=run/'generated';out.mkdir(exist_ok=True);records=[]
    status={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records}
    def execute(cmd,label,budget):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic();log=run/(label+'.log')
        with log.open('w') as f:
            try:code=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=budget).returncode
            except subprocess.TimeoutExpired:code=124
        records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if code:raise RuntimeError(label+': '+log.read_text()[-7000:])
    try:
        paths=[CASE/'impl/testRVV.c',CASE/'spec.c',CASE/'proof/c/rvv.annotations.json',CASE/'proof/c/rvv_kernel.strategies',CASE/'shim/rvv_frontend.h',CASE/'shim/rvv_frontend.c',CASE/'shim/rvv_kernel_model.h',Path(__file__).resolve()];paths=sorted(set(paths)|included_sources(CASE/'shim/rvv_frontend.c')|included_sources(CASE/'proof/c/rvv_kernel.strategies')|included_sources(CASE/'proof/c/rvv_vectors.strategies'));inputs={str(p.relative_to(CASE)):sha(p) for p in paths}
        prefix='#include "'+str(CASE/'shim/rvv_frontend.c')+'"\n'
        (run/'rvv_unit.raw.c').write_text(prefix+(CASE/'impl/testRVV.c').read_text());(run/'rvv_unit.c').write_text(prefix+kernel_text())
        for src,dest,label in [(run/'rvv_unit.raw.c',run/'rvv-original.i','cpp-original'),(run/'rvv_unit.c',run/'rvv-annotated.i','cpp-annotated')]:execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',dest],label,300)
        if tokens((run/'rvv-original.i').read_text())!=tokens((run/'rvv-annotated.i').read_text()):raise ValueError('Same-frontend CPP C tokens changed')
        # Stable input stem produces rvv_unit_goal.v; retain the original materialization.
        (run/'rvv_unit.input.c').write_bytes((run/'rvv_unit.c').read_bytes());(run/'rvv_unit.c').write_bytes((run/'rvv-annotated.i').read_bytes())
        status.update(same_frontend_cpp_tokens_identical=True,raw_c_sha256=sha(CASE/'impl/testRVV.c'),public_contract_sha256=hashlib.sha256(contract().encode()).hexdigest(),input_sha256=inputs,cpp_sha256=sha(run/'rvv_unit.c'),where_anchor_occurrences=2)
        if not a.materialize_only:
            execute(['qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=2048','--input-file='+str(run/'rvv_unit.c'),'--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',CASE/'shim','S8Clamp','-slp',CASE/'proof/c','S8Clamp'],'qcp',2400)
            goal=out/'rvv_unit_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
            if not fields or not all(f.startswith('test_rvv_') for f in fields):raise ValueError('Expected nonempty actual repaired RVV function interface only')
            status.update(generation_passed=True,actual_c_fields=fields,actual_c_vcs=len(fields),goal_sha256=sha(goal))
        else:status['materialized_only']=True
        if inputs!={str(p.relative_to(CASE)):sha(p) for p in paths}:raise ValueError('Kernel generation inputs changed')
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({'run_directory':str(run),'generation_passed':status['generation_passed'],'error':status.get('error')},indent=2));return 0 if status.get('generation_passed') or status.get('materialized_only') else 1
if __name__=='__main__':raise SystemExit(main())
