import os,re,sys,json
base=sys.argv[1]
fin=base+'/upstream/optimized-rvv-kernels'; up=base+'/upstream/salty-rn-upstream/kernels'
alias={'dwconv2d-chw.c':'f32-dwconv2d-chw.c','x32transpose.c':'x32-transposec.c'}
def sig(path,names):
    s=open(path).read()
    s=re.sub(r'//.*','',s); s=re.sub(r'/\*.*?\*/','',s,flags=re.S)
    for n in names:
        m=re.search(r'\b'+n+r'\s*\(([^)]*)\)',s)
        if m:
            ps=[re.sub(r'\s+',' ',p.strip()) for p in m.group(1).split(',')]
            ps=[re.sub(r'\b(restrict|XNN_RESTRICT|const)\b','',p) for p in ps]
            ps=[re.sub(r'\s+',' ',p).replace(' *','*').strip() for p in ps]
            return n,ps
    return None,None
out={}
for f in sorted(os.listdir(fin)):
    if not f.endswith('.c'): continue
    k=alias.get(f,f)
    n1,a=sig(f'{up}/source/{k}',['test_neon'])
    n2,b=sig(f'{up}/target/{k}',['test_rvv'])
    n3,c=sig(f'{fin}/{f}',['test_rvv',r'xnn_\w+'])
    ta=lambda ps:[re.sub(r'\s*\w+$','',p) if p!='void' else p for p in ps] if ps else None
    out[f]={'neon':a,'pre':b,'final':c,'final_name':n3,'types_neon_eq_final':ta(a)==ta(c),'types_pre_eq_final':ta(b)==ta(c)}
    print(f"{f:28} neon==final:{out[f]['types_neon_eq_final']!s:5} pre==final:{out[f]['types_pre_eq_final']!s:5} {n3}")
json.dump(out,open(base+'/signatures.json','w'),indent=1)
