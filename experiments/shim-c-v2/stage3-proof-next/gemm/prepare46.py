from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate45';new=H/'candidate46';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();import re
for name,step in [('before_0','0'),('after_0','1'),('before_1','1'),('after_1','2')]:
 pat=r'(?m)^([ \t]*)/\*@ assert next_acc_'+name+r': next_vec4_acc\{Stage3Block\}\(vacc0x0,A0,W0,\(NC-nc\)/8,\(KC-k\)/4\+'+step+r',KC/4\); \*/$'
 match=re.search(pat,s);assert match,name;indent=match.group(1)
 replacement='\n'.join(indent+'/*@ assert next_acc_'+name+'_fixed_'+str(j)+': ext_same(vacc0x0.lane['+str(j)+'],stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,'+str(j)+',(KC-k)/4+'+step+',KC/4)); */' for j in range(4))
 s=s[:match.start()]+replacement+s[match.end():]
for name in ['first','second']:
 pat=r'(?m)^([ \t]*)/\*@ assert next_acc_'+name+r': \\forall integer j;0<=j<4 ==> (.*); \*/$'
 match=re.search(pat,s);assert match,name;indent=match.group(1);expr=match.group(2)
 replacement='\n'.join(indent+'/*@ assert next_acc_'+name+'_fixed_'+str(j)+': '+re.sub(r'\bj\b',str(j),expr)+'; */' for j in range(4))
 s=s[:match.start()]+replacement+s[match.end():]
p.write_text(s)
p=t/'fp_arithmetic.c';s=p.read_text();needle='float32x4_t vfmaq_f32(';assert s.count(needle)==1
extra='/*@ '+''.join('ensures next_fma_lane'+str(j)+': ext_same(\\result.lane['+str(j)+'],shim_fma32(b.lane['+str(j)+'],c.lane['+str(j)+'],a.lane['+str(j)+'])); ' for j in range(4))+'*/\n'
s=s.replace(needle,extra+needle);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Expand six existing finite four-lane accumulator assertions into scalar conjuncts. Add four body-proved scalar vfmaq_f32 postconditions while retaining its original quantified contract and entire body. No new seed or requires. Every new assertion and callee obligation remains required.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
