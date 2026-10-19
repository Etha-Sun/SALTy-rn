"""Conservative Clang evidence for the seven isolated cases; no source mutation."""
import hashlib,json,re,subprocess,tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
REPO=HERE.parents[2]
CASES=['f32-vadd','f32-vmul','f32-vsub','f32-vdiv','f32-vmulc','f32-vmin','f32-vmax']
rows=[]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def ctype(n):return n.get('type',{}).get('desugaredQualType',n.get('type',{}).get('qualType'))
for name in CASES:
 manifest=REPO/'experiments/shim-c-v2/float'/name/'frozen.json'
 data=json.loads(manifest.read_text())
 with tempfile.TemporaryDirectory(prefix='fp-source-audit-') as tmp:
  dest=Path(tmp)
  for basename,item in data['files'].items():
   p=REPO/item['path'];assert sha(p)==item['sha256']
   (dest/basename).write_bytes(p.read_bytes())
  cmd=['clang-14','-fsyntax-only','-Xclang','-ast-dump=json',str(dest/'unit.c')]
  r=subprocess.run(cmd,capture_output=True,text=True,check=True);ast=json.loads(r.stdout)
  casts=[];negative_zero_syntax=[]
  def walk(n):
   kids=n.get('inner',[])
   if n.get('kind') in ['ImplicitCastExpr','CStyleCastExpr'] and kids:
    a,b=ctype(kids[0]),ctype(n)
    if a in ['float','double'] and b in ['float','double'] and a!=b:
     casts.append(dict(source=a,target=b,location=n.get('range'),kind=n.get('kind')))
   if n.get('kind')=='UnaryOperator' and n.get('opcode')=='-' and kids:
    q=kids[0]
    while q.get('kind') in ['ParenExpr','ImplicitCastExpr'] and q.get('inner'):q=q['inner'][0]
    if q.get('kind')=='FloatingLiteral' and float(q['value'])==0.0:negative_zero_syntax.append(n.get('range'))
   for k in kids:walk(k)
  walk(ast)
  ir={}
  for opt in ['0','1']:
   cmd=['clang-14','-O'+opt,'-S','-emit-llvm',str(dest/'unit.c'),'-o','-']
   r=subprocess.run(cmd,capture_output=True,text=True,check=True)
   negzero=[line.strip() for line in r.stdout.splitlines() if re.search(r'\b(?:float|double)\s+-0\.0+(?:e\+?0+)?\b|0x8000000000000000',line,re.I)]
   ir[opt]=dict(negative_zero_constant_lines=negzero)
  rows.append(dict(case=name,manifest_sha256=sha(manifest),frozen_source_hashes={i['path']:i['sha256'] for i in data['files'].values()},mixed_fp_casts=casts,negative_zero_literal_syntax=negative_zero_syntax,clang_llvm=ir,audit_passed=not casts and not negative_zero_syntax and all(not x['negative_zero_constant_lines'] for x in ir.values())))
output=dict(scope='Clang AST checks mixed FP casts/negative-zero literal syntax and Clang O0/O1 IR checks negative-zero constants. This is evidence for these frozen inputs, not a formal source-to-WP correctness theorem or complete analysis of all future constant folding.',clang='/usr/bin/clang-14',clang_sha256=sha(Path('/usr/bin/clang-14')),cases=rows)
(HERE/'evidence/seven-source-audit.json').write_text(json.dumps(output,indent=2)+'\n')
print(json.dumps([dict(case=r['case'],audit_passed=r['audit_passed'],mixed_fp_casts=len(r['mixed_fp_casts']),negative_zero_literal_syntax=len(r['negative_zero_literal_syntax']),ir_negative_zero=[len(x['negative_zero_constant_lines']) for x in r['clang_llvm'].values()]) for r in rows],indent=2))
