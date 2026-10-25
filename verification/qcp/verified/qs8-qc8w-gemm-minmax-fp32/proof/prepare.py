from pathlib import Path
import re,json,hashlib
ROOT=Path(__file__).resolve().parents[1]
RX=re.compile(r'/\*.*?\*/|//[^\n]*|\w+|[^\s]',re.S)
def code(s):return [m for m in RX.finditer(s) if not m.group().startswith(('/*','//'))]
def kernel_contract(side):
 s=(ROOT/'spec.c').read_text().split('void test_'+side+'(',1)[1]
 return '/*@'+s.split('/*@',1)[1].split('*/',1)[0]+'*/'
def source(unit):
 if unit=='caller':return (ROOT/'spec.c').read_text()
 if unit=='ordinary':return '#include "shim/ordinary.c"\n'
 s=(ROOT/'impl'/('testNEON.c' if unit=='neon' else 'testRVV.c')).read_text()
 toks=code(s);p=json.loads((ROOT/f'proof/c/{unit}.json').read_text())
 assert hashlib.sha256(' '.join(t.group() for t in toks).encode()).hexdigest()==p['source_token_sha256']
 for a in reversed(p['annotations']):
  x=kernel_contract(unit) if a['kind']=='public_kernel_contract' else a['text'];assert x.startswith('/*@') and x.endswith('*/')
  off=toks[a['before_token']].start();s=s[:off]+'\n'+x+'\n'+s[off:]
 assert [t.group() for t in code(s)]==[t.group() for t in toks]
 return '#include "shim/'+unit+'-api.h"\n'+s
