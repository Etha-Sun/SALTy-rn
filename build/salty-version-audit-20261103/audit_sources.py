import subprocess,json,hashlib,re,difflib
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]; OUT=Path(__file__).resolve().parent
SALT=ROOT/'research/sol-pipeline-comparison-20261030/sources/SALTy-rn'
OPT=ROOT/'research/sol-pipeline-comparison-20261030/round5-paper-bottom3/optimized-rvv-kernels'
def git(repo,*args):return subprocess.check_output(['git','-C',str(repo),*args])
def sha(b):return hashlib.sha256(b).hexdigest()
def save(k,role,b,origin,commit,path):
 d=OUT/'sources'/k;d.mkdir(parents=True,exist_ok=True);p=d/(role+'.c');p.write_bytes(b)
 return dict(role=role,source=str(p),origin=origin,commit=commit,path=path,sha256=sha(b),symbols=re.findall(r'\bvoid\s+(\w+)\s*\(',b.decode()))
rows=[]
for a in sorted((ROOT/'kernels/target').glob('*.c')):
 k=a.stem;rel='kernels/target/'+a.name;b=a.read_bytes()
 refs=git(SALT,'log','--all','--format=%H','--',rel).decode().splitlines()
 original=git(SALT,'show',refs[-1]+':'+rel) if refs else None
 latest=git(SALT,'show','HEAD:'+rel) if refs else None
 op={'x32-transposec':'x32transpose','f32-dwconv2d-chw':'dwconv2d-chw'}.get(k,k)+'.c';optimized=(OPT/op).read_bytes() if (OPT/op).exists() else None
 head=git(ROOT,'show','HEAD:'+rel)
 r=dict(kernel=k,working_sha256=sha(b),head_sha256=sha(head),working_differs_head=b!=head,author_initial_commit=refs[-1] if refs else None,author_initial_sha256=sha(original) if original else None,author_latest_sha256=sha(latest) if latest else None,optimized_sha256=sha(optimized) if optimized else None,exact_initial=b==original,exact_latest=b==latest,exact_public_optimized=b==optimized,variants=[])
 if k in ['f32-vmulc','x32-transposec','f32-raddstoreexpminusmax','f32-gemm-minmax','f32-dwconv2d-chw']:
  r['variants'].append(save(k,'A-target',b,'workspace',git(ROOT,'rev-parse','HEAD').decode().strip()+' + working tree',rel))
  r['variants'].append(save(k,'A-head',head,'workspace HEAD',git(ROOT,'rev-parse','HEAD').decode().strip(),rel))
  if original:r['variants'].append(save(k,'B-initial',original,'https://github.com/keaganchern/SALTy-rn',refs[-1],rel))
  if optimized:r['variants'].append(save(k,'C-public',optimized,'https://github.com/keaganchern/optimized-rvv-kernels',git(OPT,'rev-parse','HEAD').decode().strip(),op))
  frozen='verification/qcp/verified/'+k+'/impl/testRVV.c'
  try:
   fb=git(ROOT,'show','821969733d7953a212c51839194add416fd5799b:'+frozen);r['variants'].append(save(k,'E-frozen',fb,'local frozen repairs','821969733d7953a212c51839194add416fd5799b',frozen))
  except subprocess.CalledProcessError:pass
  for v in r['variants'][1:]:
   diff=''.join(difflib.unified_diff(b.decode().splitlines(True),Path(v['source']).read_text().splitlines(True),fromfile='A-target',tofile=v['role']))
   (OUT/'sources'/k/(v['role']+'.diff')).write_text(diff)
 rows.append(r)
(OUT/'identity.json').write_text(json.dumps(rows,indent=2)+'\n')
for r in rows:print(r['kernel'],'initial=',r['exact_initial'],'public-opt=',r['exact_public_optimized'],'dirty=',r['working_differs_head'])
