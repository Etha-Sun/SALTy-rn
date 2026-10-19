from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate16';new=H/'candidate24';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();anchor='   /@ assert next_copy_aggregate: next_vec_same(copy,v); @/'
ann=r"""
   float input[2] = {v.lane[0],v.lane[1]};
   CopyBeforeLoad: ;
   float32x2_t loaded = vld1_f32(input);
   /@ assert next_load_probe: ext_same(loaded.lane[0],input[0]) && ext_same(loaded.lane[1],input[1]); @/
   /@ assert next_copy_frame: next_vec_same(copy,\at(copy,CopyBeforeLoad)); @/
"""
assert s.count(anchor)==1;s=s.replace(anchor,anchor+ann);p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Minimal real vld1-return frame probe after struct copy. Arbitrary byvalue float4 input, local2float buffer, no requires; actual vld1 call with unchanged original contract, loaded-value assertion, pure struct frame assertion, original fourlane return obligations. Diagnostic only, not kernel completion.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
