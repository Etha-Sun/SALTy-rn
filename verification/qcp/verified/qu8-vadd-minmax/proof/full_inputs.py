"""Live actual C unit constructors. Metadata readiness never replaces a fresh proof."""
from pathlib import Path
import hashlib,json,re,importlib.util
CASE=Path(__file__).resolve().parent.parent
NS="Qu8Add"
UNSIGNED=True
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def status(name):
 p=CASE/'proof'/(name+'.json');d=json.loads(p.read_text());assert d.get('passed')and d.get('vc_correct_passed'),name;return d
def units(require_checked=True):
 out=[]
 def add(stem,source,module,record=None,status_name=None):
  u=dict(label=stem,stem=stem,source=source,typed_instance=module if module.startswith(NS+'.')else NS+'.'+module,status_name=status_name)
  if record is not None:
   u.update(fields=record['fields'],expected_fields=len(record['fields']),goal_sha256=record['goal_sha256'],component_cpp_sha256=record['cpp_sha256'])
   if record.get('goal_projection_identity'):u['goal_projection_identity']=record['goal_projection_identity']
  out.append(u)
 for stem,status_name in [('scalar','scalar-status'),('neon_arithmetic','neon-arithmetic-status'),('neon_load','load-status'),('neon_store','store-status'),('neon_ext','ext-status'),('rvv_active','rvv-active-status'),('setvl','setvl-status')]+([('unsigned_scalar','unsigned-scalar-status')]if UNSIGNED else[]):
  d=status(status_name)if require_checked else None
  defaults={'scalar':'ScalarChecked.CheckedScalar','neon_arithmetic':'NeonArithmeticChecked.CheckedNeonArithmetic','neon_load':'NeonLoadChecked.CheckedNeonLoad','neon_store':'NeonStoreChecked.CheckedNeonStore','neon_ext':'NeonExtChecked.CheckedNeonExt','rvv_active':'RvvActiveChecked.CheckedRvvActive','setvl':'SetvlChecked.CheckedSetvl','unsigned_scalar':'UnsignedScalarChecked.CheckedUnsignedScalar'}
  add(stem,'shim/'+stem+'.c',d['checked_module']if d else defaults[stem],d,status_name)
 d=status('neon-composed-status')if require_checked else None
 for stem,mod in [('unsigned_tail'if UNSIGNED else'signed_tail',('UnsignedTailChecked.CheckedUnsignedTail'if UNSIGNED else'SignedTailChecked.CheckedSignedTail')),('neon_composed','NeonComposedChecked.CheckedNeonComposed')]:
  row=next(u for u in d['units']if u['stem']==stem)if d else None;add(stem,'shim/'+stem+'.c',row['checked_module']if row else mod,row,'neon-composed-status')
 d=status('rvv-memory-status')if require_checked else None
 for stem,k in [('rvv_load','Load'),('rvv_store','Store')]:
  row=next(u for u in d['actual_c_units']if u['stem']==stem)if d else None;add(stem,'shim/'+stem+'.c',row['checked_module']if row else'Rvv'+k+'Checked.CheckedRvv'+k,row,'rvv-memory-status')
 d=status('rvv-vectors-status')if require_checked else None
 for i,row in enumerate(json.loads((CASE/'proof/rvv-arithmetic-units.json').read_text())):
  r=next(u for u in d['actual_c_units']if u['stem']==row['stem'])if d else None
  # The canonical full runner uses16 round-robin leaves and exact typed aliases.
  add(row['stem'],row['source'],'RvvVectorsChecked.CheckedVector'+str(i),r,'rvv-vectors-status')
 for isa,token in [('neon','NEON'),('rvv','RVV')]:
  d=status(isa+'-proof-status')if require_checked else None
  add(isa+'_unit','impl/test'+token+'.c',d['checked_module']if d else isa.capitalize()+'KernelChecked.Checked'+isa.capitalize()+'Kernel',d,isa+'-proof-status')
 d=json.loads((CASE/'proof/type-width-status.json').read_text())if require_checked else None
 if d is not None:
  assert d['passed'] and d['actual_width_c_vcs']==8;d={**d,'cpp_sha256':sha(Path(d['run_directory'])/'width64.c')}
 add('width64','shim/type_width.c','Width64Checked.CheckedWidth',d,'type-width-status')
 d=status('wrapper-proof-status')if require_checked else None
 add('wrapper','spec.c',d['checked_module']if d else'WrapperChecked.CheckedWrapper',d,'wrapper-proof-status')
 assert len({u['stem']for u in out})==len(out)
 return out
def render_unit(u):
 stem=u['stem'];flags=[];identity=None
 if stem in ['neon_unit','rvv_unit']:
  isa=stem.split('_')[0];spec=importlib.util.spec_from_file_location(NS+'_generate_'+isa,CASE/'proof'/('generate_'+isa+'.py'));m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);raw,ann,_=m.construct();prefix='#include "'+str(CASE/'shim'/(isa+'_frontend.h'))+'"\n';text=prefix+ann;identity=prefix+raw;assert tokens(raw)==tokens(ann)
 elif stem=='wrapper':
  raw=(CASE/'spec.c').read_text();ann=json.loads((CASE/'proof/c/wrapper.annotations.json').read_text());items=ann['compare_outputs'];assert len(items)==1;anchor=items[0]['before'];assert raw.count(anchor)==1;new=raw.replace(anchor,items[0]['text']+'\n  '+anchor,1);assert tokens(raw)==tokens(new);prefix='#include "'+str(CASE/'shim/control.c')+'"\n';text=prefix+re.sub(r'#include "(shim/[^\"]+)"',lambda m:'#include "'+str(CASE/m[1])+'"',new);flags=['-DQCP_FORMAL'];identity=prefix+'#include "'+str(CASE/'spec.c')+'"\n'
 else:text='#include "'+str(CASE/u['source'])+'"\n'
 return dict(label=stem,stem=stem,text=text,cpp_flags=flags,identity_text=identity)
def iter_current_unit_texts(require_checked=True):
 for u in units(require_checked):yield render_unit(u)
def strategy_units():
 byte='u8'if UNSIGNED else's8';upper='U8'if UNSIGNED else'S8';tail='unsigned_tail'if UNSIGNED else'signed_tail';tail_upper='UnsignedTail'if UNSIGNED else'SignedTail'
 return [dict(stem=byte+'_arrays',source='proof/c/'+byte+'_arrays.strategies',module_type=byte+'_arrays_Strategy_Correct',typed_instance=NS+'.'+upper+'ArraysStrategy.Checked'+upper+'Arrays',expected_fields=2),dict(stem=tail,source='shim/'+tail+'.strategies',module_type=tail+'_Strategy_Correct',typed_instance=NS+'.'+tail+'_strategy_proof.Checked'+tail_upper+'Strategy',expected_fields=2),dict(stem=byte+'_neon_memory',source='proof/c/'+byte+'_neon_memory.strategies',module_type=byte+'_neon_memory_Strategy_Correct',typed_instance=NS+'.NeonMemoryStrategy.CheckedNeonMemoryStrategy',expected_fields=5),dict(stem='rvv_store',source='proof/c/rvv_store.strategies',module_type='rvv_store_Strategy_Correct',typed_instance=NS+'.rvv_store_strategy_proof.CheckedRvvStoreStrategy',expected_fields=5),dict(stem='rvv_kernel',source='proof/c/rvv_kernel.strategies',module_type='rvv_kernel_Strategy_Correct',typed_instance=NS+'.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy',expected_fields=1)]
