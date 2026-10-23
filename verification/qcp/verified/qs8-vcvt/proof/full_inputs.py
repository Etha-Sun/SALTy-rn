"""Authoritative live C translation units and their exact typed interfaces.
Only generic parsing/scheduling code is reused; this case imports no BASE proof.
"""
from pathlib import Path
import hashlib,json,re
CASE=Path(__file__).resolve().parent.parent
NS='Qs8I8Cvt'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def units():
 result=[]
 def add(stem,source,module,count):result.append(dict(stem=stem,source=source,typed_instance=NS+'.'+module,expected_fields=count))
 for stem,module,count in [('scalar','ScalarChecked.CheckedScalar',76),('neon_load','NeonLoadChecked.CheckedNeonLoad',105),('neon_store','NeonStoreChecked.CheckedNeonStore',29),('signed_tail','SignedTailChecked.CheckedSignedTail',41),('neon_ext','NeonExtChecked.CheckedNeonExt',10)]:add(stem,'shim/'+stem+'.c',module,count)
 for u in json.loads((CASE/'proof/neon-arithmetic-units.json').read_text()):
  count=2 if u['stem']=='neon_vdupq_n_s16'else 18;add(u['stem'],u['source'],u['stem']+'_checked.Checked',count)
 add('rvv_active','shim/rvv_active.c','RvvActiveChecked.CheckedActive',38)
 for u in json.loads((CASE/'proof/rvv-arithmetic-units.json').read_text()):add(u['stem'],u['source'],u['stem']+'_checked.Checked',98)
 for stem,module,count in [('rvv_load','RvvLoadChecked.CheckedRvvLoad',98),('rvv_store','RvvStoreChecked.CheckedRvvStore',73),('neon_composed','NeonComposedChecked.CheckedNeonComposed',13)]:add(stem,'shim/'+stem+'.c',module,count)
 for isa,count in [('neon',329),('rvv',59)]:add(isa+'_unit','impl/test'+('NEON'if isa=='neon'else'RVV')+'.c',isa.capitalize()+'KernelChecked.Checked'+isa.capitalize()+'Kernel',count)
 add('wrapper','spec.c','WrapperChecked.CheckedWrapper',15)
 add('type_width','shim/type_width.c','Width64Checked.CheckedWidth',8)
 assert len(result)==26 and sum(u['expected_fields']for u in result)==1672
 return result
def kernel_text(isa,annotated=True):
 raw=(CASE/'impl'/('testNEON.c'if isa=='neon'else'testRVV.c')).read_text();s=raw
 if annotated:
  spec=(CASE/'spec.c').read_text();start=spec.index('void test_'+isa+'(');contract=re.search(r'/\*@.*?\*/',spec[start:],re.S).group();ann=json.loads((CASE/('proof/c/'+isa+'.annotations.json')).read_text());s=s.replace('\n{','\n'+contract+'\n{',1);loop='  for (;'if isa=='neon'else'  while (batch > 0)';assert s.count(loop)==1;s=s.replace(loop,ann['invariant']+'\n'+loop,1);assert s.count('  assert(batch != 0);')==1;s=s.replace('  assert(batch != 0);',ann['entry_cut']+'\n  assert(batch != 0);',1)
  if isa=='neon':
   anchor='    const int8x8_t vx = vld1_s8(input);\n';assert s.count(anchor)==1;s=s.replace(anchor,ann['tail_cases']+'\n'+anchor,1)
  for call,bind in ann['where'].items():assert call in s;s=s.replace(call,call+' /*@ where '+bind+' */')
  assert tokens(s)==tokens(raw)
 return '#include "'+str(CASE/'shim'/(isa+'_frontend.h'))+'"\n'+s
def render_unit(u):
 stem=u['stem'];flags=[];identity=None
 if stem in ['neon_unit','rvv_unit']:
  isa=stem.split('_')[0];text=kernel_text(isa);identity='#include "'+str(CASE/'shim'/(isa+'_frontend.h'))+'"\n#include "'+str(CASE/u['source'])+'"\n'
 elif stem=='wrapper':
  raw=(CASE/'spec.c').read_text();ann=json.loads((CASE/'proof/c/wrapper.annotations.json').read_text());items=ann['compare_outputs'];assert len(items)==1;anchor=items[0]['before'];assert raw.count(anchor)==1;annotated=raw.replace(anchor,items[0]['text']+'\n  '+anchor,1);assert tokens(raw)==tokens(annotated);text='#include "'+str(CASE/'shim/control.c')+'"\n'+re.sub(r'#include "(shim/[^\"]+)"',lambda m:'#include "'+str(CASE/m[1])+'"',annotated);flags=['-DQCP_FORMAL'];identity='#include "'+str(CASE/'shim/control.c')+'"\n#include "'+str(CASE/'spec.c')+'"\n'
 else:text='#include "'+str(CASE/u['source'])+'"\n'
 return dict(label=stem,stem=stem,text=text,cpp_flags=flags,identity_text=identity)
def iter_current_unit_texts():
 for u in units():yield render_unit(u)
