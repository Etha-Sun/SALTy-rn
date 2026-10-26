"""Source-offset-bound ordinary Coq Print audit; exact existing13 names only."""
from pathlib import Path
import re,hashlib
CANONICAL={'CNotation.LE_arrow_field_congr','CNotation.RE_addr_of_congr','CNotation.eval_addr_expr','CNotation.eval_addr_expr_congr','CNotation.sizeof_alias_type','CNotation.sizeof_enum_type','CNotation.sizeof_struct_type','CNotation.sizeof_union_type','ClassicalDedekindReals.sig_forall_dec','ClassicalDedekindReals.sig_not_dec','Classical_Prop.classic','FunctionalExtensionality.functional_extensionality_dep','SeparationLogic.Snaive_C_Rules64.eval_addr'}
SHORT={n.rsplit('.',1)[-1]:n for n in CANONICAL}
def audit(source,log):
 source,log=Path(source),Path(log);b=source.read_bytes();text=b.decode();out=log.read_text();tim=list(re.finditer(r'^Chars (\d+) - (\d+) \[.*$',out,re.M));rows=[]
 for i,m in enumerate(tim):
  a,z=map(int,m.groups());
  if not 0<=a<z<=len(b):raise ValueError('Invalid source-offset bounds')
  try:statement=b[a:z].decode()
  except UnicodeDecodeError:statement=''
  units='UTF8-byte'
  if not statement.startswith('Print Assumptions '):
   statement=text[a:z];units='Unicode-codepoint'
  if not statement.startswith('Print Assumptions '):continue
  target=re.fullmatch(r'Print Assumptions ([\w.]+)\.',statement)
  if not target:raise ValueError('Unsupported Print command '+statement)
  chunk=out[tim[i-1].end()if i else 0:m.start()];raw=set(re.findall(r'^([A-Za-z_]\w*(?:\.\w+)*)\s*:',chunk,re.M))-{'Axioms'};names=set()
  for n in raw:
   if n in CANONICAL:names.add(n)
   elif '.'not in n and n in SHORT:names.add(SHORT[n])
   elif n in {'Snaive_C_Rules64.eval_addr','SimpleC.SL.SeparationLogic.Snaive_C_Rules64.eval_addr'}:names.add('SeparationLogic.Snaive_C_Rules64.eval_addr')
   else:raise ValueError('Unreviewed assumption '+n)
  if ('Closed under the global context'in chunk)!= (not names):raise ValueError('Missing/ambiguous Print result')
  rows.append(dict(constant=target[1],statement=statement,source_start=a,source_end=z,offset_units=units,inherited_assumptions=sorted(names)))
 expected=re.findall(r'\bPrint\s+Assumptions\s+([\w.]+)\s*\.',re.sub(r'\(\*.*?\*\)','',text,flags=re.S))
 if [r['constant']for r in rows]!=expected:raise ValueError('Incomplete/duplicate/out-of-order source Print audit '+str(source))
 for r in rows:r.update(source_sha256=hashlib.sha256(b).hexdigest(),log_sha256=hashlib.sha256(log.read_bytes()).hexdigest())
 return rows
