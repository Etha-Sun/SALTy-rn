#!/usr/bin/env python3
"""Independent strengthening of the three exported to_seq body obligations.
Delete only complete named copy-separation assertions, never terms or goals.
No call to any model adapter; direct frozen CVC5, sequential bounded execution.
"""
from pathlib import Path
import hashlib, importlib.util, json, re, resource, subprocess, sys, time
H=Path(__file__).resolve().parent
P=H.parent/'copy-separated14'
R=H.parents[4]
A=R/'experiments/shim-c-v2/stage3-byte-fp-front-v27/cvc5-supported.py'
SOLVER=R/'experiments/shim-c-v2/handoff-solvers/.build/bin/cvc5'
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def check(d): return [p for p,v in d.items() if not Path(p).is_file() or sha(p)!=v]
def save(p,x): p.write_text(json.dumps(x,indent=2)+'\n')
def memory_limit(): resource.setrlimit(resource.RLIMIT_AS,(2048*1024*1024,2048*1024*1024))
if sys.argv[1]=='prepare':
    assert not (H/'seal.json').exists()
    spec=importlib.util.spec_from_file_location('scanner',A)
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
    names={n for ns in json.loads((P/'removed-propositions.json').read_text()).values() for n in ns}
    sources=sorted((P/'export-sequence01/tasks').glob('*.smt2'));assert len(sources)==3
    locked=json.loads((P/'inputs.json').read_text());assert not check(locked)
    inventory=[]
    for i,src in enumerate(sources):
        text=src.read_text();spans=list(mod.commands(text))
        heads=[re.match(r'\(\s*([^\s()]+)',text[a:b]).group(1) for a,b in spans]
        assert heads.count('check-sat')==1
        assert not set(heads)&{'push','pop','reset','reset-assertions','check-sat-assuming'}
        goal=max(j for j,h in enumerate(heads) if h=='assert')
        assert goal<heads.index('check-sat')
        removed=[];chunks=[];last=0;prev=0
        for j,(a,b) in enumerate(spans):
            comments=re.findall(r'^;; "([^"]+)"\s*$',text[prev:a],re.M)
            label=comments[-1] if comments else None
            if label in names:
                assert heads[j]=='assert' and j!=goal
                chunks.append(text[last:a]);last=b
                removed.append({'name':label,'assertion':text[a:b]})
            prev=b
        chunks.append(text[last:]);reduced=''.join(chunks)
        assert len(removed)==15
        rs=list(mod.commands(reduced));assertions=[reduced[a:b] for a,b in rs if re.match(r'\(\s*assert\b',reduced[a:b])]
        assert assertions[-1]==text[slice(*spans[goal])]
        original=H/f'task{i}.original.smt2';target=H/f'task{i}.stronger.smt2'
        original.write_text(text);target.write_text(reduced)
        save(H/f'task{i}.removed.json',removed)
        inventory.append({'source':str(src),'source_sha256':sha(src),'original':str(original),'stronger':str(target),'removed_count':len(removed),'goal_sha256':hashlib.sha256(assertions[-1].encode()).hexdigest()})
    save(H/'inventory.json',inventory)
    locked.update({str(p):sha(p) for p in [A,SOLVER,Path(__file__).resolve(),H/'inventory.json',P/'inputs.json',*H.glob('task*')]})
    save(H/'seal.json',locked)
    print('prepared three stronger body tasks; no solver invoked')
elif sys.argv[1]=='prove':
    out=H/sys.argv[2];out.mkdir(exist_ok=False)
    locked=json.loads((H/'seal.json').read_text());assert not check(locked)
    results=[]
    for item in json.loads((H/'inventory.json').read_text()):
        args=[str(SOLVER),'--lang=smt2','--tlimit-per=30000',item['stronger']]
        start=time.monotonic()
        try:
            p=subprocess.run(args,capture_output=True,timeout=40,preexec_fn=memory_limit)
            code=p.returncode;stdout=p.stdout;stderr=p.stderr
        except subprocess.TimeoutExpired as e:
            code=124;stdout=e.stdout or b'';stderr=e.stderr or b''
        stem=Path(item['stronger']).stem
        (out/(stem+'.stdout')).write_bytes(stdout);(out/(stem+'.stderr')).write_bytes(stderr)
        tokens=stdout.decode(errors='replace').splitlines()
        verdict=tokens[0].strip() if tokens else None
        results.append({'command':args,'exit':code,'seconds':time.monotonic()-start,'verdict':verdict,'accepted':code==0 and verdict=='unsat' and not any('error' in s.lower() for s in tokens)})
    after=check(locked)
    save(out/'result.json',{'results':results,'after_mismatches':after,'complete':len(results)==3 and all(r['accepted'] for r in results) and not after,'note':'Direct solver on strictly stronger exported actual body VCs; not a kernel verification.'})
    print((out/'result.json').read_text())
else: raise SystemExit('prepare | prove NEW_RUN')
