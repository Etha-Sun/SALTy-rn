#!/usr/bin/env python3
"""Retain real original C counterexamples and source INT32_MIN UBSan witness.
This produces finite counterexample evidence, zero formal proof credit.
"""
import hashlib,json,re,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def scalar_reference(raw):
    # Python unbounded integers directly implement the reviewed ARM rule for
    # the single-byte witness a=1,b=0,multipliers1/0,zero points0.
    control=(-raw)%256
    if control>=128:control-=256
    acc=1
    if control>=0:acc=(acc*(1<<control))%(1<<32);acc=acc-(1<<32)if acc>=(1<<31)else acc
    else:
        right=-control;acc=(acc+(1<<(right-1)))//(1<<right)
    return min(127,max(-128,min(32767,max(-32768,acc))))
def main():
    run=Path(tempfile.mkdtemp(prefix='counterexamples-',dir=CASE/'.build'));records=[];s=dict(passed=False,formal_proof=False,whole_kernel_verified=False,scope='actual original/repaired C counterexample replay, not whole-domain proof',run_directory=str(run),records=records)
    def exe(label,cmd,zero=True):
        log=run/(label+'.log');t=time.monotonic()
        with log.open('w')as f:r=subprocess.run(list(map(str,cmd)),cwd=run,stdout=f,stderr=f,timeout=300)
        records.append(dict(label=label,command=list(map(str,cmd)),exit_code=r.returncode,expected_zero=zero,seconds=time.monotonic()-t,log_sha256=sha(log)))
        if (r.returncode==0)!=zero:raise RuntimeError(label+': '+log.read_text()[-2500:])
        return log
    try:
        names=['proof/check_counterexamples.py','shim/native_runtime.h','shim/counterexamples.c','proof/original/testNEON.c','proof/original/testRVV.c','impl/testNEON.c','impl/testRVV.c'];inputs={n:sha(CASE/n)for n in names}
        exe('compile',['gcc','-std=c11','-O1','-g','-fsanitize=undefined','-fno-sanitize-recover=undefined',CASE/'shim/counterexamples.c','-o',run/'probe']);log=exe('replay',[run/'probe']);rows=[]
        for m in re.finditer(r'shift=(-?\d+) original_neon=(-?\d+) original_rvv=(-?\d+) repaired_neon=(-?\d+) repaired_rvv=(-?\d+) expected=(-?\d+)',log.read_text()):
            raw,n,r,nn,rr,expected=map(int,m.groups());want=scalar_reference(raw);assert n==want and nn==rr==expected==want;rows.append(dict(raw_shift=raw,original_neon=n,original_rvv=r,repaired_neon=nn,repaired_rvv=rr,independent_python_reference=want))
        assert len(rows)==8 and sum(r['original_neon']!=r['original_rvv']for r in rows)==5
        ub=exe('original-neon-intmin-ubsan',[run/'probe','n'],zero=False);assert 'runtime error' in ub.read_text() and '-2147483648'in ub.read_text()
        rv=exe('original-rvv-intmin-defined',[run/'probe','r']);fixed=exe('repaired-intmin-defined',[run/'probe','f']);assert rv.read_text().strip()==fixed.read_text().strip()=='output=1'
        assert inputs=={n:sha(CASE/n)for n in names};s.update(passed=True,input_sha256=inputs,configuration=dict(pointer_bits=64,endian='little',vlen_bits=128,vlmax=32,inactive='unobserved C runtime fields concretized zero; no ISA-policy refinement claim'),witness=dict(n=1,a=[1,0,0,0,0,0,0,0],b=[0]*8,a_zero_point=0,b_zero_point=0,a_multiplier=1,b_multiplier=0,output_zero_point=0,min=-128,max=127),rows=rows,source_intmin_ubsan_reproduced=True,original_rvv_intmin_defined=True,repaired_intmin_both_defined=True,low_byte_controls_replayed=256)
    except Exception as e:s['error']=str(e)
    (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=CASE/'proof/evidence/original-counterexamples.json'
    if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('original-counterexamples-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(s,indent=2)+'\n')
    if s['passed']:
        p=CASE/'proof/repair.json';d=json.loads(p.read_text());d['counterexamples_pending_actual_replay']=False;d['counterexamples']=dict(evidence=str(dest.relative_to(CASE)),evidence_sha256=sha(dest),summary='5 concrete original mismatches including rawshift32, negative and large counts. Original NEON INT32_MIN negation UBSan; original QS8 RVV defined there. Both repaired sides defined and 256 low-byte controls replayed.');p.write_text(json.dumps(d,indent=2)+'\n')
    print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
