"""Live Argmax proof translation units; construction itself supplies no proof credit.
All bodies come from impl/shim/public_spec, never retained private C copies.
"""
from pathlib import Path
import gzip,hashlib,importlib.util,json,re,sys
CASE=Path(__file__).resolve().parents[1]
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
NS=NAMESPACE='ArgmaxPool'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def read(p):return json.loads(Path(p).read_text())
def require(v,m):
 if not v:raise ValueError(m)
def tokens(t):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
def module(name,path):
 sys.path.insert(0,str(CASE/'proof'))
 try:
  spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
 finally:sys.path.pop(0)
# Every declaration in the strict CPP closure is covered, including two old
# ordinary record adapters declared by rvv_update_into.h's include chain.
SPECS=[
 ('neon_unit','impl/testNEON.c',1949,['test_neon'],'FinalNeonKernel.Confirmed','neon-guarded-final-interface-status.json'),
 ('annotated','impl/testRVV.c',274,['test_rvv'],'APBlockMainChecked.CheckedMain','ap-block-main-proof-status.json'),
 ('block32','shim/rvv_block32.c',80,['ap_rvv_block32'],'APBlock32Checked.FullBlock','apblock32-full-status.json'),
 ('rvv_update_into','shim/rvv_update_into.c',13,['ap_rvv_update_into32'],'RvvUpdateIntoChecked.CheckedRvvUpdateInto','rvv-update-into-status.json'),
 ('borrowed_consumers','shim/borrowed_consumers.c',20,['ap_borrow_rvv_gt32','ap_borrow_rvv_merge32','ap_borrow_neon_select4'],'BorrowedConsumersChecked.ExactBorrowedConsumers','borrowed-consumers-status.json'),
 ('rvv_record_consumers','shim/rvv_record_consumers.c',13,['ap_record_rvv_gt32','ap_record_rvv_merge32'],'RvvRecordConsumersChecked.Exact','rvv-record-consumers-status.json'),
 ('read_previous','shim/read_previous.c',4,['ap_read_previous_float','ap_read_previous_uint'],'ReadPreviousChecked.CheckedReadPrevious','read-previous-proof-status.json'),
 ('read_table','shim/read_table.c',2,['ap_read_table'],'ReadTableChecked.CheckedReadTable','read-table-status.json'),
 ('control_unit','shim/kernel_control.c',1,['ap_assert'],'KernelControlChecked.ExactControl','kernel-control-status.json'),
 ('public_caller','public_spec.c',6,['argmax_public_pair'],'PublicCallerFull.CheckedPublicBody','public-caller-full-status.json')]
EXPECTED={v[0]:v[2]for v in SPECS}
EXPORTS={'neon_unit':['BorrowedKernelModel'],'annotated':['APBlock32Model','RvvUpdateIntoModel'],
 'block32':['APBlock32StageModel','RvvUpdateIntoModel'],'rvv_update_into':['RvvUpdateIntoModel'],
 'borrowed_consumers':['BorrowedKernelModel'],'rvv_record_consumers':['RvvVectorRecords']}
def definition_source(stem):
 # These transparent exports replace rejected R/Int + arch32BE emitter layouts.
 return 'From '+NS+' Require Export '+' '.join(EXPORTS[stem])+'.\n'if stem in EXPORTS else None
def construction(stem):
 require(stem in EXPECTED,'Unknown actual unit '+stem);r=next(v for v in SPECS if v[0]==stem);source=r[1]
 generator={'neon_unit':'proof/generate_guarded_borrowed_kernels.py','annotated':'proof/render_block_sources.py','block32':'proof/render_block_sources.py'}.get(stem)
 inputs=[source,'spec.c']+([generator]if generator else[])
 if stem=='neon_unit':inputs+=['proof/generate_borrowed_kernels.py','proof/generate_neon_kernel.py','proof/generate_kernels.py']
 if stem in {'annotated','block32'}:inputs+=['proof/annotation-plans/'+('rvv'if stem=='annotated'else'block32')+'.json']
 if stem=='public_caller':inputs+=['shim/public_model.h']
 if stem=='read_previous':inputs+=['shim/formal_model.h']
 return dict(stem=stem,source=source,generator_source=generator,kind='live_runtime_with_comment_annotations'if generator else'actual_ordinary_C_body',direct_source_sha256={n:sha(CASE/n)for n in inputs})
