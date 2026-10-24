#!/usr/bin/env python3
"""Generate verification C from live public sources plus token-index annotations."""
from pathlib import Path
import hashlib,json,re
ROOT=Path(__file__).resolve().parents[1]
RX=re.compile(r'/\*.*?\*/|//[^\n]*|\w+|[^\s]',re.S)
def code(s):return [m for m in RX.finditer(s) if not m.group().startswith(('/*','//'))]
def kernel_contract(side):
 s=(ROOT/'spec.c').read_text().split('void test_'+side+'(',1)[1]
 c='/*@'+s.split('/*@',1)[1].split('*/',1)[0]+'*/'
 # Logically redundant consequences of domain_shape; checked in ContractBinding.v.
 assert c.count('Require domain_shape')==1
 return c.replace('Require domain_shape','Require mr==1 && 0<nc && 0<kc && domain_shape',1)
def prepare(side):
 source=ROOT/'impl'/('testNEON.c' if side=='neon' else 'testRVV.c')
 s=source.read_text();toks=code(s);plan=json.loads((ROOT/f'proof/c/{side}.json').read_text())
 assert hashlib.sha256(' '.join(m.group() for m in toks).encode()).hexdigest()==plan['source_token_sha256'],'source changed: review annotation positions'
 for ent in reversed(plan['annotations']):
  text=kernel_contract(side) if ent['kind']=='public_kernel_contract' else ent['text']
  assert text.startswith('/*@') and text.endswith('*/')
  pos=toks[ent['before_token']].start();s=s[:pos]+'\n'+text+'\n'+s[pos:]
 assert [m.group() for m in code(s)]==[m.group() for m in toks]
 return '#include "shim/'+side+'-api.h"\n'+s
UNITS={
 'neon':{'base':'neon_guard','namespace':'Qd8Guard','expected':'proof/coq/Qd8Guard/neon_guard_goal.v','fields':1446},
 'rvv':{'base':'rvv_isnan','namespace':'Qd8RvvGoals','expected':'proof/coq/Qd8RvvIsnan/rvv_isnan_goal.v','fields':395},
 'caller':{'base':'caller','namespace':'Qd8Caller','expected':'proof/coq/Qd8Caller/caller_goal.v','fields':42},
 'scalar_nan':{'base':'abi_probe','namespace':'Qd8RvvGoals','expected':'proof/coq/Qd8Nan/abi_probe_goal.v','fields':9},
 'neon_basic':{'base':'primitive','namespace':'Qd8Primitive','expected':'proof/coq/Qd8Primitive/primitive_goal.v','fields':22},
}
def source(unit):
 if unit in ('neon','rvv'):return prepare(unit)
 if unit=='caller':return (ROOT/'spec.c').read_text()
 return '#include "shim/'+{'scalar_nan':'scalar_nan.c','neon_basic':'neon-basic.c'}[unit]+'"\n'
