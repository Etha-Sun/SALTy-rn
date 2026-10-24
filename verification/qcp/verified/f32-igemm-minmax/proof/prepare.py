"""Actual public C plus token-bound proof annotations; no stored body copies."""
from pathlib import Path
import hashlib,json,re
ROOT=Path(__file__).resolve().parents[1]
RX=re.compile(r'/\*.*?\*/|//[^\n]*|\w+|[^\s]',re.S)
def tokens(s):return [m for m in RX.finditer(s)if not m.group().startswith(('/*','//'))]
def kernel_contract(side):
    s=(ROOT/'spec.c').read_text().split('void test_'+side+'(',1)[1]
    return '/*@'+s.split('/*@',1)[1].split('*/',1)[0]+'*/'
def source(unit):
    if unit=='caller':return (ROOT/'spec.c').read_text()
    if unit=='ordinary':return (ROOT/'shim/ordinary.c').read_text()
    original=(ROOT/'impl'/('testNEON.c'if unit=='neon'else'testRVV.c')).read_text()
    ts=tokens(original);plan=json.loads((ROOT/f'proof/c/{unit}.json').read_text())
    assert hashlib.sha256(' '.join(t.group()for t in ts).encode()).hexdigest()==plan['source_token_sha256']
    s=original
    for e in reversed(plan['annotations']):
        text=kernel_contract(unit)if e['kind']=='public_kernel_contract'else e['text']
        assert text.startswith('/*@')and text.endswith('*/')
        if e['kind']!='public_kernel_contract':assert not re.search(r'\b(?:Require|Ensure)\b',text)
        pos=ts[e['before_token']].start();s=s[:pos]+'\n'+text+'\n'+s[pos:]
    assert [t.group()for t in tokens(s)]==[t.group()for t in ts]
    return '#include "shim/'+unit+'/api.h"\n'+s
UNITS={
    'rvv':{'base':'rvv','namespace':'FloatIgRvv','strategies':[('shim/rvv','GemmRvv')]},
    'neon':{'base':'neon','namespace':'FloatIgNeon','strategies':[('shim/neon','GemmNeon')]},
    'caller':{'base':'caller','namespace':'FloatIgCaller','strategies':[]},
    'ordinary':{'base':'ordinary','namespace':'FloatIgOrdinary','strategies':[]},
}