def render_unit(stem,destination,expected_recipe=None):
 dest=Path(destination);require(dest.resolve().is_relative_to((CASE/'.build').resolve()),'Private destination required');dest.parent.mkdir(parents=True,exist_ok=True);recipe=construction(stem);require(expected_recipe is None or expected_recipe==recipe,'Live source/recipe drift')
 identity=None
 if stem=='neon_unit':
  g=module('argmax_live_guarded',CASE/recipe['generator_source']);raw,body,guards=g.render('neon');require(guards==list(range(1,9)),'Conditional guard coverage');prefix=g.B.prefix('neon');text=prefix+body;identity=prefix+raw
  require(raw==(CASE/recipe['source']).read_text(),'NEON renderer is not live impl')
 elif stem in {'annotated','block32'}:
  g=module('argmax_live_block_renderer',CASE/recipe['generator_source']);identity,text=g.render('rvv'if stem=='annotated'else'block32')
 elif stem=='read_previous':
  text='#include "'+str(CASE/'shim/formal_model.h')+'"\n#include "'+str(CASE/recipe['source'])+'"\n'
 else:text='#include "'+str(CASE/recipe['source'])+'"\n'
 if identity is not None:require(tokens(text)==tokens(identity),'Runtime tokens changed by annotations')
 dest.write_text(text);raw=dest.with_name(stem+'.raw.c')if identity is not None else None
 if raw:raw.write_text(identity)
 return dict(stem=stem,label=stem,text=text,cpp_flags=[],construction=recipe,identity_source=recipe['source']if identity is not None else None,private_source_path=str(dest),private_identity_path=str(raw)if raw else None)
def retained_goal(stem):
 """Locate generation artifacts only for archival preparation, never replay C."""
 inv=CASE/'proof/component-unit-inventory.json'
 if inv.exists():
  rows=[r for r in read(inv)['units']if r['stem']==stem]
  if len(rows)==1:
   row=rows[0];p=CASE/row['goal_archive']
   require(sha(p)==row['goal_archive_sha256'],'Retained archive changed')
   data=gzip.decompress(p.read_bytes());require(hashlib.sha256(data).hexdigest()==row['goal_sha256'],'Retained goal changed');return data
 if stem=='neon_unit':
  row=read(CASE/'proof/neon-guarded-actual-goal-archive.json');p=CASE/row['gzip_path'];require(sha(p)==row['gzip_sha256'],'Goal gzip drift');data=gzip.decompress(p.read_bytes());require(hashlib.sha256(data).hexdigest()==row['raw_sha256']and len(data)==row['raw_bytes'],'Goal gzip round-trip differs');return data
 if stem=='annotated':return Path(read(CASE/'.build/root-block-main-generation.json')['goal_path']).read_bytes()
 if stem=='block32':return Path(read(CASE/'.build/root-block32-generation.json')['goal_path']).read_bytes()
 if stem=='rvv_update_into':return Path(read(CASE/'.build/root-update-into-generation.json')['goal_path']).read_bytes()
 if stem=='public_caller':
  p=CASE/'proof/public-caller-full-status.json'
  if p.exists():return Path(read(p)['goal_path']).read_bytes()
  return (CASE/'.build/public-caller-generation-tseiwqwy/public_caller_goal.v').read_bytes()
 p=CASE/'proof/coq'/(stem+'_goal.v')
 if p.exists():return p.read_bytes()
 require(stem=='read_table','No retained goal '+stem)
 return(CASE/'.build/read-table-fresh-q0cne1d0/coq/read_table_goal.v').read_bytes()
