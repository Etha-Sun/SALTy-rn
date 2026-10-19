from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate55';new=H/'candidate56';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text();assert 'next_fma_result' not in s
helper=r"""/*@ predicate next_fma_result_relation(float r,float x,float y,float z,float u,float v,float w,float p) =
 (ext_same(x,u) && ext_same(y,v) && ext_same(z,w) &&
  ext_same(p,shim_fma32(u,v,w)) && ext_same(r,shim_fma32(x,y,z))) ==>
  ext_same(r,p);
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_fma_result_post: \forall float u,v,w,p;
      next_fma_result_relation(r,x,y,z,u,v,w,p);
 @/
 static void next_fma_result(float r,float x,float y,float z) {}
*/
"""
close=s.rfind('#endif');assert close>=0;s=s[:close]+helper+s[close:];p.write_text(s)
p=t/'neon.c';s=p.read_text();needle='      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);';assert s.count(needle)==1
actual='vacc0x0.lane[0],va0c0.lane[0],vb0123c0.lane[0],next_acc_scalar0'
refs='next_read{Stage3Block}(A0,(KC-k)/4),next_read{Stage3Block}(W0,((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4)+0),stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,0,(KC-k)/4,KC/4),stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,0,(KC-k)/4+1,KC/4)'
s=s.replace(needle,needle+'\n      /*@ ghost next_fma_result('+actual+'); */\n      /*@ assert next_fma_result_ground: next_fma_result_relation('+actual+','+refs+'); */');p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Add a no-requires real-body result-composition helper with fully defined native-FMA relation; use existing ghost oldacc scalar after real first FMA. Preserve four antecedent cuts and unfolding proof; one named result instance is mandatory. No new snapshot, actual arithmetic, contract weakening or implementation change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
