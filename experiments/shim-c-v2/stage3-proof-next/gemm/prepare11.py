from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate09';new=H/'candidate11';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();anchor='      const float32x4_t va0c0 = vdupq_lane_f32(va0, 0);';ann=r"""
      /*@ assert next_ground_dup: ext_same(va0c0.lane[0],next_read{Stage3Block}(A0,(KC-k)/4)); */""";assert s.count(anchor)==1;s=s.replace(anchor,anchor+ann)
anchor='      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);';ann=r"""      /*@ assert next_ground_acc: ext_same(vacc0x0.lane[0],stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,0,(KC-k)/4,KC/4)); */
      /*@ assert next_ground_step: ext_same(stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,0,(KC-k)/4+1,KC/4),shim_fma32(next_read{Stage3Block}(A0,(KC-k)/4),next_read{Stage3Block}(W0,((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4)),stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,0,(KC-k)/4,KC/4))); */
      /*@ assert next_ground_eval: ext_same(shim_fma32(va0c0.lane[0],vb0123c0.lane[0],vacc0x0.lane[0]),stage3_gacc{Stage3Block}(A0,W0,0,(NC-nc)/8,0,(KC-k)/4+1,KC/4)); */
""";assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor);p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Diagnose only first lane: ground broadcast, old accumulator, recursive one-step unfolding, then exact FMA substitution. Four separate checked assertions expose memory/frame versus recursion debt.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
