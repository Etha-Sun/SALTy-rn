"""Abstract actual-VC signatures are parameters, never new global assumptions.
Adapted from RVV401 audit_local_axiom_boundary.py; checks complete type paths.
"""
import re
from context import require

def allowed_types(units,strategies):
 result={}
 for u in units:
  for f in u['fields']:
   name='proof_of_'+f;target='HwcConv.'+u['stem']+'_goal.'+f
   require(name not in result,'Duplicate actual VC member');result[name]=target
 for s in strategies:
  goal=s['stem'];require(goal.endswith('_strategy_goal'),'Actual strategy goal module required')
  for f in s['field_names']:
   require(f.endswith('_correctness'),'Actual strategy correctness member required');result[f]='HwcConv.'+goal+'.'+f.removesuffix('_correctness')
 return result

def audit(text,module,allowed,generated=False):
 # Caller supplies nested-comment-clean source, preserving offsets.
 # Axioms is also a real AUXLib library name; imports are not declarations.
 imports_text=text
 text=re.sub(r'(?:From\s+[\w.]+\s+)?Require\s+(?:(?:Import|Export)\s+)?[\w.\s]+?\.(?=\s|$)',lambda m:''.join('\n'if c=='\n'else' 'for c in m[0]),text)
 require(not re.search(r'\b(?:Admitted|admit|Abort|Axioms|Parameters|Hypothesis|Hypotheses|Conjecture|Variable|Variables|Context)\b|\bDeclare\s+Module\b',text),'Unproved/global project declaration '+module)
 scopes=[(m.start(),m.end(),m[1])for m in re.finditer(r'\bModule\s+Type\s+(\w+)\s*\.(.*?)\bEnd\s+\1\s*\.',text,re.S)]
 rows=[]
 for m in re.finditer(r'\b(Axiom|Parameter|Parameters|Hypothesis|Hypotheses|Conjecture|Variable|Variables|Context)\s+([A-Za-z_][\w\']*)',text):
  kind,name=m.groups();inside=[n for a,b,n in scopes if a<=m.start()<b]
  require(kind in{'Axiom','Parameter'}and name in allowed and len(inside)==1,'Global/unknown abstract declaration '+module+': '+m[0])
  tail=text[m.end():];typ=re.match(r'\s*:\s*([\w.]+)\.(?=\s|$)',tail)
  require(typ is not None,'Only exact actual VC proposition parameters allowed '+module+': '+name)
  expected=allowed[name];actual=typ[1]
  if actual!=expected:
   local=expected.rsplit('.',1)[1];goal=expected.rsplit('.',1)[0]
   permitted_local=actual==local and ((generated and goal=='HwcConv.'+module)or re.search(r'\b(?:From\s+HwcConv\s+Require\s+(?:Import|Export)\s+[^.]*\b'+re.escape(goal.split('.')[-1])+r'\b|Require\s+Import\s+HwcConv\.'+re.escape(goal.split('.')[-1])+r'\s*\.)',imports_text))
   require(bool(permitted_local),'Abstract signature type mismatch '+module+': '+name+' : '+actual)
   if not generated:require(not re.search(r'\b(?:Definition|Lemma|Theorem|Fact|Proposition|Corollary)\s+'+re.escape(local)+r'\b',text),'Unqualified actual type shadow '+module)
  rows.append(dict(module=module,kind=kind,name=name,module_type=inside[0],actual_type=actual,canonical_type=expected,abstract_signature_only=True))
 return rows
