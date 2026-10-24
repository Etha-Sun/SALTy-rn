"""Deterministic current actual RDSUM C translation units, never proof credit."""
from pathlib import Path
import hashlib, json, re

CASE=Path(__file__).resolve().parent.parent
NS='Qs8Rdsum'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(text):
    return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',text,flags=re.S))

def source_guard():
    scope=json.loads((CASE/'proof/frontend-scope.json').read_text())
    assert scope['passed'] and not scope['findings']
    for name,key in [('impl/testNEON.c','source_sha256'),('impl/testRVV.c','rvv_source_sha256'),
                     ('shim/neon_frontend.h','frontend_sha256'),('shim/rvv_frontend.h','rvv_frontend_sha256')]:
        assert sha(CASE/name)==scope[key], 'Frontend source/scope drift '+name
    types=(CASE/'shim/formal_model.h').read_text()
    for name in ['size_t','uint64_t','uintptr_t']:
        assert re.search(r'typedef\s+unsigned\s+long\s+long\s+'+name+r'\s*;',types)
    model=(CASE/'proof/coq/ProgramModel.v').read_text()
    assert 'base+row*stride+col' in model
    assert 'rd_present M(rd_row_address base stride r c)' in model

def units(require_checked=True):
    inventory=json.loads((CASE/'proof/component-unit-inventory.json').read_text())
    assert inventory['namespace']==NS and inventory['actual_c_units']==34 and inventory['actual_c_vcs']==1577
    assert not inventory['strategies'] and len(inventory['units'])==34
    result=[]
    for row in inventory['units']:
        assert row['namespace']==NS and sha(CASE/row['source'])==row['source_sha256']
        assert row['typed_instance'].startswith(NS+'.')
        if require_checked:
            status=json.loads((CASE/row['component_status']).read_text())
            assert status.get('passed') and status.get('vc_correct_passed'),row['component_status']
        result.append(dict(**row,label=row['stem'],expected_fields=row['actual_c_vcs'],
                           goal_artifact=row['goal_path'],strategy_application_limit=1024))
    assert len(set(u['stem'] for u in result))==34
    assert {u['source'] for u in result}=={str(p.relative_to(CASE)) for p in (CASE/'shim').glob('*.c')}|{'spec.c','impl/testNEON.c','impl/testRVV.c'}
    width=json.loads((CASE/'proof/type-width-status.json').read_text())
    assert width['passed'] and width['formal_size_t_unsigned_bits']==width['native_size_t_unsigned_bits']==64
    for name,digest in width['input_sha256'].items():
        assert sha(CASE/name)==digest,'Type-width source drift '+name
    folder=Path(width['run_directory']);goal=folder/'type_width_goal.v'
    fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
    assert len(fields)==width['actual_C_width_fields']==13 and sha(goal)==width['goal_sha256']
    result.append(dict(label='type_width',stem='type_width',namespace=NS,
        source='shim/type_width_probe.h',source_sha256=sha(CASE/'shim/type_width_probe.h'),
        typed_instance=NS+'.Width64Checked.CheckedWidth',goal_artifact=str(goal),
        fields=fields,expected_fields=len(fields),goal_sha256=sha(goal),
        cpp_sha256=sha(folder/'type_width.c'),component_status='proof/type-width-status.json',
        source_kind='Actual selected sizeof and unsigned64 C projection; not an additional kernel',
        strategy_application_limit=1024))
    return result

def render_unit(unit):
    stem=unit['stem'];identity=None
    if stem in ['neon_unit','rvv_unit']:
        side=stem.split('_')[0]
        raw=(CASE/unit['source']).read_text()
        ann=json.loads((CASE/'proof/c'/(side+'.annotations.json')).read_text())
        contracts=re.findall(r'\bvoid\s+test_'+side+r'\s*\([^)]*\)\s*(/\*@.*?\*/)',(CASE/'spec.c').read_text(),re.S)
        assert len(contracts)==1 and contracts[0]==ann['contract'],'Annotations carry a stale/nonpublic kernel contract'
        assert raw.count('\n{')==1
        text=raw.replace('\n{','\n'+contracts[0]+'\n{',1)
        for row in ann['invariants']:
            if side=='neon':
                matches=list(re.finditer(r'(?m)^'+re.escape(row['anchor'])+r'$',text))
                assert len(matches)==1,row['anchor']
                match=matches[0]
                if row.get('placement')=='do_condition':
                    text=text[:match.start()]+'    }\n'+row['text']+'\n    while (channels != 0);'+text[match.end():]
                else:
                    text=text[:match.start()]+row['text']+'\n'+text[match.start():]
            else:
                assert text.count(row['anchor'])==1,row['anchor']
                text=text.replace(row['anchor'],row['text']+'\n'+row['anchor'])
        for row in ann.get('assertions',[]):
            assert text.count(row['after'])==1,row['after']
            text=text.replace(row['after'],row['after']+'\n'+row['text'])
        for call,binding in ann['where'].items():
            assert call in text,call
            text=text.replace(call,call+' /*@ where '+binding+' */')
        counters={};edits=[]
        for row in ann.get('ordered_where',[]):
            call=row['call'];index=counters.get(call,0)
            matches=list(re.finditer(re.escape(call),text));assert index<len(matches),(call,index)
            counters[call]=index+1;edits.append((matches[index].end(),' /*@ where '+row['where']+' */'))
        for pos,extra in sorted(edits,reverse=True):
            text=text[:pos]+extra+text[pos:]
        assert tokens(raw)==tokens(text),'Annotation changed executable C tokens'
        prefix='#include "'+str(CASE/'shim'/(side+'_frontend.h'))+'"\n'
        prefix+=''.join('#include "'+str(CASE/'shim'/h)+'"\n' for h in ann.get('additional_frontend_headers',[]))
        identity=prefix+raw;text=prefix+text
    else:
        text='#include "'+str(CASE/unit['source'])+'"\n'
    return dict(label=stem,stem=stem,text=text,cpp_flags=[],identity_text=identity)

def iter_current_unit_texts(require_checked=True):
    for unit in units(require_checked):
        yield render_unit(unit)
