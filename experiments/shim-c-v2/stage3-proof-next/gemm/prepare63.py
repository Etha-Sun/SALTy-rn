from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate61';new=H/'candidate63';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();ref='next_read{Stage3Block}(A0,(KC-k)/4+1)'
needle='      /*@ assert next_fma_second_pre_a0:';assert s.count(needle)==1
s=s.replace(needle,'      /*@ assert next_second_source: ext_same(va0.lane[1],'+ref+'); */\n'+needle)
for j in range(4):
 needle=f'      /*@ assert next_fma_second_pre_a{j}:';assert s.count(needle)==1
 actual=f'va0c1.lane[{j}],va0.lane[1],va0.lane[1]'
 bridge=f'      /*@ assert next_second_dup{j}: ext_same(va0c1.lane[{j}],va0.lane[1]); */\n      /*@ ghost next_splat_transport({actual}); */\n      /*@ assert next_second_join{j}: next_splat_join({actual},{ref}); */\n'
 s=s.replace(needle,bridge+needle)
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Expose second-step scalar source relation and actual duplicated-lane relation, then instantiate already body-checked next_splat_transport at the actual source scalar. All nine new bridge cuts mandatory; preserve original four A antecedents and after-FMA goals. No new helper, snapshot, requires, or implementation change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
