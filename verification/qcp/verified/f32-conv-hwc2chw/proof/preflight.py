"""Private current-source CPP/signature/contract/ordinary-call preflight only."""
from pathlib import Path
import argparse,json,tempfile,subprocess,hashlib,re,time
import context as X
import full_inputs as I
import full_call_coverage as coverage

def prepare(case,require_complete=False):
 I.configure(case);C=I.CASE;(C/'.build').mkdir(exist_ok=True)
 rows=I.inventory_units(require_complete);strategies=I.strategy_units();inv=I.inventory();N=Path(tempfile.mkdtemp(prefix='whole-preflight-',dir=C/'.build'));records=[];units=[];expanded={};s={'passed':False,'scope':'CPP/actual body/contract/call/representation preparation only, no QCP or Coq credit','run_directory':str(N),'qcp_executed':False,'coq_executed':False,'whole_kernel_verified':False,'records':records,'units':units}
 try:
  for row in rows:
   stem=row['stem'];folder=N/stem;folder.mkdir();src=folder/(stem+'.c');rendered=I.render_unit(stem,src,row['construction']);cpp=folder/'expanded.c';cmd=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc',*rendered['cpp_flags'],'-I',str(C),str(src),'-o',str(cpp)];t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,timeout=600);log=folder/'cpp.log';log.write_text(r.stdout+r.stderr);records.append(dict(label=stem+'-cpp',command=cmd,exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=X.sha(log)));X.require(r.returncode==0,r.stderr)
   if rendered['private_identity_path']:
    raw=folder/'raw-expanded.c';cmd2=[str(raw)if x==str(cpp)else rendered['private_identity_path']if x==str(src)else x for x in cmd];r2=subprocess.run(cmd2,capture_output=True,text=True,timeout=600);(folder/'raw-cpp.log').write_text(r2.stdout+r2.stderr);records.append(dict(label=stem+'-raw-cpp',command=cmd2,exit_code=r2.returncode,log_sha256=X.sha(folder/'raw-cpp.log')));X.require(r2.returncode==0 and I.tokens(raw.read_text())==I.tokens(cpp.read_text()),'Raw/runtime CPP token identity '+stem)
   expanded[stem]=cpp;units.append(dict(stem=stem,actual_C_fields=len(row['fields']),fields=row['fields'],goal_sha256=row['goal_sha256'],cpp_sha256=X.sha(cpp),construction=row['construction'],typed_instance=row['typed_instance'],definition_representation=row['definition_representation']))
  closure=coverage.audit_sources(expanded,inv,X.read(C/'proof/intrinsic-ledger.json'),C)
  s.update(passed=True,actual_C_fields=sum(u['actual_C_fields']for u in units),actual_C_units=len(units),unique_ordinary_C_bodies=closure['unique_ordinary_C_bodies'],strategy_fields=sum(x['fields']for x in strategies),call_closure=closure,component_inventory_sha256=X.sha(C/'proof/component-unit-inventory.json'))
 except Exception as e:s['error']=repr(e)
 (N/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(N,flush=True);print({k:s.get(k)for k in ['passed','actual_C_units','actual_C_fields','unique_ordinary_C_bodies','error']},flush=True);return s
if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--case',type=Path,required=True);p.add_argument('--require-complete-components',action='store_true');a=p.parse_args();s=prepare(a.case,a.require_complete_components);raise SystemExit(0 if s['passed']else 1)
