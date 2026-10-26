"""Construct all actual proof translation units directly from live case sources.

No C body is kept under proof/c. This module performs no verifier invocation and
does not modify a component certificate. Private raw and annotated inputs use
the same frontend; goal/contract/source guards are enforced by the full runner.
"""
from pathlib import Path
import hashlib,importlib.util,json,re,sys
CASE=Path(__file__).resolve().parents[1]
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
NAMESPACE=NS='ExpMinusMax'
HELPER_SOURCES={'scalar':'shim/scalar.c','public_caller':'public_spec.c'}
EXPECTED={'neon_unit':268,'rvv_unit':223,'scalar':5,'public_caller':6}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def read(p):return json.loads(Path(p).read_text())
def require(p,message):
 if not p:raise ValueError(message)
def tokens(t):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
def module(name,p):
 sys.path.insert(0,str(CASE/'proof'))
 try:
  spec=importlib.util.spec_from_file_location(name,p);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
 finally:sys.path.pop(0)
def construction(stem):
 require(stem in EXPECTED,'Unknown actual C unit '+stem)
 if stem in HELPER_SOURCES:
  source=HELPER_SOURCES[stem];generator=None;kind='actual_ordinary_C_body'
  inputs=[source]+(['spec.c','shim/public_model.h']if stem=='public_caller'else['shim/scalar.h'])
 else:
  side=stem.split('_')[0];source='impl/test'+('NEON'if side=='neon'else'RVV')+'.c'
  generator='proof/generate_'+side+'_framed.py';kind='current_kernel_comment_only_annotations'
  inputs=[source,'spec.c',generator,'proof/generate_'+side+'.py']
  inputs+=['proof/generate_neon_staged.py','shim/staged_model.h']if side=='neon'else['proof/generate_neon.py','shim/rvv_program_model.h']
 return dict(stem=stem,source=source,kind=kind,generator_source=generator,direct_source_sha256={n:sha(CASE/n)for n in inputs})
def render_unit(stem,destination,expected_recipe=None):
 destination=Path(destination);require(destination.resolve().is_relative_to((CASE/'.build').resolve()),'Private C destination required');destination.parent.mkdir(parents=True,exist_ok=True)
 recipe=construction(stem);require(expected_recipe is None or recipe==expected_recipe,'Live construction or source drift')
 identity=None;raw_source=None
 if stem in HELPER_SOURCES:text='#include "'+str(CASE/recipe['source'])+'"\n'
 else:
  side=stem.split('_')[0];g=module('exp_live_'+side,CASE/recipe['generator_source'])
  if side=='neon':
   g.S.metadata.clear();raw,body=g.render();prefix=g.prefix()
  else:raw,body,_=g.render();prefix='#include "'+str(CASE/'shim/rvv_program_model.h')+'"\n'
  require(raw==(CASE/recipe['source']).read_text(),'Kernel body is not current impl')
  text=prefix+body;identity=prefix+raw;raw_source=recipe['source'];require(tokens(text)==tokens(identity),'Annotation changed actual C tokens')
 destination.write_text(text);raw_path=destination.with_name(stem+'.raw.c')if identity is not None else None
 if raw_path is not None:raw_path.write_text(identity)
 return dict(stem=stem,label=stem,text=text,cpp_flags=[],construction=recipe,identity_source=raw_source,identity_text=identity,private_source_path=str(destination),private_identity_path=str(raw_path)if raw_path else None)
def goal_source(row,strategy=False):
 require(not strategy,'This case has no custom QCP strategies')
 p=Path(row['goal_path'])
 if p.is_file():require(sha(p)==row['goal_sha256'],'Retained actual target changed');return p
 # Candidate-to-verified rename and clean checkout do not need old .build.
 for i,x in enumerate(p.parts):
  if x==CASE.name:
   q=CASE.joinpath(*p.parts[i+1:])
   if q.is_file():require(sha(q)==row['goal_sha256'],'Relocated target changed');return q
 archive=CASE/'proof/evidence/full-run';s=read(archive/'status.json');require(s.get('passed')is True and s.get('whole_kernel_verified')is True,'No completed immutable target archive')
 p=archive/'units'/row['stem']/'goal.v';require(sha(p)==row['goal_sha256'],'Archived actual goal changed');return p
