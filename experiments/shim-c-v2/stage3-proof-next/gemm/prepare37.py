from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate33';new=H/'candidate37';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
ann='/*@ predicate next_scalar_projection(float32x4_t v,float s0,float s1,float s2,float s3) = '+ ' && '.join('ext_same(v.lane['+str(j)+'],s'+str(j)+')' for j in range(4))+'; */\n'
anchor='void test_neon(';assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor)
import re
match=re.search(r'(?m)^([ \t]*)(/\*@ assert next_scalar_seed:.*)$',s);assert match;indent=match.group(1)
cut=indent+'/*@ assert next_scalar_projection_cut: next_scalar_projection(vacc0x0,next_acc_scalar0,next_acc_scalar1,next_acc_scalar2,next_acc_scalar3); */\n'
s=s[:match.start()]+cut+s[match.start():];p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='One fully defined typed-record/scalar projection predicate and its checked assertion before candidate33 seed. Bare scalar snapshots retained, no helper calls or new premises. Projection assertion and seed are both proof debts.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
