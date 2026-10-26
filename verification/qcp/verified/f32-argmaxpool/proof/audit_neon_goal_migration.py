#!/usr/bin/env python3
"""Compare actual goal definition closures; never transfers proof credit."""
from pathlib import Path
import argparse,hashlib,json,re
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def index(text):
 defs={}
 end=re.compile(r'\.(?=\s|$)')
 for m in re.finditer(r'^Definition (\w+) :=',text,re.M):
  e=end.search(text,m.end());assert e;defs[m[1]]=text[m.start():e.end()]
 names=set(defs);deps={n:(set(re.findall(r'\b[A-Za-z_]\w*\b',b))&names)-{n}for n,b in defs.items()};hashes={n:hashlib.sha256(b.encode()).hexdigest()for n,b in defs.items()};memo={}
 def visit(n,seen=frozenset()):
  if n in memo:return memo[n]
  assert n not in seen;ds={n}
  for d in deps[n]:ds|=visit(d,seen|{n})
  memo[n]=ds;return ds
 fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);out={}
 for n in fields:
  ns=sorted(visit(n));h=hashlib.sha256(json.dumps({d:hashes[d]for d in ns},sort_keys=True,separators=(',',':')).encode()).hexdigest();out[n]={'definition_sha256':hashes[n],'goal_definition_closure_sha256':h,'goal_definition_dependencies':ns}
 return out

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--generation-status',type=Path,required=True);ap.add_argument('--output',type=Path,required=True);a=ap.parse_args();g=json.loads(a.generation_status.read_text());assert g['passed']and g['isa']=='neon'and not g['prepare_only']and g['original_same_frontend_CPP_tokens_identical'];p=Path(g['goal_path']);assert sha(p)==g['goal_sha256'];old=json.loads((C/'proof/neon-old-definition-index.json').read_text());new=index(p.read_text());assert len(new)==g['actual_C_fields'];assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in old['models_sha256'].items()),'model changed'
 common=set(old['fields'])&set(new);same=sorted(n for n in common if old['fields'][n]['goal_definition_closure_sha256']==new[n]['goal_definition_closure_sha256']);changed=sorted(common-set(same));out={'passed':True,'scope':'source identity audit only; all selected proof .v must be compiled against the new exact goal, no old .vo reuse','whole_kernel_verified':False,'old_goal_sha256':old['goal_sha256'],'new_goal_sha256':g['goal_sha256'],'generation_status_sha256':sha(a.generation_status),'new_actual_fields':len(new),'unchanged_definition_closure_fields':same,'changed_definition_closure_fields':changed,'new_fields':sorted(set(new)-set(old['fields'])),'removed_fields':sorted(set(old['fields'])-set(new)),'new_definition_index':new};a.output.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:len(out[k])for k in['unchanged_definition_closure_fields','changed_definition_closure_fields','new_fields','removed_fields']}))
if __name__=='__main__':main()