def definition_representation(row):
 stem=row['stem'];source=row['compiled_definition_source'];model=row['representation_model_source']
 require(source=='proof/coq/'+stem+'_def.v'and model=='proof/coq/VectorRecords.v','Unexpected definition representation')
 require(sha(CASE/source)==row['compiled_definition_sha256']and sha(CASE/model)==row['representation_model_source_sha256'],'Faithful definition source changed')
 require(re.sub(r'\(\*.*?\*\)','',(CASE/source).read_text(),flags=re.S).strip()=='From ExpMinusMax Require Export VectorRecords.','Manual definition must only redirect to the faithful common model')
 require('Snaive_C_Rules64' in(CASE/model).read_text(),'Faithful64LE model missing')
 raw=Path(row['emitted_definition_path'])
 if not raw.is_file():
  for i,name in enumerate(raw.parts):
   if name==CASE.name:
    relocated=CASE.joinpath(*raw.parts[i+1:])
    if relocated.is_file():raw=relocated;break
 if not raw.is_file():raw=CASE/'proof/evidence/full-run/units'/stem/(stem+'_def.emitted.v.txt')
 require(raw.is_file()and sha(raw)==row['emitted_definition_sha256'],'Missing or changed raw emitted definition provenance')
 return dict(emitted_name=stem+'_def.v',emitted_sha256=row['emitted_definition_sha256'],
             compiled_definition_source=source,compiled_definition_sha256=row['compiled_definition_sha256'],
             representation_model_source=model,representation_model_source_sha256=row['representation_model_source_sha256'],
             policy='Raw automatic R/Int/Arch32BE definitions are rejected and never compiled; actual Float/UInt goal cells use the explicit fp32/Float Snaive64LE common model; source-reviewed representation, physical ABI unproved')
def inventory_units(require_complete=True):
 inv=read(CASE/'proof/component-unit-inventory.json');rows=inv['units'];require(len(rows)==4 and{r['stem']for r in rows}==set(EXPECTED),'Exact four actual C units required');require(inv['unique_ordinary_bodies']==6,'Expected six actual ordinary C functions')
 result=[]
 for raw in rows:
  r=dict(raw);r['provider_root']=r['provider_root'].removeprefix(NS+'.');require(r['namespace']==NS,'Wrong logical namespace');require(r['actual_source']==construction(r['stem'])['source'],'Wrong actual C source');require(sha(CASE/r['actual_source'])==r['source_sha256'],'Actual C source changed')
  if require_complete:
   require(not r.get('component_pending',False),'Component pending '+r['stem']);p=CASE/r['component_status'];require(sha(p)==r['component_status_sha256']and read(p)['passed']is True,'Missing or changed complete component')
   fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal_source(r).read_text(),re.M);require(fs==r['fields']and len(fs)==EXPECTED[r['stem']],'Actual field inventory differs');require(r['typed_instance'].startswith(NS+'.'+r['provider_root']+'.'),'Typed provider mismatch')
  r['definition_representation']=definition_representation(r);r['historical_CPP']=r.get('cpp_path');r['historical_CPP_sha256']=r.get('cpp_sha256');result.append(dict(r,construction=construction(r['stem'])))
 require(sum(len(r['fields'])for r in rows)==sum(EXPECTED.values()),'Actual C field count differs')
 return result
def strategy_units():
 require(read(CASE/'proof/component-unit-inventory.json')['strategies']==[],'Unexpected strategy inventory');return []

def approved_coq_flags(handoff,run):
 document=handoff['coq_config_text'];require(hashlib.sha256(document.encode()).hexdigest()==handoff['coq_config_sha256'],'Approved config document/hash mismatch')
 profile=json.loads(document);require(profile['flags'][:2]==['qcp-env','coqc']and profile['flags'][2:]==handoff['coq_flags'],'Approved ordinary flags differ')
 flags=list(handoff['coq_flags']);require(flags and flags[0]=='-q'and not any(w.startswith(('-vos','-vok','-quick','-vio'))for w in flags),'Ordinary quiet full compilation required')
 mappings=[];position=1
 while position<len(flags):
  require(flags[position]in{'-Q','-R'}and position+2<len(flags),'Unexpected approved Coq option')
  require(Path(flags[position+1]).is_absolute()and re.fullmatch(r'[\w.]+',flags[position+2]),'Invalid approved library mapping')
  mappings.append(flags[position+2]);position+=3
 expected_libraries={'Flocq','SimpleC.SL','Logic','SetsClass','compcert.lib','AUXLib','SimpleC.EE','SimpleC.StdLib','SimpleC.StrategyLib','SimpleC.Common','CDCLLib','FP','MonadLib','ListLib','MaxMinLib','GraphLib','SumLib','TraceLib','RecordUpdate','Algorithms'}
 require(set(mappings)==expected_libraries and len(mappings)==len(set(mappings))and NS not in mappings and handoff['support_modules']==[],
         'Duplicate/project/external support profile mapping')
 return flags+['-Q',str(Path(run)/'coq'/NS),NS]
