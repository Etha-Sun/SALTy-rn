from pathlib import Path
import sys,json,hashlib,shutil,difflib
C=Path(__file__).resolve().parent;R=C.parents[4];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=C.parent/'root32';m=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=C/'.build/edit';shutil.copytree(g['annotated'],work)
for filename,oldframe,newframe,count in [('quantized.c','loop assigns i,r;','loop assigns i,r.lane[0..vl-1];',2),('fp_masks.c','loop assigns i,a;','loop assigns i,a.lane[0..vl-1];',1)]:
 p=work/filename;s=p.read_text()
 # Restrict the change to our named u32 loops, not unrelated intrinsic loops.
 lines=s.splitlines(True);changed=0
 for i,line in enumerate(lines):
  if oldframe in line and ('next_arg_u32' in line or filename=='fp_masks.c' and i>0 and 'next_arg_u32_merge_suffix' in lines[i-1]):
   lines[i]=line.replace(oldframe,newframe);changed+=1
 assert changed==count,(filename,changed)
 p.write_text(''.join(lines))
plain=Path(g['plain']);patch=[]
for n in m['files']:
 if (plain/n).read_bytes()!=(work/n).read_bytes():
  for l in difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):patch.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(C/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m.update(proof_patches=[str((C/'proof.patch').relative_to(R))],proof_sha256=sha(C/'proof.patch'),previous_version=str(old.relative_to(R)),proof_stage='root33 argmax: retain all root32 obligations; narrow actual u32 load/broadcast/merge loop frame from entire aggregate to precisely written active lanes. No implementation/spec/model or function contract changes.')
(C/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=checker.prepare(C,sha(C/'frozen.json'),'guard01');(C/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');print(guard['passed'])
