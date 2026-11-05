import json, subprocess, sys, os, re
base = sys.argv[1]
fin = os.path.join(base, 'upstream/optimized-rvv-kernels')
up = os.path.join(base, 'upstream/salty-rn-upstream')
local = sys.argv[2]
def blob(p):
    return subprocess.check_output(['git','hash-object',p]).decode().strip() if os.path.exists(p) else None
alias = {'dwconv2d-chw.c':'f32-dwconv2d-chw.c','x32transpose.c':'x32-transposec.c'}
rows=[]
for f in sorted(x for x in os.listdir(fin) if x.endswith('.c')):
    k = alias.get(f,f)
    r = {'final_file':f,'final_blob':blob(os.path.join(fin,f)),'pair_name':k,'name_alias':f!=k}
    for d in ('source','target','harness'):
        r['up_'+d]=blob(os.path.join(up,'kernels',d,k))
        r['local_'+d]=blob(os.path.join(local,'kernels',d,k))
    src=open(os.path.join(up,'kernels/source',k)).read() if r['up_source'] else ''
    r['neon_entry']=sorted(set(re.findall(r'\b(xnn_\w+_ukernel\w*|test_neon|test_\w+)\s*\(',src)))[:3]
    r['final_eq_up_target']= r['final_blob']==r['up_target']
    rows.append(r)
json.dump(rows,open(os.path.join(base,'pairing-raw.json'),'w'),indent=1)
for r in rows:
    print(f"{r['final_file']:28} src:{'Y' if r['up_source'] else '-'} tgt:{'Y' if r['up_target'] else '-'} har:{'Y' if r['up_harness'] else '-'} "
          f"lsrc={'=' if r['local_source']==r['up_source'] else '≠'} ltgt={'=' if r['local_target']==r['up_target'] else '≠'} final==tgt:{r['final_eq_up_target']} {r['neon_entry']}")