def goal_source(row,strategy=False):
 require(not strategy,'No custom strategies in this case');p=CASE/row['goal_archive'];require(sha(p)==row['goal_archive_sha256'],'Archived target changed');data=gzip.decompress(p.read_bytes());require(hashlib.sha256(data).hexdigest()==row['goal_sha256'],'Archived raw target changed')
 cache=CASE/'.build/full-goal-cache';cache.mkdir(parents=True,exist_ok=True);q=cache/(row['stem']+'-'+row['goal_sha256']+'.v')
 if not q.exists():q.write_bytes(data)
 require(sha(q)==row['goal_sha256'],'Private goal cache changed');return q
def inventory_units(require_complete=True):
 inv=read(CASE/'proof/component-unit-inventory.json');rows=inv['units'];require(len(rows)==10 and {u['stem']for u in rows}==set(EXPECTED),'Exact ten actual units required');require(inv['unique_ordinary_bodies']==14,'Expected14 actual ordinary bodies');result=[]
 for original in rows:
  r=dict(original);stem=r['stem'];require(r['namespace']==NS and r['source']==construction(stem)['source'],'Wrong unit source/namespace');require(sha(CASE/r['source'])==r['source_sha256'],'Live C source changed '+stem)
  if require_complete:
   require(not r['component_pending'],'Component pending '+stem);cp=CASE/r['component_status'];require(sha(cp)==r['component_status_sha256']and read(cp)['passed']is True,'Missing/changed component '+stem)
   text=goal_source(r).read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text[text.index('Module Type VC_Correct.'):],re.M);require(fields==r['fields']and len(fields)==EXPECTED[stem],'Actual fields changed '+stem)
  r['provider_root']=r['typed_instance'][len(NS)+1:].rsplit('.',1)[0];r['construction']=construction(stem);result.append(r)
 require(sum(len(r['fields'])for r in rows)==2362,'Actual target total differs');return result
def strategy_units():return []

def mathematical_support_reports(coq_directory,math_modules,strategies=()):
 """Enumerate actual public non-VC Lemma/Theorem declarations, including sections.
 Module aliases create no lexical scope; Section names never enter FQ constants.
 Unknown scope syntax fails closed rather than omitting mathematical results.
 """
 require(not strategies,'No strategy units in this case');reports=[]
 for name in sorted(math_modules):
  text=(Path(coq_directory)/(name+'.v')).read_text();clean=[];depth=0;i=0
  while i<len(text):
   if text.startswith('(*',i):depth+=1;clean.extend('  ');i+=2
   elif depth and text.startswith('*)',i):depth-=1;clean.extend('  ');i+=2
   else:clean.append(text[i]if not depth or text[i]=='\n'else' ');i+=1
  require(depth==0,'Unclosed Coq comment '+name);stack=[]
  for line in ''.join(clean).splitlines():
   opened=re.match(r"^\s*(Module|Section)\s+(?:(?:Import|Export)\s+)?([\w']+)\b",line)
   ended=re.match(r"^\s*End\s+([\w']+)\s*\.",line)
   if opened and ':='not in line:
    require('Module Type'not in line,'Unexpected module type '+name);stack.append((opened[1],opened[2]))
   elif ended:
    require(stack and stack[-1][1]==ended[1],'Unmatched scope '+name+': '+line);stack.pop()
   field=re.match(r"^\s*(?:Lemma|Theorem|Corollary|Proposition|Fact)\s+([\w']+)\b",line)
   if field and not field[1].startswith(('proof_of_','typed_')):
    prefix=NS+'.'+name+''.join('.'+n for k,n in stack if k=='Module')
    reports.append('Print Assumptions '+prefix+'.'+field[1]+'.')
  require(not stack,'Unclosed Coq scope '+name)
 require(len(reports)==len(set(reports)),'Duplicate mathematical declaration');return reports
