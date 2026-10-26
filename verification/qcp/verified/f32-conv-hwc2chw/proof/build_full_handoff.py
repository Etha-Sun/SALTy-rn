#!/usr/bin/env python3
"""Prepare/freeze complete live replay inputs. No formal proof credit is issued."""
from pathlib import Path
import argparse,json,re,tempfile,subprocess,time,sys
import context as X
import full_inputs as I
import preflight
import gate_sources
import declarations
NS=I.NS
TOOL_FILES=['context.py','render_full_units.py','full_inputs.py','full_call_coverage.py','preflight.py','build_full_handoff.py','check_full.py','parallel.py','external_dependencies.py','gate_sources.py','declarations.py','assumptions.py']
OUTPUTS={'proof/frozen-full-handoff.json','proof/full-status.json','proof/status.json','proof/manifest.json','proof/assumption-audit.json','proof/full-preflight-status.json'}

def clean_coq(text):
 result=[];depth=0;i=0
 while i<len(text):
  if text.startswith('(*',i):depth+=1;result.extend('  ');i+=2
  elif text.startswith('*)',i)and depth:depth-=1;result.extend('  ');i+=2
  else:result.append(text[i]if not depth or text[i]=='\n'else' ');i+=1
 X.require(depth==0,'Unclosed Coq comment');return ''.join(result)

def source_closure(case,roots,generated,allowed):
 graph={};case=Path(case)
 def visit(n):
  if n in graph:return
  X.require(re.fullmatch(r'\w+',n),'Flat local logical module required '+n);p=case/'proof/coq'/(n+'.v');X.require(p.is_file(),'Missing necessary current source '+n);text=clean_coq(p.read_text());graph[n]=[]
  declarations.audit(text,n,allowed,n in generated)
  deps=set()
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',text):
   for word in m[2].split():
    full=(m[1]+'.'+word)if m[1]else word
    if full.startswith(NS+'.'):deps.add(full[len(NS)+1:])
    elif '.'not in full:X.require(not(case/'proof/coq'/(full+'.v')).exists(),'Unqualified local import '+full)
  graph[n]=sorted(deps)
  for d in deps:visit(d)
 for n in roots:visit(n)
 return graph

def input_inventory(case):
 result={}
 for p in Path(case).rglob('*'):
  rel=p.relative_to(case)
  if not p.is_file()or any(v in {'.build','__pycache__','.git'}for v in rel.parts)or str(rel)in OUTPUTS or p.suffix in{'.vo','.vos','.vok','.vio','.glob','.aux','.pyc'}:continue
  X.require(p.resolve().is_relative_to(X.ROOT),'Frozen input escapes repository');result[str(rel)]=X.sha(p)
 return dict(sorted(result.items()))

def package_audit(case):
 p=Path(case)/'proof/package_checks.py';X.require(p.is_file(),'Root package/native/repair/SDK audit is not installed');m=X.load('hwc_package_checks',p);report=m.audit_package(Path(case));X.require(isinstance(report,dict)and report.get('passed')is True,'Package admission failed');return report

def main():
 X.require(__debug__,'Normal Python assertion mode required');ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--case',type=Path,required=True);ap.add_argument('--config',type=Path,required=True);ap.add_argument('--freeze',action='store_true');a=ap.parse_args();I.configure(a.case);C=I.CASE;(C/'.build').mkdir(exist_ok=True)
 quota=X.read(X.ROOT/'.build/memory/quota/state.json');X.require(not quota['wind_down_requested'],'Quota winddown');N=Path(tempfile.mkdtemp(prefix='whole-handoff-',dir=C/'.build'));state=dict(passed=False,scope='source/CPP/closure/H preparation, not proof credit',whole_kernel_verified=False,formal_proof_replayed=False,run_directory=str(N));print(N,flush=True)
 try:
  before=input_inventory(C);pf=preflight.prepare(C,True);X.require(pf['passed'],'Current13CPP preparation failed');rows=I.inventory_units(True);by={u['stem']:u for u in pf['units']};units=[dict(r,cpp_sha256=by[r['stem']]['cpp_sha256'],cpp_flags=I.portable_cpp_flags(['-I',str(C/'shim')]))for r in rows];strategies=I.strategy_units()
  for st in strategies:
   st.setdefault('source','proof/c/hc_maps.strategies');st.setdefault('source_sha256',X.sha(C/st['source']));st['module_type']=re.findall(r'^Module Type (\w+)',(C/st['goal_source']).read_text(),re.M)[0]
  generated={u['stem']+'_goal'for u in units}|{s['stem']for s in strategies};roots=[u['provider_root']for u in units]+['hc_maps_strategy_proof','HwcPublicObservationModel'];allowed=declarations.allowed_types(units,strategies);graph=source_closure(C,roots,generated,allowed);X.require(generated<=set(graph),'Actual target missing from required source DAG');cfgtext=a.config.read_text();cfg=json.loads(cfgtext);X.require(cfg['flags'][:2]==['qcp-env','coqc'],'Approved ordinary Coq bootstrap required')
  tools={n:X.sha(Path(__file__).resolve().parent/n)for n in TOOL_FILES};complete=False;package=None
  if(C/'proof/package_checks.py').exists():package=package_audit(C);complete=True
  if a.freeze:
   X.require(complete,'Complete package/native/repair/SDK admission required before freeze')
   for name,digest in tools.items():X.require((C/'proof'/name).is_file()and X.sha(C/'proof'/name)==digest,'Install exact replay tool before freeze '+name)
  h=dict(schema=1,namespace=NS,complete_handoff=complete,scope='frozen complete replay inputs only, not certificate',whole_kernel_verified=False,units=units,strategies=strategies,own_modules=sorted(graph),source_dag=graph,allowed_abstract_signature_types=allowed,support_modules=[],actual_c_function_count=19,total_actual_c_vcs=1748,total_strategy_fields=4,package_checks=package,native_statuses=(package or{}).get('native_statuses',[]),implementations=(package or{}).get('implementations',{}),coq_config_text=cfgtext,coq_config_sha256=X.sha(a.config),coq_flags=cfg['flags'][2:],heavy_coq_labels=[],frozen_source_sha256=before,tool_sources_sha256=tools,call_closure=pf['call_closure'],limits=X.read(C/'proof/semantics.json'),preparation_run=str(N),actual_C_goal_identity_preflight='Must be archived as preparation only; full run regenerates each actual goal independently',final_actual_report_count=3496,final_second_c_fields=1748,final_strategy_report_count=8,final_second_strategy_fields=4,final_mathematical_report_constants=gate_sources.SUPPORT,final_assumptions_report_count=3514)
  I.approved_coq_flags(h,N);X.require(before==input_inventory(C),'Inputs changed during H preparation');(N/'handoff.json').write_text(json.dumps(h,indent=2)+'\n')
  if a.freeze:
   dest=C/'proof/frozen-full-handoff.json';X.require(not dest.exists(),'Never overwrite an existing H; preserve history explicitly first');dest.write_bytes((N/'handoff.json').read_bytes());state['frozen_handoff_sha256']=X.sha(dest)
  state.update(passed=True,complete_handoff=complete,actual_C_units=13,actual_C_fields=1748,strategy_fields=4,required_source_modules=len(graph),frozen_inputs=len(before),tool_sources_sha256=tools)
 except Exception as error:state['error']=repr(error)
 (N/'status.json').write_text(json.dumps(state,indent=2)+'\n');print({k:state.get(k)for k in ['passed','complete_handoff','required_source_modules','frozen_inputs','error']},flush=True);return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
