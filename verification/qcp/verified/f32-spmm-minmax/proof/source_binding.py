#!/usr/bin/env python3
"""Check actual implementation/annotated C identity before and after preprocessing."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess
from prepare import ROOT,source,code
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def audit(generation_run,out):
 out.mkdir(exist_ok=False,parents=True);g=json.loads((ROOT/'.build'/generation_run/'generation-summary.json').read_text());assert g['passed'];records=[]
 for side in ['neon','rvv']:
  row=next(x for x in g['units']if x['unit']==side);G=ROOT/'.build'/row['source_run']/'generation'/side;S=G/'snapshot'
  assert all(sha(ROOT/f)==h and sha(S/f)==h for f,h in row['input_hashes'].items())
  impl=ROOT/'impl'/('testNEON.c'if side=='neon'else'testRVV.c');plain='#include "contracts/bindings.h"\n#include "shim/'+side+'-intrinsics.h"\n'+impl.read_text();annotated=source(side)
  assert [t.group()for t in code(plain)]==[t.group()for t in code(annotated)]
  assert annotated==(G/'annotated.c').read_text()
  directives=lambda s:re.findall(r'(?m)^\s*#.*$',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
  assert directives(plain)==directives(annotated)
  src=out/(side+'-plain.c');src.write_text(plain);cpp=out/(side+'-plain-cpp.c');cmd=['gcc','-E','-P','-CC','-nostdinc','-I',str(S),'-I',str(S/'shim'),str(src),'-o',str(cpp)]
  r=subprocess.run(cmd,capture_output=True,text=True,timeout=180);assert r.returncode==0,r.stderr
  tokens=[t.group()for t in code(cpp.read_text())];expected=G/(side+'.c');assert tokens==[t.group()for t in code(expected.read_text())]
  records.append({'side':side,'impl_sha256':sha(impl),'annotated_sha256':sha(G/'annotated.c'),'plain_cpp_sha256':sha(cpp),'annotated_cpp_sha256':sha(expected),'cpp_token_sha256':hashlib.sha256(' '.join(tokens).encode()).hexdigest(),'cpp_tokens':len(tokens),'same_tokens':True,'same_directives':True,'source_generation_run':row['source_run'],'command':cmd})
 r={'passed':True,'units':records,'scope':'Actual C token and CPP identity under declared shim; intrinsic/field-layout interpretations remain source-reviewed'};(out/'result.json').write_text(json.dumps(r,indent=2)+'\n');return r
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--generation-run',required=True);p.add_argument('--run',required=True);a=p.parse_args();r=audit(a.generation_run,ROOT/'.build'/a.run/'source-binding');print('C/CPP identity passed',len(r['units']))
