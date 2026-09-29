#!/usr/bin/env python3
"""Diagnostic SMT comparison of actual extracted arithmetic traces.

This harness is not certified by Coq. It composes register-only instructions,
preserves all register read/write/assume constraints, and rejects branching and
memory. It does NOT execute the kernel's control flow, loads, or vsetvl.
"""
import hashlib, json, re, subprocess, sys, time
from pathlib import Path
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE.parent))
from compare_traces import parse, emit, renamed, extract, Z3

def bv(n,x=0): return ['_',f'bv{x}',str(n)]
def zext(x,n): return [['_','zero_extend',str(n)],x]
def add(xs):
    out=bv(32)
    for x in xs: out=['bvadd',out,x]
    return out
def vector(xs): return ['_','vec',*xs]
def iskind(x,k):return isinstance(x,list) and x[:2]==['_',k]
def canonical(x):
    if isinstance(x,list):
        if len(x)==3 and x[0]=='_' and isinstance(x[1],str) and re.fullmatch(r'bv-\d+',x[1]):
            return bv(int(x[2]),int(x[1][2:]) % (1 << int(x[2])))
        return [canonical(y) for y in x]
    return x

class Run:
    def __init__(self,state):
        self.state=state;self.declarations=[];self.definitions=[];self.constraints=[];self.hashes={};self.bound=set()
    def eq(self,a,b):
        if iskind(a,'vec'):
            assert iskind(b,'vec') and len(a)==len(b)
            for x,y in zip(a[2:],b[2:]):self.eq(x,y)
        elif iskind(a,'struct'):
            assert iskind(b,'struct')
            da,db=dict(a[2:]),dict(b[2:]);assert da.keys()==db.keys()
            for k in da:self.eq(da[k],db[k])
        else:
            assert not iskind(b,'vec') and not iskind(b,'struct')
            # A fresh read variable equals the current register value.
            # Bind that equality before later definitions use it, avoiding
            # bit-blasting unconstrained 65536-bit register variables.
            if isinstance(a,str) and re.fullmatch(r'[nr]\d+_v\d+',a) and a not in self.bound and a!=b:
                self.definitions.append([a,b]);self.bound.add(a)
            self.constraints.append(['=',a,b])
    def step(self,relative,prefix):
        # The Sail isla_footprint_no_init entry point resets SEE before its
        # cycle marker, so that reset is not an event in the saved trace.
        # Islaris ignores SEE; here we retain its events with the same reset.
        if relative.startswith('neon_'): self.state['|SEE|']=bv(128,2**128-1)
        path=HERE/'generated'/relative
        self.hashes[relative]=hashlib.sha256(path.read_bytes()).hexdigest()
        traces=parse(path.read_text());assert len(traces)==1 and traces[0][0]=='trace'
        for e in canonical(renamed(traces[0],prefix))[1:]:
            tag=e[0]
            if tag=='declare-const':
                assert e[2]=='Bool' or (isinstance(e[2],list) and e[2][:2]==['_','BitVec'])
                self.declarations.append(emit(e))
            elif tag=='define-const':
                self.definitions.append(e[1:]);self.bound.add(e[1])
            elif tag in {'assert','assume'}:self.constraints.append(e[1])
            elif tag in {'read-reg','write-reg','assume-reg'}:
                reg,access,value=e[1:]
                if access=='nil':
                    if tag=='write-reg':self.state[reg]=value
                    elif reg in self.state:self.eq(value,self.state[reg])
                    else:self.state[reg]=value
                else:
                    assert len(access)==1 and access[0][:2]==['_','field']
                    field=access[0][2]
                    if iskind(value,'struct'):value=dict(value[2:])[field]
                    if reg not in self.state:self.state[reg]=['_','struct']
                    assert iskind(self.state[reg],'struct')
                    fields=dict(self.state[reg][2:])
                    if tag=='write-reg' or field not in fields:fields[field]=value
                    else:self.eq(value,fields[field])
                    self.state[reg]=['_','struct',*[[k,v] for k,v in fields.items()]]
            elif tag=='define-enum':
                # The selected traces declare enums but never use enum-valued
                # registers. Such a use would be rejected above or by SMT.
                pass
            elif tag=='cycle':pass
            else:raise ValueError('Unsupported event '+tag)

