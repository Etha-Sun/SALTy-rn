#!/usr/bin/env python3
"""Small SMT harness for the register-only smax/vmax traces, NOT a kernel lifter.

Retains every emitted path assertion and definition. Compares all trace pairs,
with shared 16-byte input and signed byte threshold; does not model memory or
claim to validate Isla's translation. Assumes the recorded architecture resets.
"""
import hashlib
import itertools
import json
import os
import re
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
Z3 = Path(os.environ.get('Z3', str(ROOT.parent / 'sail-binary-reduction/vendor/sail/bin/z3')))

def parse(text):
    tokens = re.findall(r'\|[^|]*\||\(|\)|[^\s()]+', re.sub(r';[^\n]*', '', text))
    stack, roots = [], []
    for t in tokens:
        if t == '(':
            stack.append([])
        elif t == ')':
            x = stack.pop()
            (stack[-1] if stack else roots).append(x)
        else:
            if not stack:
                raise ValueError('Unexpected top-level token: '+t)
            stack[-1].append(t)
    if stack:
        raise ValueError('Unclosed expression')
    return roots

def emit(x):
    return '('+' '.join(map(emit,x))+')' if isinstance(x,list) else x

def renamed(x, prefix):
    if isinstance(x,list):return [renamed(y,prefix) for y in x]
    return prefix+x if re.fullmatch(r'v\d+',x) else x

def extract(x, hi, lo=0):return [['_','extract',str(hi),str(lo)],x]

def prepare(trace, arch, prefix):
    assert trace[0] == 'trace'
    trace = renamed(trace,prefix)
    decls, defs, predicates = [], [], []
    reads, writes = {}, {}
    allowed = {'assume-reg','read-reg','write-reg','declare-const','define-const',
               'define-enum','assert','assume','branch','branch-address','cycle'}
    for e in trace[1:]:
        if e[0] not in allowed:
            raise ValueError('Unsupported event '+e[0])
        if e[0] == 'declare-const':
            if not (e[2]=='Bool' or isinstance(e[2],list) and e[2][:2]==['_','BitVec']):
                raise ValueError('Unsupported sort '+emit(e[2]))
            decls.append(emit(e))
        elif e[0]=='define-const':defs.append(e[1:])
        elif e[0] in {'assert','assume'}:predicates.append(e[1])
        elif e[0]=='read-reg':
            reads.setdefault(e[1],e[3])
        elif e[0]=='write-reg':writes[e[1]]=e[3]
    if arch=='rv':
        source=extract(reads['|vr8|'],127)
        threshold=reads['|x14|']
        output=extract(writes['|vr8|'],127)
        predicates += [['=',source,'input'], ['=',threshold,[['_','sign_extend','56'],'threshold']]]
    else:
        assert reads['|_Z|'][:2]==['_','vec'] and writes['|_Z|'][:2]==['_','vec']
        source=extract(reads['|_Z|'][3],127)  # _Z[1], low 128 bits
        threshold=extract(reads['|_Z|'][2],127)  # _Z[0], replicated threshold
        output=extract(writes['|_Z|'][3],127)
        broadcast='threshold'
        for _ in range(15):broadcast=['concat','threshold',broadcast]
        predicates += [['=',source,'input'],['=',threshold,broadcast]]
    return decls, defs, predicates, output

def query(name, left, right, negative):
    la=parse((ROOT/'logs'/f'{left}.trace').read_text())
    rb=parse((ROOT/'logs'/f'{right}.trace').read_text())
    if not la or not rb:raise ValueError('No traces')
    records=[]
    for i,j in itertools.product(range(len(la)),range(len(rb))):
        a=prepare(la[i],'arm','a_');b=prepare(rb[j],'rv','b_')
        declarations=a[0]+b[0]
        defs=a[1]+b[1]
        predicates=a[2]+b[2]
        prefix=''.join('(let (('+n+' '+emit(e)+'))\n' for n,e in defs)
        suffix=')'*len(defs)
        feasible=prefix+emit(['and',*predicates])+suffix
        mismatch=prefix+emit(['and',*predicates,['not',['=',a[3],b[3]]]])+suffix
        smt='(set-option :timeout 30000)\n(set-logic QF_BV)\n'
        smt+='(declare-const input (_ BitVec 128))\n(declare-const threshold (_ BitVec 8))\n'
        smt+='\n'.join(declarations)+'\n'
        smt+='(push)\n(assert '+feasible+')\n(check-sat)\n(pop)\n'
        smt+='(assert '+mismatch+')\n(check-sat)\n'
        if negative:smt+='(get-value (input threshold))\n'
        path=ROOT/'experiments'/f'{name}-{i}-{j}.smt2';path.write_text(smt)
        start=time.monotonic()
        try:
            r=subprocess.run([str(Z3),str(path)],capture_output=True,text=True,timeout=65)
            output=r.stdout+r.stderr
            status=re.findall(r'^(sat|unsat|unknown)$',r.stdout,re.M)
            passed=r.returncode==0 and status==['sat','sat' if negative else 'unsat'] and '(error' not in output
        except subprocess.TimeoutExpired:
            output='timeout';status=[];passed=False
        (ROOT/'logs'/f'{name}-{i}-{j}.z3.log').write_text(output)
        records.append(dict(arm_trace=i,rv_trace=j,seconds=round(time.monotonic()-start,3),
                            expected_negative=negative,solver_status=status,passed=passed,output=output,
                            smt_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
    result=dict(name=name,scope='register-only instruction arithmetic, 16 symbolic bytes, VLEN=256, vl=16, LMUL=8',
                arm_trace=left,rv_trace=right,all_pairs_passed=all(r['passed'] for r in records),
                input_trace_sha256={n:hashlib.sha256((ROOT/'logs'/f'{n}.trace').read_bytes()).hexdigest() for n in [left,right]},
                kernel_equivalence_proved=False,trace_translation_validated=False,queries=records)
    (ROOT/'results'/f'{name}.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
    return result['all_pairs_passed']

if __name__=='__main__':
    positive = query('smax-vmax','neon-smax','rv-vmax-reset',False)
    negative = query('smax-vmin-negative','neon-smax','rv-vmin-negative',True)
    sys.exit(0 if positive and negative else 1)
