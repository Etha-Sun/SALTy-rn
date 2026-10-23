#!/usr/bin/env python3
"""Restore exact source/log receipts needed by historical input-identity checks.

Run this once before check_full.py in a configured clone without private caches.
This restores no .vo, changes no public source, and performs no formal proof.
The complete runner still regenerates every C/strategy goal and freshly compiles
all current proof sources. Original ordinary command/log provenance stays in
current-identity-audit.json; this script never reruns or reissues that old claim.
"""
from pathlib import Path
import hashlib,json
CASE=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 mapping=json.loads((CASE/'proof/evidence/dependency-rechecks/receipt-map.json').read_text())
 audit=json.loads((CASE/'proof/current-identity-audit.json').read_text())
 historical={r['public_path']:r for r in audit['changed_proof_dependency_actual_ordinary_recheck']}
 restored=0
 for row in mapping['records']:
  old=historical[row['public_path']]
  assert sha(CASE/row['public_path'])==row['source_sha256']==old['current_sha256']
  assert row['log_sha256']==old['log_sha256'] and old['exit_code']==0
  for kind,key in [('source','actual_ordinary_source'),('log','log_path')]:
   rel=Path(row[kind+'_target']);assert rel.parts[0]=='.build' and '..'not in rel.parts
   original=Path(old[key]);parts=original.parts;i=parts.index(CASE.name)
   assert Path(*parts[i+1:])==rel
   source=CASE/row[kind+'_backup'];assert source.resolve().is_relative_to(CASE/'proof/evidence/dependency-rechecks')
   assert sha(source)==row[kind+'_sha256']
   target=CASE/rel;assert target.resolve().is_relative_to(CASE/'.build')
   target.parent.mkdir(parents=True,exist_ok=True)
   if target.exists():assert target.read_bytes()==source.read_bytes()
   else:target.write_bytes(source.read_bytes());restored+=1
 print(json.dumps({'restored_receipt_files':restored,'formal_proof_replayed':False,'compiled_objects_restored':0}))
 return 0
if __name__=='__main__':raise SystemExit(main())
