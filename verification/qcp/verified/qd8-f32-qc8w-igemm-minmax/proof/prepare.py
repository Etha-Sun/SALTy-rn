#!/usr/bin/env python3
"""Only live implementation/contracts plus explicitly indexed proof annotations."""
from pathlib import Path
import re,json,hashlib
ROOT=Path(__file__).resolve().parents[1]
RX=re.compile(r'/\*.*?\*/|//[^\n]*|\w+|[^\s]',re.S)
def code(s):return [m for m in RX.finditer(s) if not m.group().startswith(('/*','//'))]
def contract(side):
 s=(ROOT/'spec.c').read_text().split('void test_'+side+'(',1)[1]
 return '/*@'+s.split('/*@',1)[1].split('*/',1)[0]+'*/'
def prepare(side):
 s=(ROOT/'impl'/('testNEON.c' if side=='neon' else 'testRVV.c')).read_text();tokens=code(s);plan=json.loads((ROOT/f'proof/c/{side}.json').read_text())
 assert hashlib.sha256(' '.join(m.group() for m in tokens).encode()).hexdigest()==plan['source_token_sha256'],'annotation source changed'
 for a in reversed(plan['annotations']):
  text=contract(side) if a['kind']=='public_kernel_contract' else a['text'];assert text.startswith('/*@') and text.endswith('*/')
  pos=tokens[a['before_token']].start();s=s[:pos]+'\n'+text+'\n'+s[pos:]
 assert [m.group() for m in code(s)]==[m.group() for m in tokens]
 return '#include "shim/'+side+'-api.h"\n'+s
