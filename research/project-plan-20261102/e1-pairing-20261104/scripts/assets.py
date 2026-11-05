import os,sys,hashlib,re,json
base,V=sys.argv[1],sys.argv[2]
up=base+'/upstream/salty-rn-upstream/kernels'
alias={'dwconv2d-chw.c':'f32-dwconv2d-chw','x32transpose.c':'x32-transposec'}
def norm(s):
    s=re.sub(r'//.*','',s); s=re.sub(r'/\*.*?\*/','',s,flags=re.S); s=re.sub(r'#\s*include.*','',s)
    return re.sub(r'\s+','',s)
fin=base+'/upstream/optimized-rvv-kernels'
out={}
for f in sorted(os.listdir(fin)):
    if not f.endswith('.c'): continue
    k=alias.get(f,f[:-2])
    cands=[d for d in os.listdir(V) if d==k or d.startswith(k)]
    r={'verified_dirs':cands}
    if k in cands:
        d=f'{V}/{k}'
        n=f'{d}/impl/testNEON.c'; rv=f'{d}/impl/testRVV.c'
        r['spec']=os.path.exists(f'{d}/spec.c')
        if os.path.exists(n):
            r['neon_eq_upstream_norm']=norm(open(n).read())==norm(open(f'{up}/source/{k}.c').read())
        if os.path.exists(rv):
            R=norm(open(rv).read())
            r['old_rvv_eq_final_norm']=R==norm(open(f'{fin}/{f}').read())
            r['old_rvv_eq_target_norm']=R==norm(open(f'{up}/target/{k}.c').read())
    out[f]=r
    print(f'{f:28}',r)
json.dump(out,open(base+'/proof-assets.json','w'),indent=1)
