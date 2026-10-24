"""Exact Definition-block projection of a generated goal into bounded source files.
No formula is edited: every original Definition block occurs byte-for-byte in
exactly one chunk; the public facade adds transparent aliases and preserves the
original VC_Correct module type verbatim. This utility itself proves nothing.
"""
from pathlib import Path
import hashlib,json,re
sha=lambda b:hashlib.sha256(b).hexdigest()

def _definition_block_only(block,name):
 """Reject intervening vernacular/scopes; permit the original comments/strings."""
 token=re.compile(r'\(\*|\*\)|"(?:[^"]|"")*"',re.S);out=[];last=0;depth=0
 for m in token.finditer(block):
  t=m[0]
  if depth:
   if t=='(*':depth+=1
   elif t=='*)':depth-=1
   elif '(*'in t or '*)'in t:raise ValueError('Unsupported comment/string nesting')
   if not depth:out.append(' '* (m.end()-last));last=m.end()
  elif t=='(*':out.append(block[last:m.start()]);last=m.start();depth=1
  elif t=='*)':raise ValueError('Unmatched comment close')
  else:out.append(block[last:m.start()]);out.append(' '*len(t));last=m.end()
 assert not depth,'Unterminated generated comment'
 out.append(block[last:]);clean=''.join(out);assert '"'not in clean,'Unterminated generated string'
 assert re.match(r'\s*Definition\s+'+re.escape(name)+r'\s*:=',clean)
 dots=list(re.finditer(r'\.(?=\s|$)',clean));assert len(dots)==1 and not clean[dots[0].end():].strip(),'Intervening vernacular in Definition block'
 assert not re.search(r'(?m)^\s*(?:Local|Global|Open|Close|Notation|Infix|Set|Unset|Arguments|Require|Import|Export|Section|Module|End|Context|Variable|Variables|Parameter|Parameters|Axiom|Lemma|Theorem|Corollary|Proposition|Fact|Remark|Ltac|Goal|Proof|Qed|Defined|Admitted|Abort|Hint|Declare|Include|Canonical|Existing|Instance|Class|Record|Inductive|CoInductive|Fixpoint|CoFixpoint)\b',clean),'Unexpected scope/vernacular command in Definition block'

