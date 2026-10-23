"""Focused syntax screen for literal overlapping initialized/undef array records.
This catches the rejected caller recovery error. It is not a general heap
satisfiability theorem; ordinary proof and explicit memory contracts still apply.
"""
import ast,re
from pathlib import Path

def term(s,p):
 while p<len(s)and s[p].isspace():p+=1
 start=p
 if s[p]=='(':
  depth=1;p+=1
  while depth:
   depth+=(s[p]=='(')-(s[p]==')');p+=1
 else:
  while p<len(s)and not s[p].isspace()and s[p]!=')':p+=1
 return s[start:p],p

def linear(s):
 s=re.sub(r'sizeof\((?:CHAR|UCHAR)\)','1',s)
 def add(a,b,k=1):
  out=dict(a)
  for x,v in b.items():out[x]=out.get(x,0)+k*v
  return {x:v for x,v in out.items()if v}
 def visit(n):
  if isinstance(n,ast.Constant)and isinstance(n.value,int):return {'':n.value}if n.value else{}
  if isinstance(n,ast.Name):return {n.id:1}
  if isinstance(n,ast.UnaryOp)and isinstance(n.op,ast.USub):return {k:-v for k,v in visit(n.operand).items()}
  if isinstance(n,ast.BinOp):
   a,b=visit(n.left),visit(n.right)
   if isinstance(n.op,ast.Add):return add(a,b)
   if isinstance(n.op,ast.Sub):return add(a,b,-1)
   if isinstance(n.op,ast.Mult):
    if set(a)<={''}:return {k:a.get('',0)*v for k,v in b.items()if a.get('',0)*v}
    if set(b)<={''}:return {k:b.get('',0)*v for k,v in a.items()if b.get('',0)*v}
  raise ValueError('not a linear Z expression')
 try:return tuple(sorted(visit(ast.parse(s.strip(),mode='eval').body).items()))
 except (SyntaxError,ValueError):return ('literal',re.sub(r'\s+','',s))

def screen_goal(path):
 text=Path(path).read_text();fields=re.findall(r'^Axiom proof_of_(\w+_return_wit_\w+)\s*:',text,re.M);hits=[]
 for field in fields:
  m=re.search(r'^Definition '+re.escape(field)+r'\s*:=',text,re.M)
  if not m:raise ValueError('Missing return definition '+field)
  end=text.find('\nDefinition ',m.end());body=text[m.end():end if end>=0 else None].split('|--',1)[0];arrays=[]
  for p in re.finditer(r'\bCharArray\.(undef_full|full)\s+',body):
   address,q=term(body,p.end());length,_=term(body,q);arrays.append((p[1],linear(address),linear(length),address,length))
  for i,a in enumerate(arrays):
   for b in arrays[i+1:]:
    if a[1:3]==b[1:3]and a[2]and isinstance(a[2][0],tuple)and len(a[2])==1 and a[2][0][0]=='' and a[2][0][1]>0:hits.append(dict(field=field,kinds=[a[0],b[0]],address=a[3],length=a[4]))
 return dict(return_fields_screened=len(fields),literal_duplicate_array_records=hits,scope='syntactic literal-positive-array screen only; not general heap satisfiability')

def require_clean(path):
 r=screen_goal(path)
 if r['literal_duplicate_array_records']:raise ValueError('Duplicate positive output array ownership: '+repr(r['literal_duplicate_array_records']))
 return r
