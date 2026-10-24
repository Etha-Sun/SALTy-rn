"""Render current actual C units without running or rewriting component checks.

This module provides source identity, not proof credit.  In particular, importing
the kernel constructor does not invoke its guarded CLI or overwrite annotations.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import re

CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
NAMESPACE = NS = 'Dwconv'
HELPER_SOURCES = {
 'control':'shim/control.c', 'read_table':'shim/read_table.c',
 'memory':'shim/memory.c', 'map_probe':'shim/map_access.c',
 'output_read':'shim/output_read.c','written_read':'shim/written_read.c',
 'observation':'shim/observation.c','public_compare':'shim/public_compare.c',
 'public_wrapper':'shim/public_wrapper.c'}



def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def require(condition, message):
    if not condition:
        raise ValueError(message)


def tokens(text):
    return re.findall(r'\w+|[^\s]', re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S))


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def construction(stem):
    if stem in HELPER_SOURCES:
        source=HELPER_SOURCES[stem]
        kind,generator='actual_ordinary_C_body',None
        inputs=[source]+(['spec.c']if stem=='public_wrapper'else[])
    elif stem in {'neon_unit','rvv_unit'}:
        side=stem.split('_')[0]
        source='impl/'+('testNEON.c'if side=='neon'else'testRVV.c')
        generator='proof/generate_'+side+'.py'
        kind='current_kernel_comment_only_annotations'
        inputs=[source,generator,'spec.c','proof/c/contracts.json','shim/program.h','shim/output_rules.h']
    else:
        raise ValueError('Unknown actual C unit '+stem)
    return dict(stem=stem,source=source,kind=kind,generator_source=generator,
                direct_source_sha256={n:sha(CASE/n)for n in inputs})


def render_unit(stem,destination,expected_recipe=None):
    destination=Path(destination)
    require(destination.resolve().is_relative_to((CASE/'.build').resolve()),'Private C destination required')
    destination.parent.mkdir(parents=True,exist_ok=True)
    recipe=construction(stem)
    require(expected_recipe is None or recipe==expected_recipe,'Construction/source drift: '+stem)
    identity,raw_source=None,None
    if stem in HELPER_SOURCES:
        text='#include "'+str(CASE/recipe['source'])+'"\n'
    else:
        side=stem.split('_')[0]
        constructor=module('dwconv_current_'+side+'_constructor',CASE/recipe['generator_source'])
        text=constructor.render(side)
        prefix=('#include "'+str(CASE/'shim/program.h')+'"\n#include "'+str(CASE/'shim/output_rules.h')+'"\n'
                if side=='neon'else'#include "'+str(CASE/'shim/rvv_program.h')+'"\n')
        require(text.startswith(prefix),'Kernel include prefix drift')
        identity=prefix+(CASE/recipe['source']).read_text()
        require(tokens(identity)==tokens(text),'Annotation changed executable C tokens: '+stem)
        raw_source=recipe['source']
    destination.write_text(text)
    raw_path=destination.with_name(stem+'.raw.c')if identity is not None else None
    if raw_path is not None:raw_path.write_text(identity)
    return dict(stem=stem,label=stem,text=text,cpp_flags=[],construction=recipe,
                identity_source=raw_source,identity_text=identity,
                private_source_path=str(destination),
                private_identity_path=str(raw_path)if raw_path is not None else None)


def goal_source(row, strategy=False):
    """Retained target identity, with a completed immutable archive fallback.

    A subsequent full run always regenerates the target; this is no object or
    historical proof reuse. Fresh clones need not possess old private outputs.
    """
    path = Path(row['goal_path'])
    if path.is_file():
        require(sha(path) == row['goal_sha256'], 'Retained target changed')
        return path
    archive = CASE / 'proof/evidence/full-run'
    status = read(archive / 'status.json')
    require(status.get('passed') is True and status.get('whole_kernel_verified') is True,
            'No completed immutable target archive available')
    path = (archive / 'strategies' / (row['stem'] + '.v') if strategy else
            archive / 'units' / row['stem'] / 'goal.v')
    require(sha(path) == row['goal_sha256'], 'Archived target identity changed')
    return path


def inventory_units(require_complete=True):
    inventory=read(CASE/'proof/component-unit-inventory.json')
    rows=inventory['units']
    expected=set(HELPER_SOURCES)|{'neon_unit','rvv_unit'}
    require(len(rows)==11 and{u['stem']for u in rows}==expected,'Expected exact11 actual C TUs')
    require(inventory['unique_ordinary_bodies']==15,'Expected exact15 ordinary actual C bodies')
    result=[]
    for raw in rows:
        row=dict(raw)
        row['provider_root']=row['provider_root'].removeprefix(NS+'.')
        require(row['namespace']==NS,'Wrong namespace')
        require(row['actual_source']==construction(row['stem'])['source'],'Actual source mapping mismatch')
        require(sha(CASE/row['actual_source'])==row['source_sha256'],'Source changed: '+row['stem'])
        if require_complete:
            require(not row.get('component_pending',False),'Actual component pending: '+row['stem'])
            p=CASE/row['component_status']
            require(sha(p)==row['component_status_sha256']and read(p)['passed']is True,'Component receipt drift/failure')
            goal=goal_source(row)
            fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
            require(fields==row['fields']and len(fields)==row['actual_C_fields'],'Actual target field mismatch')
            require(row['typed_instance'].startswith(NS+'.'+row['provider_root']+'.'),'Provider mismatch')
        row['historical_CPP']=row.get('cpp_path')
        row['historical_CPP_sha256']=row.get('cpp_sha256')
        result.append(dict(row,construction=construction(row['stem'])))
    require(sum(len(u['fields'])for u in rows)==487,'Expected exact487 actual C fields')
    return result


def strategy_units():
    inventory=read(CASE/'proof/component-unit-inventory.json')
    rows=inventory['strategies']
    require({u['stem']for u in rows}=={'dw_maps_strategy_goal','dw_output_strategy_goal'},'Unknown strategy set')
    result=[]
    for raw in rows:
        row=dict(raw);row['provider_root']=row['provider_root'].removeprefix(NS+'.')
        row['fields']=len(raw['fields'])if isinstance(raw['fields'],list)else raw['fields']
        require(sha(CASE/row['source'])==row['source_sha256'],'Strategy source drift')
        require(read(CASE/row['component_status'])['passed']is True,'Unpassed strategy')
        require(sha(goal_source(row,True))==row['goal_sha256'],'Strategy goal drift')
        result.append(row)
    require(sum(x['fields']for x in result)==9,'Expected8+1 strategy fields')
    return result
