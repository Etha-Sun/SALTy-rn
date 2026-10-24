#!/usr/bin/env python3
"""Live public sources and token-index proof annotations, no hidden C/contract templates."""
from pathlib import Path
import re,json,hashlib
ROOT=Path(__file__).resolve().parents[1]
RX=re.compile(r'/\*.*?\*/|//[^\n]*|\w+|[^\s]',re.S)
def code(s):return [m for m in RX.finditer(s) if not m.group().startswith(('/*','//'))]
def kernel_contract(side):
 s=(ROOT/'spec.c').read_text().split('#else',1)[0].split('void test_'+side+'(',1)[1]
 return '/*@'+s.split('/*@',1)[1].split('*/',1)[0]+'*/'
def prepare(side):
 s=(ROOT/'impl'/('testNEON.c' if side=='neon' else 'testRVV.c')).read_text();toks=code(s)
 plan=json.loads((ROOT/f'proof/c/{side}.json').read_text())
 assert hashlib.sha256(' '.join(m.group() for m in toks).encode()).hexdigest()==plan['source_token_sha256'],'source changed: review annotation positions'
 for e in reversed(plan['annotations']):
  text=kernel_contract(side) if e['kind']=='public_kernel_contract' else e['text']
  assert text.startswith('/*@') and text.endswith('*/')
  pos=toks[e['before_token']].start();s=s[:pos]+'\n'+text+'\n'+s[pos:]
 assert [m.group() for m in code(s)]==[m.group() for m in toks]
 return '#include "shim/'+{'neon':'neon/shim-undef.h','rvv':'rvv/intrinsic-spec.h'}[side]+'"\n'+s
UNITS={
 'neon':{'base':'neon_full','namespace':'FullDomainNeonRun','expected':'proof/coq/FullDomainNeonVC/neon_full_goal.v','fields':459,'strategies':[('shim/neon','GemmNeon')],'application_limit':512},
 'rvv':{'base':'unit','namespace':'FullDomainRvv','expected':'proof/coq/RvvOriginalVC03/unit_goal.v','fields':391,'strategies':[('shim/rvv','GemmRvv'),('shim/cleanup','FullCleanupV2')],'application_limit':4096},
 'caller':{'base':'spec','namespace':'FullDomainCallerVC','expected':'proof/coq/FullDomainCallerVC/spec_goal.v','fields':44,'strategies':[('shim/comparator','VaddComparator')],'application_limit':4096}
}
def source(unit):return prepare(unit) if unit in ('neon','rvv') else (ROOT/'spec.c').read_text()
