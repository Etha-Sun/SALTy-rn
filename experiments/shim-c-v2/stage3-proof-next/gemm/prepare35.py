from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate33';new=H/'candidate35';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();ann=''
for j in range(4):
 ann+='/*@ predicate next_project_lane_'+str(j)+'(float32x4_t v,float x) = ext_same(x,v.lane['+str(j)+']); */\n'
 ann+='/*@ ghost\n /@ assigns \\nothing; ensures next_project_post_'+str(j)+': next_project_lane_'+str(j)+'(v,\\result); @/\n static float next_project_'+str(j)+'(float32x4_t v) { return v.lane['+str(j)+']; }\n*/\n'
 oldinit='float next_acc_scalar'+str(j)+' = vacc0x0.lane['+str(j)+'];'
 newinit='float next_acc_scalar'+str(j)+' = next_project_'+str(j)+'(vacc0x0);'
 assert s.count(oldinit)==1;s=s.replace(oldinit,newinit)
anchor='void test_neon(';assert s.count(anchor)==1;s=s.replace(anchor,ann+'\n'+anchor);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Four actual body ghost scalar projection helpers with fully defined typed predicates and no requires; replace bare scalar ghost reads in candidate33. Each helper ensures and assigns must be proved, all seed/frame debt retained.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
