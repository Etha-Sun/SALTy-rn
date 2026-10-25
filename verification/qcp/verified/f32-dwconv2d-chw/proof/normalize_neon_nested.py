#!/usr/bin/env python3
"""One-time explicit case-local compatibility repair, not a C compiler theorem."""
from pathlib import Path
import re,json,hashlib,shutil
C=Path(__file__).resolve().parent.parent;p=C/'impl/testNEON.c';raw=p.read_text();assert 'dw_nested_'not in raw
ret={'vget_low_f32':'float32x2_t','vget_high_f32':'float32x2_t','vreinterpretq_f32_u32':'float32x4_t','vreinterpretq_u32_f32':'uint32x4_t','vandq_u32':'uint32x4_t','vmaxq_f32':'float32x4_t','vminq_f32':'float32x4_t'}
rows=[];out=[]
for line in raw.splitlines(True):
 prefix=re.match(r'\s*',line)[0];code=line;decls=[]
 while True:
  calls=[]
  for m in re.finditer(r'\b(v\w+)\s*\(',code):
   d=1;j=m.end()
   while d:d+=(code[j]=='(')-(code[j]==')');j+=1
   calls.append((m.start(),j,m[1],m.end()))
  nested=[c for c in calls if any(a<c[0]and c[1]<b for a,b,_,_ in calls)]
  if not nested:break
  a,b,name,par=next(c for c in reversed(nested)if not any(c[0]<v[0]and v[1]<c[1]for v in nested))
  assert name in ret,name;expr=code[a:b];args=[x.strip()for x in code[par:b-1].split(',')];assert all(re.fullmatch(r'[A-Za-z_]\w*|[0-9]+',x)for x in args),(name,args)
  tmp='dw_nested_'+str(len(rows));decls.append(prefix+'const '+ret[name]+' '+tmp+' = '+expr+';\n');rows.append({'temporary':tmp,'type':ret[name],'original_expression':expr,'arguments':args,'statement_order':len(rows),'side_effects':'Only local vector reads and pure data/FP value operations; no memory load/store/FMA hoisted; flags unobserved/traps disabled.'});code=code[:a]+tmp+code[b:]
 out+=decls+[code]
new=''.join(out);sha=lambda s:hashlib.sha256(s.encode()).hexdigest();h=C/'proof/history'/('neon-before-nested-normalization-'+sha(raw)+'.c');h.write_text(raw);p.write_text(new);s={'scope':'Explicit implementation compatibility refactor to avoid taking address of C struct rvalue in readonly borrow frontend; repaired implementation, not an asserted whole-C equivalence proof for original.','semantic_counterexample':False,'diagnostic':'proof/nested-borrow-tool-gap.json','old_source_sha256':sha(raw),'new_source_sha256':sha(new),'new_temporaries':len(rows),'calls':rows,'original_intrinsic_call_counts':{n:len(re.findall(r'\b'+n+r'\s*\(',raw))for n in ret},'new_intrinsic_call_counts':{n:len(re.findall(r'\b'+n+r'\s*\(',new))for n in ret}}
assert s['original_intrinsic_call_counts']==s['new_intrinsic_call_counts'];(C/'proof/neon-nested-normalization.json').write_text(json.dumps(s,indent=2)+'\n');print(len(rows))
