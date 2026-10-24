"""Construct current actual C inputs only in a private build directory.

The frozen handoff records recipes and hashes, never a second function-body copy.
"""
import hashlib, importlib.util, json, os, re
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
read=lambda p:json.loads(Path(p).read_text())
def require(ok,message):
    if not ok:raise ValueError(message)
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result
def relative_includes(text, destination, origin):
    def fix(match):
        p = Path(match[1])
        p = p if p.is_absolute() else origin / p
        require(p.resolve().is_relative_to(ROOT.resolve()), 'Include escapes repository')
        return '#include "' + os.path.relpath(p.resolve(), destination.parent) + '"'
    return re.sub(r'^\s*#\s*include\s*"([^\"]+)"', fix, text, flags=re.M)


def include(path, destination):
    return '#include "' + os.path.relpath(CASE / path, destination.parent) + '"\n'


def template(stem, destination):
    raw, identity, flags = None, None, []
    if stem in {'neon_unit', 'rvv_unit'}:
        isa = stem.split('_')[0]
        generator_file='generate_kernel.py'
        generation_path=CASE/'proof'/(isa+'-generation-status.json')
        if isa=='rvv' and generation_path.exists():
            selected=read(generation_path).get('generator_source')
            if selected is not None:
                require(selected in {'proof/generate_rvv_named.py','proof/generate_rvv_identity.py','proof/generate_rvv_staged.py','proof/generate_rvv_float_staged.py'}, 'Unknown selected RVV generator')
                generator_file=Path(selected).name
        generator = module('f16_live_kernel', CASE/'proof'/generator_file)
        original, annotated, annotations = generator.kernel_text(isa)
        require(annotations == read(CASE/'proof/c'/(isa+'.annotations.json')), 'Installed kernel annotation drift')
        text = generator.kernel_header(isa)+annotated
        identity = 'impl/'+('testNEON.c' if isa=='neon' else 'testRVV.c')
        raw = destination.with_name(stem+'.raw.c')
        raw.write_text(include('shim/'+isa+'_frontend.h',raw)+include(identity,raw))
    elif stem == 'wrapper_unit':
        generator = module('f16_live_wrapper', CASE/'proof/generate_wrapper.py')
        original,text,annotations = generator.wrapper_text()
        require(annotations == read(CASE/'proof/c/wrapper.annotations.json'), 'Installed wrapper annotation drift')
        raw = destination.with_name(stem+'.raw.c');raw.write_text(include('spec.c',raw));identity='spec.c'
    else:
        text = include('shim/'+stem+'.c',destination)
    return (relative_includes(text,destination,CASE) if stem.endswith('_unit') else text),flags,raw,identity


def construction(stem):
    inputs=[]
    if stem in {'neon_unit','rvv_unit'}:
        isa=stem.split('_')[0]
        generation=read(CASE/'proof'/(isa+'-generation-status.json'))
        generator=generation.get('generator_source','proof/generate_kernel.py') if isa=='rvv' else 'proof/generate_kernel.py'
        require(generator in {'proof/generate_kernel.py','proof/generate_rvv_named.py','proof/generate_rvv_identity.py','proof/generate_rvv_staged.py','proof/generate_rvv_float_staged.py'},'Unknown live generator')
        source='impl/'+('testNEON.c' if isa=='neon' else 'testRVV.c')
        annotation='proof/c/'+isa+'.annotations.json'
        inputs=[source,'spec.c','shim/'+isa+'_frontend.h',generator,annotation,'proof/'+isa+'-generation-status.json']
        kind='annotate_live_implementation'
    elif stem=='wrapper_unit':
        source='spec.c';generator='proof/generate_wrapper.py';annotation='proof/c/wrapper.annotations.json'
        inputs=[source,generator,annotation];kind='annotate_live_public_caller'
    else:
        source='shim/'+stem+'.c';generator=None;annotation=None;inputs=[source];kind='include_live_helper'
    return dict(stem=stem,kind=kind,source=source,generator_source=generator,annotation_file=annotation,
                direct_source_sha256={name:sha(CASE/name)for name in inputs})

def absolute_includes(text,origin):
    return re.sub(r'(#\s*include\s*)"([^\"]+)"',lambda m:m[1]+'"'+str((origin/m[2]).resolve())+'"',text)

def render_unit(stem,destination,expected_recipe=None):
    destination=Path(destination);destination.parent.mkdir(parents=True,exist_ok=True)
    require(destination.resolve().is_relative_to((CASE/'.build').resolve()),'Translation units must stay in this case private build directory')
    recipe=construction(stem)
    require(expected_recipe is None or recipe==expected_recipe,'Live construction recipe drift: '+stem)
    text,flags,raw,identity=template(stem,destination)
    text=absolute_includes(text,destination.parent)
    identity_text=absolute_includes(raw.read_text(),raw.parent)if raw else None
    destination.write_text(text)
    if raw:raw.write_text(identity_text)
    return dict(stem=stem,text=text,cpp_flags=flags,construction=recipe,identity_text=identity_text,identity_source=identity,
                private_source_path=str(destination),private_identity_path=str(raw)if raw else None)
