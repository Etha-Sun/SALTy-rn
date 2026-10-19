from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate27';new=H/'candidate33';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
import re
pat=r'(?m)^([ \t]*)([^\n]*\bva0\s*=\s*vld1_f32\(a0\);[^\n]*)$'
match=re.search(pat,s);assert match;indent=match.group(1);original=match.group(0)
snaps=''.join(indent+'//@ ghost float next_acc_scalar'+str(j)+' = vacc0x0.lane['+str(j)+'];\n' for j in range(4))
seed=' && '.join('ext_same(next_acc_scalar'+str(j)+', stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,'+str(j)+',(KC-k)/4,KC/4))' for j in range(4))
first='\n'.join(indent+'/*@ assert next_scalar_first_frame_'+str(j)+': ext_same(vacc0x0.lane['+str(j)+'], next_acc_scalar'+str(j)+'); */' for j in range(4))
replacement=snaps+indent+'/*@ assert next_scalar_seed: '+seed+'; */\n'+original+'\n'+first
s=s[:match.start()]+replacement+s[match.end():]
pat=r'(?m)^([ \t]*)(/\*@ assert next_acc_before_0:.*)$';match=re.search(pat,s);assert match;indent=match.group(1)
last=''.join(indent+'/*@ assert next_scalar_full_frame_'+str(j)+': ext_same(vacc0x0.lane['+str(j)+'], next_acc_scalar'+str(j)+'); */\n' for j in range(4))
s=s[:match.start()]+last+s[match.start():];p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Four scalar snapshots, proved-again seed conjunction, four immediate first-load frames and four frames across all loads/dups before first real FMA; candidate27 original obligations remain. All new cuts must pass independently.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
