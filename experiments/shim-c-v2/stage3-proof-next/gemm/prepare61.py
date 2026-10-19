from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate60';new=H/'candidate61';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text();helper=r"""/*@ predicate next_splat_join(float x,float y,float z,float r) =
 (ext_same(x,z) && ext_same(y,z) && ext_same(y,r)) ==> ext_same(x,r);
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_splat_join_post: \forall float r; next_splat_join(x,y,z,r);
 @/
 static void next_splat_transport(float x,float y,float z) {}
*/
""";i=s.rfind('#endif');assert i>=0;s=s[:i]+helper+s[i:];p.write_text(s)
p=t/'neon.c';s=p.read_text();needle='      /*@ assert next_fma_pre_a3:';assert s.count(needle)==1
s=s.replace(needle,'      /*@ ghost next_splat_transport(va0c0.lane[3],va0c0.lane[0],va0.lane[0]); */\n      /*@ assert next_splat_join_ground: next_splat_join(va0c0.lane[3],va0c0.lane[0],va0.lane[0],next_read{Stage3Block}(A0,(KC-k)/4)); */\n'+needle);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Add a no-requires body-proved common-value transport helper for first-step A lane3. Instantiate its fully defined implication explicitly; all previous antecedent debts retained. No frozen C/spec/model change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
