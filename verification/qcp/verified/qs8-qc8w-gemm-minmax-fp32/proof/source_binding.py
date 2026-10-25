#!/usr/bin/env python3
"""Check raw/annotated C token identity before and after the same preprocessor."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess
from prepare import ROOT,source,code
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def audit(generation_run,out):
 out.mkdir(exist_ok=False,parents=True);summary=json.loads((ROOT/'.build'/generation_run/'generation-summary.json').read_text());assert summary['passed'];rows=[]
 for side in ['neon','rvv']:
  row=next(x for x in summary['units']if x['unit']==side);G=ROOT/'.build'/row['source_run']/'generation'/side;S=G/'snapshot'
  assert all(sha(ROOT/f)==h and sha(S/f)==h for f,h in row['input_hashes'].items())
  impl=ROOT/'impl'/('testNEON.c'if side=='neon'else'testRVV.c');raw='#include "shim/'+side+'-api.h"\n'+impl.read_text();annotated=source(side)
  assert [x.group()for x in code(raw)]==[x.group()for x in code(annotated)]
  assert annotated==(G/'annotated.c').read_text()
  # No added preprocessor directives are hidden in proof annotations.
  directives=lambda s:re.findall(r'(?m)^\s*#.*$',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
  assert directives(raw)==directives(annotated)
  plain=out/(side+'-plain.c');plain.write_text(raw);cpp=out/(side+'-plain-cpp.c')
  cmd=['gcc','-E','-P','-CC','-nostdinc','-I',str(S),'-I',str(S/'shim'),str(plain),'-o',str(cpp)];r=subprocess.run(cmd,capture_output=True,text=True,timeout=180);assert r.returncode==0,r.stderr
  expected=G/(side+'.c');tokens=[x.group()for x in code(cpp.read_text())];assert tokens==[x.group()for x in code(expected.read_text())],side
  rows.append({'side':side,'impl_sha256':sha(impl),'annotated_sha256':sha(G/'annotated.c'),'plain_cpp_sha256':sha(cpp),'annotated_cpp_sha256':sha(expected),'cpp_token_sha256':hashlib.sha256(' '.join(tokens).encode()).hexdigest(),'cpp_tokens':len(tokens),'same_tokens':True,'same_directives':True,'source_generation_run':row['source_run'],'command':cmd})
 result={'passed':True,'units':rows,'scope':'Source token/CPP identity with the declared shim. Intrinsic and abstract field-layout correspondence remain explicitly source-reviewed trust boundaries.'};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');return result
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--generation-run',required=True);p.add_argument('--run',required=True);a=p.parse_args();r=audit(a.generation_run,ROOT/'.build'/a.run/'source-binding');print('actual C and CPP identity passed',len(r['units']))
