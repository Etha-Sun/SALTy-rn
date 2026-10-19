from pathlib import Path
import json,shutil,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;O=H/'qd8-round-r4-bitwised-v2';N=H/'qd8-nibbles-r1';N.mkdir();d=json.loads((O/'frozen.json').read_text());plain=N/'.build/plain';edit=N/'.build/edit';plain.mkdir(parents=True)
for name,v in d['files'].items():shutil.copyfile(R/v['path'],plain/name)
shutil.copytree(plain,edit)
for p in d['proof_patches']:
 r=subprocess.run(['patch','-p1','-i',str(R/p)],cwd=edit,capture_output=True,text=True);assert r.returncode==0,r.stdout+r.stderr
p=edit/'rvv.c';old=p.read_text();helper=r'''/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures qd8_scalar_low: (int8_t)((uint8_t)x<<4)==16*stage3_signed_nibble((uint8_t)x%16);
    ensures qd8_scalar_high: (int8_t)((uint8_t)x & (uint8_t)240)==16*stage3_signed_nibble((uint8_t)x/16);
@/
static void qd8_nibble_scalar(int8_t x) {
  unsigned u=(uint8_t)x;
  unsigned lo=u%16;
  unsigned hi=u/16;
  /@ assert qd8_nibble_shift_mod: (uint8_t)(u<<4)==16*(u%16); @/
  /@ assert qd8_nibble_mask_div: (u & 240U)==16*(u/16); @/
  if (lo<8) {
    /@ assert qd8_nibble_low_positive: (int8_t)(u<<4)==16*lo; @/
  } else {
    /@ assert qd8_nibble_low_negative: (int8_t)(u<<4)==16*(lo-16); @/
  }
  if (hi<8) {
    /@ assert qd8_nibble_high_positive: (int8_t)(u & 240U)==16*hi; @/
  } else {
    /@ assert qd8_nibble_high_negative: (int8_t)(u & 240U)==16*(hi-16); @/
  }
}
*/
'''
loop=r'''      /*@ ghost
        size_t qd8_j=0;
        /@ loop invariant qd8_nibble_index: 0<=qd8_j<=vl && vl<=32;
           loop invariant qd8_nibble_low_prefix: \forall integer j;0<=j<qd8_j ==> vb_c0.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]%16);
           loop invariant qd8_nibble_high_prefix: \forall integer j;0<=j<qd8_j ==> vb_c1.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]/16);
           loop assigns qd8_j;
           loop variant vl-qd8_j;
        @/
        for (;qd8_j<vl;++qd8_j) qd8_nibble_scalar(vb_c01.lane[qd8_j]);
      */
'''
needle='      /*@ assert stage3_low_nibble:';assert old.count(needle)==1;new=helper+old.replace(needle,loop+needle);p.write_text(new)
parts=[]
for q in sorted(edit.iterdir()):
 if not q.is_file():continue
 for line in difflib.unified_diff((plain/q.name).read_text().splitlines(True),q.read_text().splitlines(True),fromfile='a/'+q.name,tofile='b/'+q.name):parts.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(N/'proof.patch').write_text(''.join(parts));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='qd8-nibbles-r1',previous_version=str(O.relative_to(R)),proof_patches=[str((N/'proof.patch').relative_to(R))],proof_sha256=sha(N/'proof.patch'),stage3_revision='No-requires body-proved signed-nibble scalar helper and ghost prefix instantiation; all original nibble assertions retained.')
d['stage3']['proof_sha256']=sha(N/'proof.patch');d['stage3']['previous_candidate_frozen_sha256']=sha(O/'frozen.json');(N/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(N/'freeze-sha256.txt').write_text(sha(N/'frozen.json')+'\n');(N/'REVIEW.diff').write_text(''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='round-r4/rvv.c',tofile='nibbles-r1/rvv.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(N,sha(N/'frozen.json'),'guard01');(N/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('guard passed',flush=True)
