from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate07';new=H/'candidate08';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();anchor='      const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;';assert s.count(anchor)==1;s=s.replace(anchor,'      //@ ghost next_bounds(NC,nc,KC,k);\n'+anchor);p.write_text(s)
p=t/'fp_primitives.h';s=p.read_text();i=s.rfind('#endif');s=s[:i]+r"""/*@ ghost
 /@ assigns \nothing;
    ensures next_bounds_post: 0<n<=N && 8<=k<=KC ==>
      (\forall integer j; 0<=j<4 ==>
       0<=((N-n)/8)*(8+8*(KC/4))+8+8*((KC-k)/4)+j<((N+7)/8)*(8+8*(KC/4)) &&
       0<=((N-n)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+1)+j<((N+7)/8)*(8+8*(KC/4)));
 @/
 static void next_bounds(unsigned long N,unsigned long n,unsigned long KC,unsigned long k) { }
*/
"""+s[i:];p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Instantiate packed bounds via a body-checked ghost helper without requires; conditional postcondition must be proved independently. Original scalar/lane assertions retained.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