def setup():
    h=[extract('halfacc',16*i+15,16*i) for i in range(8)]
    b=[extract('input',8*i+7,8*i) for i in range(16)]
    arm=Run({'|_V|':vector([zext('acc',96),'halfacc','input']+[bv(128)]*29)})
    for i,(d,f) in enumerate([('neon_uadalp8','a2105bc'),('neon_uadalp16','a2105c4'),('neon_addv','a2105dc')]):
        arm.step(f'{d}/{f}.isla',f'n{i}_')
    # Map each halfword accumulator to one RVV lane in its pair. Other
    # lanes are zero; acc is added to lane zero modulo 2^32.
    seeds=[zext(h[i//2],16) if i%2==0 else bv(32) for i in range(16)]
    seeds[0]=['bvadd',seeds[0],'acc']
    def pack(xs):
        out=xs[-1]
        for x in reversed(xs[:-1]):out=['concat',out,x]
        return out
    rv=Run({f'|vr{i}|':bv(65536) for i in range(32)})
    rv.state['|vr2|']=zext('input',65536-128)
    rv.state['|vr8|']=zext(pack(seeds[:8]),65536-256)
    rv.state['|vr9|']=zext(pack(seeds[8:]),65536-256)
    rv.step('rvv_widen/a800001d2.isla','r0_')
    rv.step('rvv_add/a800001d6.isla','r1_')
    neon=extract(arm.state['|_V|'][2],31)
    rvv=add([extract(rv.state[f'|vr{r}|'],32*i+31,32*i) for r in range(8,16) for i in range(8)])
    spec=add(['acc',*[zext(x,16) for x in h],*[zext(x,24) for x in b]])
    bounds=[['bvule',add([zext(h[i],16),zext(b[2*i],24),zext(b[2*i+1],24)]),bv(32,65535)] for i in range(8)]
    return arm,rv,neon,rvv,spec,bounds

def main():
    arm,rv,neon,rvv,spec,bounds=setup()
    declarations=arm.declarations+rv.declarations
    definitions=arm.definitions+rv.definitions
    constraints=arm.constraints+rv.constraints
    prefix=''.join('(let (('+n+' '+emit(e)+'))\n' for n,e in definitions)
    suffix=')'*len(definitions)
    queries=[('direct-with-range',bounds,['not',['=',neon,rvv]],'unsat'),
             ('neon-shared-spec',bounds,['not',['=',neon,spec]],'unsat'),
             ('rvv-shared-spec',[],['not',['=',rvv,spec]],'unsat'),
             ('direct-without-range',[],['not',['=',neon,rvv]],'sat'),
             ('direct-zero-halfacc',[['=','halfacc',bv(128)]],['not',['=',neon,rvv]],'unsat'),
             ('concrete-overflow',[['=','halfacc',bv(128,65535)],['=','input',bv(128,1)],['=','acc',bv(32)]],['not',['=',neon,rvv]],'sat')]
    (HERE/'smt').mkdir(exist_ok=True);records=[]
    for name,pre,goal,expected in queries:
        smt='(set-option :timeout 60000)\n(set-logic QF_BV)\n'
        smt+='(declare-const input (_ BitVec 128))\n(declare-const halfacc (_ BitVec 128))\n(declare-const acc (_ BitVec 32))\n'
        smt+='\n'.join(declarations)+'\n'
        smt+='(push)\n(assert '+prefix+emit(['and',*constraints,*pre])+suffix+')\n(check-sat)\n(pop)\n'
        smt+='(assert '+prefix+emit(['and',*constraints,*pre,goal])+suffix+')\n(check-sat)\n'
        if expected=='sat':smt+='(get-value (input halfacc acc))\n'
        path=HERE/'smt'/f'{name}.smt2';path.write_text(smt)
        start=time.monotonic()
        try:
            p=subprocess.run([str(Z3),str(path)],text=True,capture_output=True,timeout=130)
            output=p.stdout+p.stderr;code=p.returncode
        except subprocess.TimeoutExpired:output='timeout';code=None
        status=re.findall(r'^(sat|unsat|unknown)$',output,re.M)
        r=dict(name=name,seconds=round(time.monotonic()-start,3),exit_code=code,status=status,
               expected=['sat',expected],passed=code==0 and status==['sat',expected] and '(error' not in output,
               smt_sha256=hashlib.sha256(path.read_bytes()).hexdigest())
        (HERE/'logs'/f'{name}.z3.log').write_text(output);records.append(r);print(json.dumps(r),flush=True)
    result=dict(checks=records,all_passed=all(r['passed'] for r in records),input_sha256=arm.hashes|rv.hashes,
                coq_certified_comparison=False,full_kernel_equivalence=False,arbitrary_length=False,
                scope='16-byte arithmetic composition; arbitrary bytes and accumulator values; fixed VLEN=256, vl=16; memory/control flow excluded')
    (HERE/'results/block-comparison.json').write_text(json.dumps(result,indent=2)+'\n')
    return 0 if result['all_passed'] else 1

if __name__=='__main__':sys.exit(main())
