import struct,re,json,hashlib
from pathlib import Path
OUT=Path(__file__).resolve().parent;rows=[]
for d in (OUT/'fixtures').iterdir():
 if not (d/'data.bin').exists():continue
 raw=(d/'data.bin').read_bytes();m=json.loads((d/'manifest.json').read_text());text=(d/'data.h').read_text()
 arrays={name:(typ,int(n),body) for typ,name,n,body in re.findall(r'static const\s+(float|double|uint32_t)\s+(\w+)\[(\d+)\]\s*=\s*\{([^}]*)\};',text,re.S)}
 at=0;checked=[]
 for name,typ,n in m['fields']:
  ctype,declared,body=arrays[name];tokens=[v.strip() for v in body.split(',') if v.strip()]
  assert len(tokens)==n and declared>=n,(name,len(tokens),n,declared)
  if typ=='I':vals=[int(t.rstrip('uU'),0) for t in tokens]
  else:vals=[float.fromhex(t[:-1] if ctype=='float' else t) for t in tokens]
  data=struct.pack('<'+typ*n,*vals);assert raw[at:at+len(data)]==data,(d.name,name);at+=len(data);checked.append(dict(field=name,items=n,declared=declared))
 assert at==len(raw)
 rows.append(dict(kernel=d.name,claim_type='computed',header_matches_binary_bitwise=True,data_sha256=hashlib.sha256(raw).hexdigest(),header_sha256=hashlib.sha256(text.encode()).hexdigest(),fields=checked))
(OUT/'environment/input-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print('Bitwise fixture verification:',[(r['kernel'],sum(f['items'] for f in r['fields'])) for r in rows])
