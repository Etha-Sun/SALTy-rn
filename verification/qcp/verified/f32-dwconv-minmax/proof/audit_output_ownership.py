#!/usr/bin/env python3
"""Reject duplicated owned output predicates in generated kernel VC premises.
This is a fail-closed pre-proof audit, not a correctness proof or certificate.
One complete kernel owns one output address set; all writes update that owner.
"""
from pathlib import Path
import argparse,hashlib,json,re

def audit(path,predicate='dw_output',max_owners=1):
 p=Path(path);raw=p.read_bytes();text=raw.decode();definitions=re.split(r'(?=^Definition )',text,flags=re.M);records=[];violations=[]
 for definition in definitions:
  match=re.match(r'Definition\s+(\w+)\s*:=',definition)
  if not match:continue
  name=match[1]
  for branch,body in enumerate(re.split(r'\n\)\s*\\/\s*\n\(\n(?=forall)',definition)):
   if '|--'not in body:continue
   premise=body.split('|--',1)[0]
   count=len(re.findall(r'\(\s*(?:\w+\.)*'+re.escape(predicate)+r'\s',premise))
   rec=dict(definition=name,branch=branch,owned_output_predicates=count);records.append(rec)
   if count>max_owners:violations.append(rec)
 return dict(passed=not violations,scope='generated VC premise ownership multiplicity audit only; not proof credit',goal=str(p.resolve()),goal_sha256=hashlib.sha256(raw).hexdigest(),predicate=predicate,maximum_owned_output_predicates=max_owners,audited_premises=len(records),violations=violations,records=records)
def main():
 p=argparse.ArgumentParser();p.add_argument('goal',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args();s=audit(a.goal);a.output.write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s[k]for k in ['passed','goal_sha256','audited_premises','violations']}));raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