def project(raw,output,namespace,stem,chunks=16):
 raw=Path(raw);output=Path(output);output.mkdir(parents=True,exist_ok=True);data=raw.read_bytes();text=data.decode();marks=list(re.finditer(r'^Definition (\w+)\s*:=',text,re.M));mods=list(re.finditer(r'^Module Type VC_Correct\.',text,re.M));assert marks and len(mods)==1
 stop=mods[0].start();assert all(m.start()<stop for m in marks);assert len(marks)==len({m[1]for m in marks}),'Duplicate original Definition';header=text[:marks[0].start()];interface=text[stop:];assert re.fullmatch(r'Module Type VC_Correct\..*End VC_Correct\.\s*',interface,re.S)
 blocks=[]
 for i,m in enumerate(marks):
  end=marks[i+1].start()if i+1<len(marks)else stop;body=text[m.start():end];assert len(re.findall(r'^Definition ',body,re.M))==1;_definition_block_only(body,m[1]);blocks.append((m[1],body,m.start(),end))
 assert header+''.join(x[1]for x in blocks)+interface==text
 groups={};assigned={};parts=[[]for _ in range(chunks)]
 for name,body,start,end in blocks:
  group=re.sub(r'_(?:pure|aux)$','',name)
  if group not in groups:groups[group]=len(groups)%chunks
  idx=groups[group];assigned[name]=idx;parts[idx].append((name,body,start,end))
 dependencies={i:set()for i in range(chunks)};name_set=set(assigned)
 for name,body,start,end in blocks:
  refs=(set(re.findall(r'\b[A-Za-z_]\w*\b',body))&name_set)-{name}
  for ref in refs:
   if assigned[ref]!=assigned[name]:dependencies[assigned[name]].add(assigned[ref])
 pending=set(range(chunks));done=set()
 while pending:
  ready={i for i in pending if dependencies[i]<=done};assert ready,'Cyclic chunk imports'
  done.update(ready);pending-=ready
 imports=[];inventory=[];definitions=[]
 for i,items in enumerate(parts):
  name=f'{stem}_goal_chunk{i:02d}';imports.append(name);dep_import=('\nFrom '+namespace+' Require Import '+' '.join(f'{stem}_goal_chunk{j:02d}'for j in sorted(dependencies[i]))+'.\n')if dependencies[i]else'';value=(header+dep_import+''.join(x[1]for x in items)).encode();p=output/(name+'.v');p.write_bytes(value);inventory.append(dict(module=namespace+'.'+name,path=str(p),sha256=sha(value),definition_names=[x[0]for x in items],dependencies=[f'{namespace}.{stem}_goal_chunk{j:02d}'for j in sorted(dependencies[i])]))
  for n,body,start,end in items:definitions.append(dict(name=n,module=namespace+'.'+name,original_start_character=start,original_end_character=end,definition_block_sha256=sha(body.encode())))
 facade=header+'\nFrom '+namespace+' Require Import '+' '.join(imports)+'.\n'
 for n,body,start,end in blocks:facade+=f'Definition {n} := {namespace}.{stem}_goal_chunk{assigned[n]:02d}.{n}.\n'
 facade+='\n'+interface;p=output/(stem+'_goal.v');p.write_text(facade)
 definitions.sort(key=lambda x:x['original_start_character'])
 prefix='qa'if namespace=='Qs8Add'else'qu';lemma=prefix+'_'+stem+'_definitions_exact';bridge=stem+'_goal_source_identity';bridge_path=output/(bridge+'.v');auxiliary=[];reports=[]
 def identity_text(rows,lemma_name):
  return f'Require Import {namespace}.{stem}_goal.\nLemma {lemma_name} :\n'+' /\\\n'.join(f' ({namespace}.{stem}_goal.{x["name"]} = {x["module"]}.{x["name"]})'for x in rows)+'.\nProof. repeat apply conj;reflexivity. Qed.\n'+f'Print Assumptions {lemma_name}.\n'
 if len(definitions)<=4096:
  bridge_text=identity_text(definitions,lemma);bridge_path.write_text(bridge_text);reports.append(dict(module=namespace+'.'+bridge,lemma=lemma))
 else:
  part_names=[];alias_rows=[]
  for i in range(16):
   mod=bridge+f'_part{i:02d}';lm=lemma+f'_part{i:02d}';part=output/(mod+'.v');part.write_text(identity_text(definitions[i::16],lm));part_names.append(mod);auxiliary.append(dict(module=namespace+'.'+mod,path=str(part),sha256=sha(part.read_bytes())));reports.append(dict(module=namespace+'.'+mod,lemma=lm));alias_rows.append(f'Definition {prefix}_{stem}_source_identity_part{i:02d} := {namespace}.{mod}.{lm}.')
  bridge_path.write_text('From '+namespace+' Require Import '+' '.join(part_names)+'.\n'+'\n'.join(alias_rows)+'\n');lemma=None
 auxiliary.append(dict(module=namespace+'.'+bridge,path=str(bridge_path),sha256=sha(bridge_path.read_bytes())))
 result=dict(kind='exact_definition_blocks_with_transparent_facade_aliases',raw_goal_artifact=str(raw),raw_goal_sha256=sha(data),facade_artifact=str(p),facade_sha256=sha(p.read_bytes()),namespace=namespace,stem=stem,definition_count=len(blocks),actual_c_fields=len(re.findall(r'^Axiom proof_of_',interface,re.M)),chunks=inventory,definitions=definitions,original_interface_sha256=sha(interface.encode()),original_header_sha256=sha(header.encode()),complete_exact_block_reassembly_checked=True,no_formula_or_module_type_edited=True)
 result['definition_blocks_have_no_intervening_vernacular']=True;result['source_identity_reports']=reports;result['auxiliary_modules']=auxiliary;result['source_identity_artifact']=str(bridge_path);result['source_identity_sha256']=sha(bridge_path.read_bytes());result['source_identity_module']=namespace+'.'+bridge;result['source_identity_lemma']=lemma;result['original_definition_order']=[x[0]for x in blocks]
 (output/(stem+'-projection.json')).write_text(json.dumps(result,indent=2)+'\n');return result

def audit(raw,output,namespace,stem,chunks=16):
 """Recompute into an isolated directory and compare every projected source byte."""
 import tempfile
 output=Path(output)
 with tempfile.TemporaryDirectory(prefix='goal-projection-audit-')as tmp:
  expected=project(raw,Path(tmp),namespace,stem,chunks)
  for item in expected['chunks']:
   n=Path(item['path']).name;assert (output/n).read_bytes()==(Path(tmp)/n).read_bytes(),n
  n=stem+'_goal.v';assert (output/n).read_bytes()==(Path(tmp)/n).read_bytes(),n
  for item in expected['auxiliary_modules']:
   n=Path(item['path']).name;assert (output/n).read_bytes()==(Path(tmp)/n).read_bytes(),n
 return expected

def identity(d):
 """Path-independent exact projection identity used across fresh runs/relocation."""
 keys=['kind','raw_goal_sha256','facade_sha256','namespace','stem','definition_count','actual_c_fields','original_interface_sha256','original_header_sha256','original_definition_order','complete_exact_block_reassembly_checked','no_formula_or_module_type_edited','source_identity_module','source_identity_sha256','source_identity_lemma']
 out={k:d[k]for k in keys};out['chunks']=[{k:x[k]for k in ['module','sha256','definition_names','dependencies']}for x in d['chunks']];out['definitions']=d['definitions'];out['source_identity_reports']=d.get('source_identity_reports',[dict(module=d['source_identity_module'],lemma=d['source_identity_lemma'])]);out['auxiliary_modules']=[{k:x[k]for k in ['module','sha256']}for x in d.get('auxiliary_modules',[dict(module=d['source_identity_module'],sha256=d['source_identity_sha256'])])];return out
