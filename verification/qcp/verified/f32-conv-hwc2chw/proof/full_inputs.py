"""Fail-closed current HWC TU/goal/representation identity. No verifier is run here."""
from pathlib import Path
import re,json,hashlib,importlib.util
import context as X
NS=NAMESPACE='HwcConv'
CASE=None
EXPECTED={'support_unit':5,'assert_unit':1,'copy_float_unit':1,'nan_helpers_unit':38,'neon3_unit':60,'read_scalar_unit':2,'store_half_unit':12,'neon_pixel_unit':396,'rvv_fma3_unit':336,'pixel9_unit':44,'neon_unit':443,'rvv_unit':401,'public_mode':9}
SCALAR={'support_unit','assert_unit','copy_float_unit','read_scalar_unit'}
require=X.require;sha=X.sha;read=X.read

def configure(case):
 global CASE
 CASE=X.configure(case)
def tokens(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def _source(p):
 require(not Path(p).is_absolute(),'Case-relative source required');q=(CASE/p).resolve();require(q.is_relative_to(X.ROOT),'Input escapes repository');return q

def inventory():
 data=read(CASE/'proof/component-unit-inventory.json');rows=data['units'];require(len(rows)==13 and {r['stem']for r in rows}==set(EXPECTED),'Exact13 actual TU inventory required');require(data['unique_ordinary_bodies']==19,'Exactly19 actual ordinary body definitions required');return data

def goal_source(row):
 stem=row['stem'];p=_source(row.get('goal_source','proof/coq/'+stem+'_goal.v'))
 if not p.exists():p=CASE/'proof/evidence/full-run/units'/stem/'goal.v'
 require(p.is_file()and sha(p)==row['goal_sha256'],'Retained actual C goal identity '+stem);return p

def goal_fields(text):
 require(text.count('Module Type VC_Correct.')==1,'Unique actual VC_Correct required')
 return re.findall(r'^Axiom proof_of_(\w+)\s*:',text.split('Module Type VC_Correct.',1)[1],re.M)

def construction(stem):
 row=next(r for r in inventory()['units']if r['stem']==stem);source=row.get('source',row.get('actual_source'));require(source,'Missing current actual source')
 names=[source]
 if stem in {'neon_unit','rvv_unit'}:names+=['proof/annotation-plans/'+('neon'if stem=='neon_unit'else'rvv')+'.json']
 if stem=='support_unit':names+=['shim/types.h']
 names+=row.get('prefix_headers',[])
 return dict(stem=stem,source=source,kind='comment_only_runtime_annotation'if stem in {'neon_unit','rvv_unit','support_unit'}else'live_ordinary_body',direct_source_sha256={n:sha(_source(n))for n in names})

def render_unit(stem,destination,expected_recipe=None):
 dest=Path(destination).resolve();require(dest.is_relative_to((CASE/'.build').resolve()),'Private TU destination required');recipe=construction(stem);require(expected_recipe is None or expected_recipe==recipe,'Current source/annotation plan changed')
 spec=importlib.util.spec_from_file_location('hwc_live_renderer',Path(__file__).with_name('render_full_units.py'));m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.configure(CASE)
 row=next(r for r in inventory()['units']if r['stem']==stem);identity,text=m.render(stem,dict(row,source=recipe['source']));require(identity is None or tokens(identity)==tokens(text),'Executable tokens changed')
 dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(text);raw=dest.with_name(stem+'.raw.c')if identity is not None else None
 if raw:raw.write_text(identity)
 return dict(stem=stem,text=text,cpp_flags=['-I',str(CASE/'shim')],construction=recipe,private_source_path=str(dest),private_identity_path=str(raw)if raw else None)

def portable_cpp_flags(flags):
 require(flags==['-I',str(CASE/'shim')],'Unexpected actual renderer CPP profile')
 return ['-I','shim']
def expand_cpp_flags(flags):
 require(flags==['-I','shim'],'Only current case shim include profile approved')
 return ['-I',str(CASE/'shim')]

def definition_source(stem):
 if stem in SCALAR:return None
 if stem=='pixel9_unit':return 'From HwcConv Require Export HwcRvvPixel9Model.\n'
 extra=' HwcPublicObservationModel'if stem=='public_mode'else''
 return 'From HwcConv Require Export VectorRecords'+extra+'.\n'

def definition_representation(row):
 stem=row['stem'];text=goal_source(row).read_text();imports=re.findall(r'From HwcConv Require Import (\w+_def)\.',text)
 expected=[]if stem in SCALAR else[stem+'_def'];require(imports==expected,'Goal definition import policy '+stem)
 if stem in SCALAR:
  require(not(CASE/'proof/coq'/(stem+'_def.v')).exists(),'Synthetic scalar def is prohibited '+stem)
  return dict(kind='scalar_no_emit',raw_def_emission='forbidden',goal_def_import=None)
 source='proof/coq/'+stem+'_def.v';clean=re.sub(r'\(\*.*?\*\)','',_source(source).read_text(),flags=re.S)
 require(re.sub(r'\s+',' ',clean).strip()==re.sub(r'\s+',' ',definition_source(stem)).strip(),'Manual def must only export faithful canonical identities '+stem)
 model='proof/coq/VectorRecords.v';canonical=_source(model).read_text();require('Import Snaive_C_Rules64.'in canonical,'Missing explicit64LE model')
 info=row.get('definition_representation',{});digest=info.get('emitted_sha256',row.get('emitted_definition_sha256'))
 require(isinstance(digest,str)and re.fullmatch('[0-9a-f]{64}',digest),'Missing actual emitted def SHA '+stem)
 raw=info.get('emitted_source',row.get('emitted_definition_source'))
 if raw:
  require(sha(_source(raw))==digest,'Retained raw def changed '+stem)
 return dict(kind='record_emit_required',raw_def_emission='required',goal_def_import=NS+'.'+stem+'_def',emitted_sha256=digest,compiled_definition_source=source,compiled_definition_sha256=sha(_source(source)),representation_model_source=model,representation_model_source_sha256=sha(_source(model)),policy='Automatic R/Int/naive32BE rejected and preserved; fp32 Float/UInt Snaive64LE canonical model only; physical ABI and ISA correspondence not proved')

def check_generated_def(stem,folder,goal,representation):
 folder=Path(folder);text=Path(goal).read_text();defs={p.name for p in folder.glob('*_def.v')};expected=set()if stem in SCALAR else{stem+'_def.v'};require(defs==expected,'Actual raw def emission policy '+stem)
 imports=re.findall(r'From HwcConv Require Import (\w+_def)\.',text);require(imports==([]if stem in SCALAR else[stem+'_def']),'Fresh goal def import policy '+stem)
 if expected:
  raw=folder/(stem+'_def.v');require(sha(raw)==representation['emitted_sha256'],'Fresh emitted representation differs '+stem)
  require('Import naive_C_Rules.'in raw.read_text(),'Unexpected emitter needs review '+stem)
  archive=folder/(stem+'_def.emitted.v.txt');archive.write_bytes(raw.read_bytes())
  return {'raw_path':str(archive),'raw_sha256':sha(archive),'raw_compiled':False}
 return {'raw_path':None,'raw_sha256':None,'raw_compiled':False}

def inventory_units(require_complete=True):
 result=[]
 for raw in inventory()['units']:
  row=dict(raw);stem=row['stem'];require(row['namespace']==NS,'Wrong target namespace')
  recipe=construction(stem);require(sha(_source(recipe['source']))==row['source_sha256'],'Actual source changed '+stem)
  fields=goal_fields(goal_source(row).read_text());require(fields==row['fields']and len(fields)==EXPECTED[stem],'Actual target field inventory '+stem)
  require(row['typed_instance'].startswith(NS+'.')and re.fullmatch(r'[\w.]+',row['typed_instance']),'Fully qualified provider required')
  if require_complete:
   require(not row.get('component_pending',False),'Component still pending '+stem);p=_source(row['component_status']);require(sha(p)==row['component_status_sha256']and read(p)['passed']is True,'Missing/changed complete component '+stem)
  row.update(source=recipe['source'],construction=recipe,provider_root=row['typed_instance'][len(NS)+1:].rsplit('.',1)[0],definition_representation=definition_representation(row));result.append(row)
 require(sum(len(r['fields'])for r in result)==1748,'Actual C count differs');return result

def strategy_units():
 rows=inventory()['strategies'];require(len(rows)==1,'One shared map strategy group required');row=dict(rows[0]);require(row['stem']=='hc_maps_strategy_goal'and row['fields']==4,'Exactly4 map strategies required')
 p=_source(row['goal_source']);require(sha(p)==row['goal_sha256'],'Original map strategy goal changed');names=re.findall(r'^\s*Axiom (\w+)\s*:',p.read_text(),re.M);require(names==row['field_names']and len(names)==4,'Map strategy fields changed')
 require(row['typed_instance']=='HwcConv.hc_maps_strategy_proof.CheckedMaps','NoPE strategy provider required');require(sha(_source('proof/coq/hc_maps_strategy_proof.v'))=='290beb5192b14ddf3716161e2ff03941b095481f067846d1d115e81fada49bb1','Reviewed NoPE strategy proof source required');return[row]

def approved_coq_flags(handoff,run):
 document=handoff['coq_config_text'];require(hashlib.sha256(document.encode()).hexdigest()==handoff['coq_config_sha256'],'Approved config hash mismatch');profile=json.loads(document);require(profile['flags'][:2]==['qcp-env','coqc']and profile['flags'][2:]==handoff['coq_flags'],'Ordinary approved flags mismatch');flags=list(handoff['coq_flags'])
 require(flags and flags[0]=='-q'and not any(w.startswith(('-vos','-vok','-quick','-vio'))for w in flags),'Ordinary compilation only');pos=1;mappings=[]
 while pos<len(flags):
  require(flags[pos]in{'-Q','-R'}and pos+2<len(flags),'Unreviewed Coq option');require(Path(flags[pos+1]).is_absolute(),'Absolute framework path required');mappings.append(flags[pos+2]);pos+=3
 expected={'Flocq','SimpleC.SL','Logic','SetsClass','compcert.lib','AUXLib','SimpleC.EE','SimpleC.StdLib','SimpleC.StrategyLib','SimpleC.Common','CDCLLib','FP','MonadLib','ListLib','MaxMinLib','GraphLib','SumLib','TraceLib','RecordUpdate','Algorithms'}
 require(set(mappings)==expected and len(mappings)==len(set(mappings))and NS not in mappings and handoff['support_modules']==[],'Duplicate/project/framework mapping mismatch');return flags+['-Q',str(Path(run)/'coq'/NS),NS]
