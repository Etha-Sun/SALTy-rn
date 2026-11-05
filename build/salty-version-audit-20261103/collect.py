"""Summarize only completed, passing RTL runs; never promote timeout samples."""
import csv,json,hashlib,math
from pathlib import Path
OUT=Path(__file__).resolve().parent
NAMES={'f32-raddstoreexpminusmax':'Exp','x32-transposec':'Transpose','f32-vmulc':'VMULC','f32-gemm-minmax':'FP32 GEMM','f32-dwconv2d-chw':'DWConv CHW'}
C={'f32-raddstoreexpminusmax':'C-branch-u4v','x32-transposec':'C-public','f32-vmulc':'C-public','f32-gemm-minmax':'C-public','f32-dwconv2d-chw':'C-public'}
D={'f32-raddstoreexpminusmax':'D-manual-u4v','x32-transposec':'D-manual-16x8','f32-vmulc':'D-manual-u8v','f32-gemm-minmax':'D-manual-nr64','f32-dwconv2d-chw':'D-manual-1x2v'}
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,j):p.write_text(json.dumps(j,indent=2)+'\n')
rows=[];samples=[]
for p in sorted((OUT/'runs').glob('*/*/*/result.json')):
 k,role,shape=p.parts[-4:-1];j=json.loads(p.read_text());bd=p.parent/'build.json';build=json.loads(bd.read_text()) if bd.exists() else {}
 compiler='Clang20.1.2' if 'clang' in shape else 'GCC15.2'
 primary=(k in ['f32-vmulc','f32-raddstoreexpminusmax','f32-gemm-minmax'] and 'avl0' in shape and 'aligned64' in shape and 'diagnostic' not in shape) or (k=='x32-transposec' and role in ['A-target','C-public','D-manual-16x8','E-frozen'] and 'cold1-avl0-aligned64-clang-diagnostic' in shape) or (k=='f32-dwconv2d-chw' and 'primary1-avl0-aligned64-clang' in shape)
 execution_passed=j.get('valid',False)
 protocol_defined='avl0' in shape
 valid=execution_passed and protocol_defined
 if execution_passed:
  assert j['binary_sha256']==sha(p.parent/'test.elf')
  assert j['simulator_sha256']=='ebcb231c066aa4b5365a401ecc97fbc40319a46abd2f4ea48991ffee3b8a0565'
  assert build['source_sha256']==sha(Path(build['source']))
 r=dict(kernel=k,role=role,shape=shape,kernel_compiler=compiler,primary=primary,valid=valid,execution_passed=execution_passed,protocol_defined=protocol_defined,aligned64='aligned64' in shape,cycles=j.get('min_cycles') if valid else None,returncode=j.get('returncode'),stage=j.get('stage'),reason=j.get('reason',j.get('error')),source_sha256=build.get('source_sha256'),binary_sha256=j.get('binary_sha256'),evidence=str(p),native=json.loads((p.parent/'native.json').read_text()) if (p.parent/'native.json').exists() else None)
 rows.append(r)
 for s in j.get('samples',[]):samples.append(dict(kernel=k,role=role,profile=shape,kernel_compiler=compiler,primary=primary,run_valid=valid,protocol_defined=protocol_defined,cycles=s['cycles'],repeat=s['repeat'],case=s['shape'],instret=s['instret'],final_batch_output_correct=s['correct'],independently_checked_this_call=(k!='f32-vmulc' or s['repeat']==2),evidence=str(p)))
write(OUT/'all-runs.json',rows)
with (OUT/'raw-cycles.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=list(samples[0]));w.writeheader();w.writerows(samples)
comparisons=[]
for k in NAMES:
 shapes=['author-ref3-avl0-aligned64'] if k=='f32-vmulc' else [str(i)+('-fastcheck1-avl0-aligned64' if 'radd' in k else '-cold1-avl0-aligned64' if k=='f32-gemm-minmax' else '-cold1-avl0-aligned64-clang-diagnostic' if k=='x32-transposec' else '-primary1-avl0-aligned64-clang') for i in range({'f32-raddstoreexpminusmax':2,'x32-transposec':3,'f32-gemm-minmax':1,'f32-dwconv2d-chw':5}[k])]
 for i,s in enumerate(shapes):
  r=dict(kernel=k,shape=s,roles={})
  for role in ['A-target','B-initial','B-autocomp-reference',C[k],D[k],'E-frozen']:
   found=next((x for x in rows if x['kernel']==k and x['role']==role and x['shape']==s),None)
   if k=='f32-gemm-minmax' and role=='E-frozen':
    retry=next((x for x in rows if x['kernel']==k and x['role']==role and x['shape']=='0-cold1-retry1'),None)
    if retry and retry['valid'] and retry['protocol_defined'] and not found.get('valid',False):found=retry
   if role=='B-initial' and k!='f32-gemm-minmax':
    found=next((x for x in rows if x['kernel']==k and x['role']=='A-target' and x['shape']==s),None)
    if found:found={**found,'alias_of':'A-target: byte-identical initial public source, reused measured ELF'}
   if role=='E-frozen' and k=='f32-vmulc':
    found=next((x for x in rows if x['kernel']==k and x['role']=='A-target' and x['shape']==s),None)
    if found:found={**found,'alias_of':'A-target: byte-identical frozen source, reused measured ELF'}
   r['roles'][role]=found or dict(valid=False,stage='not_started')
  def cyc(role):v=r['roles'][role];return v.get('cycles') if v.get('valid') else None
  a,b,c,d,e=cyc('A-target'),cyc('B-initial'),cyc(C[k]),cyc(D[k]),cyc('E-frozen')
  r.update(target_cycles=a,initial_cycles=b,optimized_cycles=c,manual_cycles=d,frozen_cycles=e,target_over_optimized=a/c if a and c else None,initial_over_optimized=b/c if b and c else None,manual_over_optimized=d/c if d and c else None,frozen_over_target=e/a if a and e else None,frozen_over_initial=e/b if b and e else None)
  comparisons.append(r)
write(OUT/'comparison.json',comparisons)
cols=['kernel','shape','target_cycles','initial_cycles','optimized_cycles','manual_cycles','frozen_cycles','target_over_optimized','initial_over_optimized','manual_over_optimized','frozen_over_target','frozen_over_initial']
with (OUT/'comparison.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=cols);w.writeheader();w.writerows({k:r[k] for k in cols} for r in comparisons)
print('Completed primary RTL runs:',sum(r['valid'] and r['primary'] for r in rows),'of',sum(r['primary'] for r in rows),'recorded')
for r in comparisons:print(NAMES[r['kernel']],r['shape'],r['target_cycles'],r['optimized_cycles'],r['manual_cycles'],r['frozen_cycles'])
