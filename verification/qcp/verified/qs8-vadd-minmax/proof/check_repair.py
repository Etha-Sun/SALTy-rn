#!/usr/bin/env python3
"""Reapply the exact repair patch to preserved original C bytes with zero fuzz."""
from pathlib import Path
import json,hashlib,subprocess,tempfile
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 r=Path(tempfile.mkdtemp(prefix='repair-',dir=C/'.build'));(r/'impl').mkdir();record=json.loads((C/'proof/repair.json').read_text());s=dict(passed=False,formal_proof=False,whole_kernel_verified=False,run_directory=str(r),input_sha256={n:sha(C/n)for n in ['proof/repair.json','proof/repair.patch','proof/original/testNEON.c','proof/original/testRVV.c','impl/testNEON.c','impl/testRVV.c','proof/check_repair.py']})
 try:
  assert sha(C/'proof/repair.patch')==record['patch_sha256']
  for token,kind in [('NEON','neon'),('RVV','rvv')]:
   original=C/'proof/original'/('test'+token+'.c');assert sha(original)==record['original_'+kind+'_sha256'];(r/'impl'/original.name).write_bytes(original.read_bytes())
  command=['patch','--batch','--fuzz=0','-p1','-i',str(C/'proof/repair.patch')]
  p=subprocess.run(command,cwd=r,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=30);(r/'patch.log').write_text(p.stdout);assert p.returncode==0 and not any(x in p.stdout.lower()for x in ['offset','fuzz','failed','reversed']),p.stdout
  for token,kind in [('NEON','neon'),('RVV','rvv')]:
   n='test'+token+'.c';assert(r/'impl'/n).read_bytes()==(C/'impl'/n).read_bytes();assert sha(r/'impl'/n)==record['repaired_'+kind+'_sha256']
  assert s['input_sha256']=={n:sha(C/n)for n in s['input_sha256']};s.update(passed=True,patch_exact_application_checked=True,command=command,patch_log_sha256=sha(r/'patch.log'))
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');d=C/'proof/repair-replay-status.json'
 if d.exists():(C/'proof/history'/('repair-replay-status-'+sha(d)+'.json')).write_bytes(d.read_bytes())
 d.write_bytes((r/'status.json').read_bytes());print(json.dumps(s,indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
