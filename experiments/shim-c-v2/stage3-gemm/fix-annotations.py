from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();sys.path.insert(0,str(ROOT/'tools'));import shim_c_campaign_closure as c
for name in ['f32-gemm-minmax','f32-igemm-minmax','qd8-f32-qc4w-gemm-minmax']:
 old=HERE/name;new=HERE/(name+'-r1');new.mkdir();m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='stage3-parsefix-',dir='/tmp'));plain={}
 for n,v in m['files'].items():plain[n]=(ROOT/v['path']).read_text();(tmp/n).write_text(plain[n])
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=tmp,capture_output=True,check=True)
 p=tmp/'fp_primitives.h';s=p.read_text();i=s.rindex('\n/*@ logic ');logic=s[i:];s=s[:i];logic=logic.replace('const float','float');j=s.rindex('#endif');s=s[:j]+logic+'\n'+s[j:];p.write_text(s);diff=[]
 for n in m['files']:
  for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
 (new/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(ROOT));m['proof_patches']=[str((new/'proof.patch').relative_to(ROOT))];m['stage3'].update(previous_candidate_frozen_sha256=sha(old/'frozen.json'),proof_sha256=sha(new/'proof.patch'),fix='ACSL logic parameters omit const; added logic moved inside existing header guard. Proof annotation error only; no target/environment change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=c.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
s=(HERE/'run.py').read_text()
for n in ['f32-gemm-minmax','f32-igemm-minmax','qd8-f32-qc4w-gemm-minmax']:s=s.replace(repr(n),repr(n+'-r1'))
(HERE/'run-r1.py').write_text(s)
