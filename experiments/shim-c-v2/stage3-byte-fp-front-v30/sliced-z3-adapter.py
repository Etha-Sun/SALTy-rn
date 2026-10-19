#!/usr/bin/env python3
"""Two drop-only, same-goal subsets, then original task; accept subset UNSAT only."""
from pathlib import Path
import hashlib,importlib.util,json,os,re,subprocess,sys,tempfile,time
H=Path(__file__).resolve().parent
sp=importlib.util.spec_from_file_location('smt_scan',H/'cvc5-supported.py')
scan=importlib.util.module_from_spec(sp);sp.loader.exec_module(scan)
KEEP={"base'def","offset'def","shift'def","shift_float32'def","separated'def","P_same32'def","P_same64'def","auto_instance","H","to_uint64'def","is_uint64'def","shift_uint32'def","Div_mod","cmod_remainder","global'def","Q_memcmp_zero"}
EXTRA={"read_uint32_write_uint32_sep","read_uint32_write_uint32_eq","read_uint64_write_uint64_sep","read_uint64_write_uint64_eq","valid_rd'def","valid_rw'def","valid_obj'def","included'def"}
def slice_task(text,expanded=False):
    spans=list(scan.commands(text));heads=[re.match(r'\(\s*([^\s()]+)',text[a:b]).group(1) for a,b in spans]
    allowed={'set-logic','set-option','set-info','declare-sort','define-sort','declare-fun','declare-const','define-fun','declare-datatypes','declare-datatype','assert','check-sat','get-info','exit'}
    if any(h not in allowed for h in heads) or heads.count('check-sat')!=1:raise ValueError('unsupported query')
    goal=max(i for i,h in enumerate(heads) if h=='assert')
    if goal>heads.index('check-sat'):raise ValueError('late assertion')
    result=[];removed=[];previous=0;last=0
    for i,(a,b) in enumerate(spans):
        names=re.findall(r';; "([^\n]+)"',text[previous:a]);name=names[-1] if names else ''
        keep=name in KEEP or (expanded and (name in EXTRA or (name.startswith('P_') and name.endswith("'def"))))
        if expanded and name=='auto_instance' and re.search(r'\b(?:read_uint8|read_sint8)\b',text[a:b]):keep=False
        if heads[i]=='assert' and i!=goal and not keep:
            result.append(text[last:a]);last=b;removed.append({'name':name,'assertion':text[a:b]})
        previous=b
    result.append(text[last:]);return ''.join(result),removed,text[slice(*spans[goal])]
def main():
    source=Path(sys.argv[-1]);text=source.read_text();args=sys.argv[1:-1]
    try:variants=[slice_task(text),slice_task(text,True)]
    except (ValueError,AttributeError):print('unknown');return 0
    limit=30;plain=[];i=0
    while i<len(args):
        if args[i].startswith('-T:'):limit=int(args[i][3:])
        elif args[i]=='-T':i+=1;limit=int(args[i])
        else:plain.append(args[i])
        i+=1
    if limit<=0:print('unknown');return 0
    evidence=H/'qualification01'/'z3-adapter-evidence';evidence.mkdir(exist_ok=True,parents=True)
    sha=lambda s:hashlib.sha256(s.encode()).hexdigest();L=Path(tempfile.mkdtemp(prefix=sha(text)+'-',dir=evidence));(L/'original.smt2').write_text(text)
    records=[];solver=H.parent/'handoff-solvers/.build/bin/z3';start=time.monotonic()
    def run(kind,path,budget):
        cmd=[str(solver),*plain,'-T:'+str(budget),str(path)];t=time.monotonic();q=subprocess.run(cmd,capture_output=True,text=True)
        (L/(kind+'.stdout')).write_text(q.stdout);(L/(kind+'.stderr')).write_text(q.stderr)
        records.append({'kind':kind,'command':cmd,'exit':q.returncode,'seconds':time.monotonic()-t,'source_sha256':sha(path.read_text()),'stdout_sha256':sha(q.stdout),'stderr_sha256':sha(q.stderr)})
        (L/'executions.json').write_text(json.dumps(records,indent=2)+'\n');return q
    for kind,(reduced,removed,goal) in zip(['sliced','expanded'],variants):
        path=L/(kind+'.smt2');path.write_text(reduced)
        (L/(kind+'-transformation.json')).write_text(json.dumps({'original_sha256':sha(text),'sliced_sha256':sha(reduced),'goal_sha256':sha(goal),'goal_byte_identical':goal in reduced,'removed':removed,'argv':sys.argv[1:],'qualification':False},indent=2)+'\n')
        remaining=max(0,limit-int(time.monotonic()-start+0.999))
        if remaining==0:print('unknown');return 0
        q=run(kind,path,min(5 if kind=='sliced' else 10,remaining));lines=q.stdout.strip().splitlines()
        if q.returncode==0 and lines and lines[0]=='unsat':print('unsat');return 0
    remaining=max(0,limit-int(time.monotonic()-start+0.999))
    if remaining==0:print('unknown');return 0
    q=run('original',L/'original.smt2',remaining);lines=q.stdout.strip().splitlines()
    print(lines[0] if q.returncode==0 and lines and lines[0] in {'sat','unsat','unknown'} else 'unknown');return 0
if __name__=='__main__':sys.exit(main())
