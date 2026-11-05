"""Exact float32 acceptance interval for each frozen positive double oracle value."""
import struct,json,math,hashlib
from pathlib import Path
D=Path(__file__).resolve().parent/'fixtures/f32-raddstoreexpminusmax'
m=json.loads((D/'manifest.json').read_text());raw=(D/'data.bin').read_bytes();at=0;fields={}
for name,typ,n in m['fields']:
 size=struct.calcsize('<'+typ*n);fields[name]=struct.unpack('<'+typ*n,raw[at:at+size]);at+=size
assert at==len(raw)
def value(bits):return struct.unpack('<f',struct.pack('<I',bits))[0]
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
parts=[];count=0
for i in range(2):
 lows=[];highs=[]
 for ref in fields[f'c{i}_gold']:
  assert math.isfinite(ref) and ref>0
  tol=abs(ref)*1e-6
  good=lambda b: math.isfinite(value(b)) and abs(value(b)-ref)<=tol
  lo=bits(ref-tol);hi=bits(ref+tol)
  while not good(lo):lo+=1
  while good(lo-1):lo-=1
  while not good(hi):hi-=1
  while good(hi+1):hi+=1
  assert lo<=hi and good(lo) and good(hi) and not good(lo-1) and not good(hi+1)
  # The double absolute-error predicate is monotone on either side of ref.
  for b in range(lo,hi+1):assert good(b)
  lows.append(value(lo).hex()+'f');highs.append(value(hi).hex()+'f');count+=1
 for label,vals in [('lower',lows),('upper',highs)]:parts.append(f'static const float c{i}_{label}[{len(vals)}]={{'+','.join(vals)+'};\n')
(D/'bounds.h').write_text(''.join(parts))
(D/'bounds-check.json').write_text(json.dumps(dict(claim_type='computed',checked_values=count,predicate='finite(float32_output) && abs(double(output)-double_gold)<=abs(double_gold)*1e-6',method='enumerate every accepted positive float32 and verify both adjacent rejected values; negative float32, NaN and infinities fail the positive interval',oracle_changed=False,data_sha256=hashlib.sha256(raw).hexdigest(),bounds_sha256=hashlib.sha256((D/'bounds.h').read_bytes()).hexdigest()),indent=2)+'\n')
print('Verified exact float32 intervals:',count)
