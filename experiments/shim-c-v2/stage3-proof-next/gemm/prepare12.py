from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate11';new=H/'candidate12';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();anchor='      /*@ assert next_ground_eval:';assert s.count(anchor)==1;s=s.replace(anchor,'      //@ ghost next_fma_actual(va0c0.lane[0],vb0123c0.lane[0],vacc0x0.lane[0]);\n'+anchor);p.write_text(s)
p=t/'fp_primitives.h';s=p.read_text();i=s.rfind('#endif');s=s[:i]+r"""/*@ ghost
 /@ assigns \nothing;
    ensures next_fma_actual_post: \forall float ra,rw,rc,r;
      ext_same(a,ra) && ext_same(w,rw) && ext_same(c,rc) &&
      ext_same(r,shim_fma32(ra,rw,rc)) ==>
      ext_same(shim_fma32(a,w,c),r);
 @/
 static void next_fma_actual(float a,float w,float c) { }
*/
"""+s[i:];p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Ground actual FMA operands through a body-checked ghost helper, conditional quantified reference floats, no requires. Existing unresolved frame assertions remain explicit debt.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
