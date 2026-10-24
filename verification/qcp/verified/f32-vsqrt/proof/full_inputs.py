"""Materialize authoritative live C plus annotations only inside private .build."""
from pathlib import Path
import hashlib,importlib.util,os,re,json
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
HELPERS={'store_adapters':'shim/store_adapters.c','rvv_store':'shim/rvv_store.c','assert_unit':'shim/assert.c','array_read':'shim/array_read.c','bridge':'shim/bridge.c','comparator':'shim/comparator.c'}
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def require(ok,message):
 if not ok:raise ValueError(message)
def module(name,path):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
def construction(stem):
 if stem in HELPERS:source=HELPERS[stem];kind='include_live_checked_ordinary_helper';generator=None;annotation=None;inputs=[source]
 elif stem in {'neon_unit','rvv_unit'}:
  isa=stem.split('_')[0];source='impl/'+('testNEON.c'if isa=='neon'else'testRVV.c');kind='annotate_original_live_kernel';generator='proof/generate_kernel.py';annotation='proof/c/'+isa+'.annotations.json';inputs=[source,'spec.c','shim/intrinsics.h',generator,annotation]
 elif stem=='wrapper_unit':source='spec.c';kind='annotate_live_public_caller';generator='proof/generate_public.py';annotation=generator;inputs=[source,'shim/intrinsics.h','shim/comparator.h',generator]
 else:raise ValueError('Unknown actual C unit '+stem)
 return dict(stem=stem,kind=kind,source=source,generator_source=generator,annotation_file=annotation,direct_source_sha256={n:sha(CASE/n)for n in inputs})
def absolute_includes(text,origin):
 def fix(m):
  p=(origin/m[1]).resolve();require(p.is_relative_to(ROOT.resolve()),'Include escapes repository');return '#include "'+str(p)+'"'
 return re.sub(r'^\s*#\s*include\s*"([^\"]+)"',fix,text,flags=re.M)
def render_unit(stem,destination,expected_recipe=None):
 destination=Path(destination);destination.parent.mkdir(parents=True,exist_ok=True);require(destination.resolve().is_relative_to((CASE/'.build').resolve()),'Only private .build C materialization is permitted')
 recipe=construction(stem);require(expected_recipe is None or recipe==expected_recipe,'Construction recipe/source drift: '+stem)
 identity=None;raw=None
 if stem in HELPERS:text='#include "'+str(CASE/HELPERS[stem])+'"\n'
 elif stem in {'neon_unit','rvv_unit'}:
  isa=stem.split('_')[0];g=module('sqrt_live_kernel',CASE/'proof/generate_kernel.py');original,annotated,ann=g.kernel_text(isa);require(ann==json.loads((CASE/recipe['annotation_file']).read_text()),'Installed kernel annotations changed');text=g.kernel_header(isa)+annotated;identity=recipe['source'];raw=destination.with_name(stem+'.raw.c');raw.write_text('#include "'+str(CASE/'shim/intrinsics.h')+'"\n#include "'+str(CASE/identity)+'"\n')
 else:
  g=module('sqrt_live_public',CASE/'proof/generate_public.py');text=g.unit_text(stem);identity='spec.c';raw=destination.with_name(stem+'.raw.c');raw.write_text('#include "'+str(CASE/identity)+'"\n')
 text=absolute_includes(text,CASE);destination.write_text(text)
 return dict(stem=stem,text=text,cpp_flags=[],construction=recipe,identity_source=identity,identity_text=raw.read_text()if raw else None,private_source_path=str(destination),private_identity_path=str(raw)if raw else None)
