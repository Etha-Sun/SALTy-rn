from pathlib import Path
import json,shutil,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;O=H/'qd8-nibbles-r4';N=H/'qd8-nibbles-r5';N.mkdir();d=json.loads((O/'frozen.json').read_text());plain=N/'.build/plain';edit=N/'.build/edit';plain.mkdir(parents=True)
for name,v in d['files'].items():shutil.copyfile(R/v['path'],plain/name)
shutil.copytree(plain,edit)
for p in d['proof_patches']:
 r=subprocess.run(['patch','-p1','-i',str(R/p)],cwd=edit,capture_output=True,text=True);assert r.returncode==0,r.stdout+r.stderr
p=edit/'quantized.c';old=p.read_text()
helper=['/*@ ghost','/@ terminates \\true; assigns \\nothing;', '    ensures qd8_shift8_bound_all: n<8 ==> (\\forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640);', '@/', 'static void qd8_shift8_bound(unsigned n) {','  switch(n) {']
for k in range(8):
    helper.append(f'    case {k}: /@ assert qd8_shift8_case_{k}: \\forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;')
helper+=['    default: return;','  }','}','*/','']
new='\n'.join(helper)+old
needle='vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl) { /*@ loop invariant 0<=i<=vl;'
assert new.count(needle)==1
new=new.replace(needle,'vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl) { /*@ ghost qd8_shift8_bound(n); */ /*@ loop invariant qd8_shift8_n: n<8; loop invariant qd8_shift8_all: \\forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; loop invariant 0<=i<=vl;')
p.write_text(new)
parts=[]
for q in sorted(edit.iterdir()):
 if not q.is_file():continue
 for line in difflib.unified_diff((plain/q.name).read_text().splitlines(True),q.read_text().splitlines(True),fromfile='a/'+q.name,tofile='b/'+q.name):parts.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(N/'proof.patch').write_text(''.join(parts));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='qd8-nibbles-r5',previous_version=str(O.relative_to(R)),proof_patches=[str((N/'proof.patch').relative_to(R))],proof_sha256=sha(N/'proof.patch'),stage3_revision='Eight-case no-requires ghost proof of bounded byte shifts, instantiated at real vsll entry with checked loop invariants; original bits_i8 byte bridge remains unproved.')
d['stage3']['proof_sha256']=sha(N/'proof.patch');d['stage3']['previous_candidate_frozen_sha256']=sha(O/'frozen.json');(N/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(N/'freeze-sha256.txt').write_text(sha(N/'frozen.json')+'\n');(N/'REVIEW.diff').write_text(''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='nibbles-r4/quantized.c',tofile='nibbles-r5/quantized.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(N,sha(N/'frozen.json'),'guard01');(N/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('guard passed',flush=True)
