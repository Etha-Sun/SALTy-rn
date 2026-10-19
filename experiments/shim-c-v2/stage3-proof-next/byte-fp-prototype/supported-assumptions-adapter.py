#!/usr/bin/env python3
"""Experimental CVC5 adapter: delete unsupported assumptions, never rewrite terms.

A subset of SMT assertions being UNSAT implies the original set is UNSAT.
This adapter additionally preserves the goal verbatim and rejects multiple queries.
Only complete top-level assert commands may be removed. Malformed/unrecognized
input or unsupported operators remaining anywhere else returns unknown.
"""
from pathlib import Path
import hashlib,json,os,re,subprocess,sys,tempfile
BAD = ('fp.to_ieee_bv', 'bv2int')

def commands(text):
    """Yield exact top-level command spans, with SMT strings/comments respected."""
    depth=0; start=None; i=0; quoted=False; string=False
    while i<len(text):
        c=text[i]
        if string:
            if c=='"':
                if i+1<len(text) and text[i+1]=='"': i+=2; continue
                string=False
        elif quoted:
            if c=='|': quoted=False
            elif c=='\\': raise ValueError('unsupported quoted escape')
        elif c==';':
            end=text.find('\n',i);i=len(text) if end<0 else end;continue
        elif c=='"': string=True
        elif c=='|': quoted=True
        elif c=='(':
            if depth==0:start=i
            depth+=1
        elif c==')':
            depth-=1
            if depth<0:raise ValueError('unbalanced input')
            if depth==0:yield start,i+1
        elif depth==0 and not c.isspace():raise ValueError('top-level atom')
        i+=1
    if depth or string or quoted:raise ValueError('unterminated input')

def reduce_task(text):
    spans=list(commands(text)); heads=[]
    for a,b in spans:
        m=re.match(r'\(\s*([^\s()]+)',text[a:b])
        if not m:raise ValueError('missing command')
        heads.append(m.group(1))
    if heads.count('check-sat')!=1 or any(h in heads for h in ['push','pop','reset','reset-assertions','check-sat-assuming']):
        raise ValueError('not a single ordinary query')
    assertions=[i for i,h in enumerate(heads) if h=='assert']
    if not assertions:raise ValueError('no assertions')
    goal=assertions[-1]
    if any(h=='assert' for h in heads[heads.index('check-sat')+1:]):raise ValueError('late assertion')
    # Why3 emits the negated goal last; preserve it regardless of its syntax.
    removed=[]; pieces=[];last=0
    for i,(a,b) in enumerate(spans):
        if i!=goal and heads[i]=='assert' and any(op in text[a:b] for op in BAD):
            pieces.append(text[last:a]); last=b; removed.append(text[a:b])
    pieces.append(text[last:]); reduced=''.join(pieces)
    if any(op in reduced for op in BAD):raise ValueError('unsupported term outside removable assumptions')
    return reduced,removed,text[slice(*spans[goal])]

def main():
    source=Path(sys.argv[-1]); original=source.read_text()
    try:reduced,removed,goal=reduce_task(original)
    except ValueError as e:
        print('unknown');print('; '+str(e));return 0
    here=Path(__file__).resolve().parent
    evidence=here/'qualification01'/'adapter-evidence';evidence.mkdir(exist_ok=True,parents=True)
    sha=lambda s:hashlib.sha256(s.encode()).hexdigest()
    key=sha(original); (evidence/(key+'.original.smt2')).write_text(original)
    (evidence/(key+'.reduced.smt2')).write_text(reduced)
    (evidence/(key+'.json')).write_text(json.dumps({'original_sha256':key,'reduced_sha256':sha(reduced),'removed_assertions':removed,'goal_sha256':sha(goal),'goal_preserved':goal in reduced,'qualification':False},indent=2)+'\n')
    solver=here.parent/'handoff-solvers/.build/bin/cvc5'
    # A unique file isolates parallel calls; recorded bytes are the exact solver input.
    with tempfile.NamedTemporaryFile(mode='w',suffix='.smt2') as tmp:
        tmp.write(reduced);tmp.flush()
        result=subprocess.run([str(solver),*sys.argv[1:-1],tmp.name],capture_output=True,text=True)
    (evidence/(key+'.stdout')).write_text(result.stdout)
    (evidence/(key+'.stderr')).write_text(result.stderr)
    print(result.stdout,end='');print(result.stderr,file=sys.stderr,end='');return result.returncode

if __name__=='__main__':sys.exit(main())
