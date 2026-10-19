from pathlib import Path
import shutil,json,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'qd8-round-r2';c=H/'qd8-round-r3';c.mkdir();d=json.loads((old/'frozen.json').read_text());plain=c/'.build/plain';ann=c/'.build/edit';plain.mkdir(parents=True)
for name,item in d['files'].items():shutil.copyfile(R/item['path'],plain/name)
shutil.copytree(plain,ann)
for pp in d['proof_patches']:
 result=subprocess.run(['patch','-p1','-i',str(R/pp)],cwd=ann,text=True,capture_output=True);assert result.returncode==0,result.stdout+result.stderr
p=ann/'utils.c';s=p.read_text();original_rvv=s
helper=r"""/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures qd8_clear_half: (x & (SIZE_MAX-1))==2*(x/2);
    ensures qd8_clear_compensation: (x & (SIZE_MAX-1))==x-x%2;
@/
static void qd8_clear_low(size_t x) {
  /@ assert qd8_clear_split: x==2*(x/2)+x%2; @/
  /@ assert qd8_clear_shift_mask: (x & (SIZE_MAX-1))==((x>>1)<<1); @/
  /@ assert qd8_clear_shift_half: (x>>1)==x/2; @/
  /@ assert qd8_clear_shift_restore: ((x>>1)<<1)==2*(x>>1); @/
}
*/
/*@ \wp::strategy Qd8BitChild: \prover("z3",30), \prover("cvc5",30);
    \wp::strategy Qd8Bit64: \tactic("Wp.bitwised",\ingoal(A==B),\param("Wp.bitwised.range",64),\children(Qd8BitChild)), Qd8BitChild;
    \wp::proof Qd8Bit64: qd8_clear_low;
*/
"""
s=s.replace('/*@ ensures qd8_round_range:',helper+'/*@ ensures qd8_round_range:')
s=s.replace('  /*@ assert qd8_round_mask_half:', '  //@ ghost qd8_clear_low((size_t)(n+1));\n  /*@ assert qd8_round_mask_half:')
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='qd8-round-r3',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),wp_timeout=30,wp_budget=1200,stage3_revision='Body-proved unsigned split/shift/low-bit compensation ghost helper; checked 64-bit equality tactic. No requires and no semantic model changes; all helper VCs required.')
d['stage3']['previous_candidate_frozen_sha256']=sha(old/'frozen.json');d['stage3']['proof_sha256']=sha(c/'proof.patch');(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n');(c/'REVIEW.diff').write_text(''.join(difflib.unified_diff(original_rvv.splitlines(True),s.splitlines(True),fromfile='round-r2/utils.c',tofile='round-r3/utils.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(c,sha(c/'frozen.json'),'guard01');(c/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('source guard passed')
