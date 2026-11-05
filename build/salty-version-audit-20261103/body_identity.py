import re,json
from pathlib import Path
OUT=Path(__file__).resolve().parent;ROOT=OUT.parents[1]
OPT=ROOT/'research/sol-pipeline-comparison-20261030/round5-paper-bottom3/optimized-rvv-kernels'
def extract(t):
 t=re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S)
 m=re.search(r'\bvoid\s+(?:test_rvv|xnn_\w+)\s*\(',t)
 if not m:return None
 a=t.index('{',m.end());depth=0
 for b in range(a,len(t)):
  if t[b]=='{':depth+=1
  if t[b]=='}':depth-=1
  if depth==0:return re.sub(r'\s+','',t[a:b+1])
rows=json.loads((OUT/'identity.json').read_text())
for r in rows:
 k=r['kernel'];fn={'x32-transposec':'x32transpose','f32-dwconv2d-chw':'dwconv2d-chw'}.get(k,k)+'.c';p=OPT/fn
 a=(ROOT/'kernels/target'/(k+'.c')).read_text()
 r['entry_body_exact_public_optimized']=bool(p.exists() and extract(a) is not None and extract(a)==extract(p.read_text()))
 if r['entry_body_exact_public_optimized']:print('SAME BODY',k)
(OUT/'identity.json').write_text(json.dumps(rows,indent=2)+'\n')
print('Equal bodies:',sum(r['entry_body_exact_public_optimized'] for r in rows))
