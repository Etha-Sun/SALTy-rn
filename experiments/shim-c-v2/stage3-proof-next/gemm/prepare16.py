from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate09';new=H/'candidate16';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();anchor='void test_neon(';ann=r"""/*@ predicate next_vec_same(float32x4_t a, float32x4_t b) =
 ext_same(a.lane[0],b.lane[0]) && ext_same(a.lane[1],b.lane[1]) &&
 ext_same(a.lane[2],b.lane[2]) && ext_same(a.lane[3],b.lane[3]); */
/*@ ghost
 /@ assigns \nothing;
    ensures next_copy_post_0: ext_same(\result.lane[0],v.lane[0]);
    ensures next_copy_post_1: ext_same(\result.lane[1],v.lane[1]);
    ensures next_copy_post_2: ext_same(\result.lane[2],v.lane[2]);
    ensures next_copy_post_3: ext_same(\result.lane[3],v.lane[3]);
 @/
 static float32x4_t next_structcopy(float32x4_t v) {
   float32x4_t copy = v;
   /@ assert next_copy_aggregate: next_vec_same(copy,v); @/
   /@ assert next_copy_lane_0: ext_same(copy.lane[0],v.lane[0]); @/
   /@ assert next_copy_lane_1: ext_same(copy.lane[1],v.lane[1]); @/
   /@ assert next_copy_lane_2: ext_same(copy.lane[2],v.lane[2]); @/
   /@ assert next_copy_lane_3: ext_same(copy.lane[3],v.lane[3]); @/
   return copy;
 }
*/

""";assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor);p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Independent real C ghost structcopy with fully defined aggregate predicate cut: by-value input, actual local struct copy, four lane assertions and four return ensures, no requires. Not called from kernel yet; no claim of loop-frame closure.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
