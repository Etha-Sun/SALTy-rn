from pathlib import Path
import json,shutil,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;O=H/'qd8-nibbles-r2';N=H/'qd8-nibbles-r3';N.mkdir();d=json.loads((O/'frozen.json').read_text());plain=N/'.build/plain';edit=N/'.build/edit';plain.mkdir(parents=True)
for name,v in d['files'].items():shutil.copyfile(R/v['path'],plain/name)
shutil.copytree(plain,edit)
for p in d['proof_patches']:
 r=subprocess.run(['patch','-p1','-i',str(R/p)],cwd=edit,capture_output=True,text=True);assert r.returncode==0,r.stdout+r.stderr
p=edit/'rvv.c';old=p.read_text()
body=['static void qd8_byte_parts(uint8_t u) {','  switch(u) {']
for k in range(256):
    body.append(f'    case {k}: /@ assert qd8_byte_case_{k:03d}: (uint8_t)((unsigned)u<<4)==16*(u%16) && ((unsigned)u & 240U)==16*(u/16); @/ return;')
body+=['    default: /@ assert qd8_byte_cases_exhausted: \\false; @/ return;','  }','}']
needle='static void qd8_byte_parts(uint8_t u) {}';assert old.count(needle)==1
new=old.replace(needle,'\n'.join(body))
import re
new,n=re.subn(r'/\*@ \\wp::strategy Qd8ByteLeaf:.*?\*/\n','',new,flags=re.S);assert n==1
p.write_text(new)
parts=[]
for q in sorted(edit.iterdir()):
 if not q.is_file():continue
 for line in difflib.unified_diff((plain/q.name).read_text().splitlines(True),q.read_text().splitlines(True),fromfile='a/'+q.name,tofile='b/'+q.name):parts.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(N/'proof.patch').write_text(''.join(parts));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='qd8-nibbles-r3',previous_version=str(O.relative_to(R)),proof_patches=[str((N/'proof.patch').relative_to(R))],proof_sha256=sha(N/'proof.patch'),stage3_revision='Full 256-case uint8 ghost-body partition with independently named original-relation assertions and explicit default coverage obligation; no new requires.')
d['stage3']['proof_sha256']=sha(N/'proof.patch');d['stage3']['previous_candidate_frozen_sha256']=sha(O/'frozen.json');(N/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(N/'freeze-sha256.txt').write_text(sha(N/'frozen.json')+'\n');(N/'REVIEW.diff').write_text(''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='nibbles-r2/rvv.c',tofile='nibbles-r3/rvv.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(N,sha(N/'frozen.json'),'guard01');(N/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('guard passed',flush=True)
