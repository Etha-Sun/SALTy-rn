from pathlib import Path
import shutil,json,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=R/'experiments/shim-c-v2/stage3-gemm/f32-igemm-minmax-r4';c=H/'igemm-cursor-r1';c.mkdir();d=json.loads((old/'frozen.json').read_text());plain=c/'.build/plain';ann=c/'.build/edit';plain.mkdir(parents=True)
for name,item in d['files'].items():shutil.copyfile(R/item['path'],plain/name)
shutil.copytree(plain,ann)
for pp in d['proof_patches']:
 result=subprocess.run(['patch','-p1','-i',str(R/pp)],cwd=ann,text=True,capture_output=True);assert result.returncode==0,result.stdout+result.stderr
p=ann/'rvv.c';s=p.read_text();original_rvv=s;s='''/*@ ghost
/@ terminates \\true; assigns \\nothing;
    ensures igemm_step4_math: 4<=k<=K && k%4==0 ==>
      (size_t)(k-4)==k-4 &&
      (K-(size_t)(k-4))/4==(K-k)/4+1 &&
      0<=(size_t)(k-4)<=K && ((size_t)(k-4))%4==0; @/
static void igemm_step4(size_t K,size_t k) {}
*/
'''+s
s=s.replace('loop invariant stage3_k:', 'loop invariant igemm_rvv_k:').replace('loop invariant a0==stage3_row+(KC-k)/4;', 'loop invariant igemm_rvv_row_cursor: a0==stage3_row+(KC-k)/4;').replace('loop invariant w==stage3_weights+8*((KC-k)/4);','loop invariant igemm_rvv_weight_cursor: w==stage3_weights+8*((KC-k)/4);')
needle='        k -= sizeof(float);';assert s.count(needle)==1
s=s.replace(needle,'''        /*@ assert igemm_before_sub: 4<=k<=KC && k%4==0; */
        //@ ghost igemm_step4(KC,k);
        /*@ assert igemm_k_exact: (size_t)(k-4)==k-4; */
        /*@ assert igemm_step_index: (KC-(size_t)(k-4))/4==(KC-k)/4+1; */
        /*@ assert igemm_row_advanced: a0==stage3_row+(KC-k)/4+1; */
        /*@ assert igemm_weight_advanced: w==stage3_weights+8*((KC-k)/4+1); */
        /*@ assert igemm_row_rebased: a0==stage3_row+(KC-(size_t)(k-4))/4; */
        /*@ assert igemm_weight_rebased: w==stage3_weights+8*((KC-(size_t)(k-4))/4); */
        /*@ assert igemm_next_range: 0<=(size_t)(k-4)<=KC && ((size_t)(k-4))%4==0; */
'''+needle)
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='f32-igemm-cursor-r1',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),wp_timeout=30,wp_budget=1200,stage3_revision='Proof-only decrement-four arithmetic body helper and cursor cuts. Same three RVV invariants renamed for exact selection; no new requires. All original FMA/indirection obligations retained.')
d['stage3']['previous_candidate_frozen_sha256']=sha(old/'frozen.json');d['stage3']['proof_sha256']=sha(c/'proof.patch');(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n');(c/'REVIEW.diff').write_text(''.join(difflib.unified_diff(original_rvv.splitlines(True),s.splitlines(True),fromfile='r4/rvv.c',tofile='igemm-cursor-r1/rvv.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(c,sha(c/'frozen.json'),'guard01');(c/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('source guard passed')
