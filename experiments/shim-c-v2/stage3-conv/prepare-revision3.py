from pathlib import Path
import sys,json,hashlib,difflib,shutil,re
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
name='f32-conv-hwc2chw';old=HERE/'revision2'/name;case=HERE/'revision3'/name;case.mkdir(parents=True);data=json.loads((old/'frozen.json').read_text());work=case/'.build/edit';shutil.copytree(old/'.build/guard02/annotated',work)
# Carry forward six old body-checked candidates, then strengthen inactive lanes.
source=HERE.parent/'complex-v3-next/integer-helper-candidate/fp_index.c';s=source.read_text();plain=HERE/name/'.build/guard01/plain'
assert checker.guard.raw_c_tokens(s)==checker.guard.raw_c_tokens((plain/'fp_index.c').read_text())
s=s.replace('i<=j<vl ==> a.lane[j]==\\at(a.lane[j],Pre)','i<=j<4 ==> a.lane[j]==\\at(a.lane[j],Pre)')
# Each return contract records the lanes that the implementation does not write.
pattern=r'/\*@ requires vl<=4; assigns \\nothing; ensures (.*?) \*/\n(v\w+ (\w+)\([^\n]+)'
def strengthen(m):
 name=m.group(3);expr='0' if name in {'__riscv_vid_v_u32m1','__riscv_vmsge_vx_i32m1_b32','__riscv_vmslt_vx_i32m1_b32'} else 'a.lane[j]'
 return '/*@ requires vl<=4; assigns \\nothing; ensures '+m.group(1)+'\n ensures stage3_inactive: \\forall integer j;vl<=j<4 ==> \\result.lane[j]=='+expr+'; */\n'+m.group(2)
s=re.sub(pattern,strengthen,s)
# For zero-initialized results, untouched suffix remains zero during iteration.
s=s.replace('loop assigns i,r; loop variant vl-i;',r'loop invariant stage3_zero_suffix: \forall integer j;i<=j<4 ==> r.lane[j]==0; loop assigns i,r; loop variant vl-i;')
(work/'fp_index.c').write_text(s)
patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch)
data.update(proof_patches=[str((case/'proof.patch').relative_to(ROOT))],previous_version=str(old.relative_to(ROOT)),wp_budget=1200,proof_stage='Stage3 conv revision3 merges six actual integer-index helper body proofs and adds inactive-lane frame conclusions; full input domain unchanged')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard03');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'reused_helper_source':str(source.relative_to(ROOT)),'reused_helper_sha256':sha(source),'note':'Six previous pure integer body candidates strengthened with inactive-lane conclusions; C tokens and old public spec unchanged'},indent=2)+'\n')
