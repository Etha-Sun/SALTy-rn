from pathlib import Path
import shutil,json,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'qd8-round-r1';c=H/'qd8-round-r2';c.mkdir();d=json.loads((old/'frozen.json').read_text());plain=c/'.build/plain';ann=c/'.build/edit';plain.mkdir(parents=True)
for name,item in d['files'].items():shutil.copyfile(R/item['path'],plain/name)
shutil.copytree(plain,ann)
for pp in d['proof_patches']:
 result=subprocess.run(['patch','-p1','-i',str(R/pp)],cwd=ann,text=True,capture_output=True);assert result.returncode==0,result.stdout+result.stderr
p=ann/'utils.c';s=p.read_text();original_rvv=s
needle='size_t round_up_po2(size_t n,size_t q) { return (n+q-1)&~(q-1); }'
repl=r"""size_t round_up_po2(size_t n,size_t q) {
  /*@ assert qd8_round_sum_exact: q==2 && n<=SIZE_MAX-2 ==> (size_t)((size_t)(n+q)-1)==n+1; */
  /*@ assert qd8_round_mask_value: q==2 ==> (size_t)(~(size_t)(q-1))==SIZE_MAX-1; */
  /*@ assert qd8_round_mask_half: n<=SIZE_MAX-2 ==> ((size_t)(n+1) & (SIZE_MAX-1))==2*((n+1)/2); */
  return (n+q-1)&~(q-1);
}"""
assert needle in s;s=s.replace(needle,repl)
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='qd8-round-r2',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),wp_timeout=30,wp_budget=1200,stage3_revision='Three explicit checked arithmetic/mask cuts inside actual round_up_po2 body; no requires/assigns changes; mask-half cut remains separate proof debt.')
d['stage3']['previous_candidate_frozen_sha256']=sha(old/'frozen.json');d['stage3']['proof_sha256']=sha(c/'proof.patch');(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n');(c/'REVIEW.diff').write_text(''.join(difflib.unified_diff(original_rvv.splitlines(True),s.splitlines(True),fromfile='round-r1/utils.c',tofile='round-r2/utils.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(c,sha(c/'frozen.json'),'guard01');(c/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('source guard passed')
