from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate27';new=H/'candidate31';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
import re
pat=r'(?m)^([ \t]*)([^\n]*\bva0\s*=\s*vld1_f32\(a0\);[^\n]*)$'
match=re.search(pat,s);assert match, 'first va0 vld1 not found'
indent=match.group(1);original=match.group(0)
replacement=indent+'//@ ghost float next_acc_scalar0 = vacc0x0.lane[0];\n'+original+'\n'+indent+'/*@ assert next_scalar_first_frame: ext_same(vacc0x0.lane[0], next_acc_scalar0); */'
p.write_text(s[:match.start()]+replacement+s[match.end():])

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='One scalar lane0 ghost snapshot immediately before first real vld1, then exact scalar frame assertion; original candidate27 proof and all contracts retained. No aggregate Load_S5 cut.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
