#!/usr/bin/env python3
"""Complete typed528 gate; explicit coherent component reuse, not whole-case admission."""
from pathlib import Path
import argparse,datetime,hashlib,json,re,shutil,subprocess,tempfile,sys
P=Path(__file__).resolve().parent;C=P.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def make_core(paths):
 run=Path(tempfile.mkdtemp(prefix='neon-final-common-core-',dir=C/'.build'));coq=run/'coq';coq.mkdir();sources={};objects={};origins=[]
 for path in paths:
  st=path.parent/'status.json';d=json.loads(st.read_text());assert d['passed'],str(st)
  origins.append({'status':str(st),'sha256':sha(st),'passed':True})
  pins={**d.get('core_available_source_sha256',{}),**d['source_sha256']}
  for n,h in pins.items():
   src=path/(n+'.v');vo=path/(n+'.vo');assert sha(src)==h and vo.exists(),n
   if not n.endswith('_goal'):assert sha(P/'coq'/(n+'.v'))==h,n
   if n in sources:
    assert sources[n]==h and objects[n]==sha(vo),('inconsistent component object',n)
    continue
   sources[n]=h;objects[n]=sha(vo)
   for ext in ['.v','.vo','.vos','.vok']:
    f=path/(n+ext)
    if f.exists():shutil.copy2(f,coq/f.name)
 state={'passed':True,'whole_kernel_verified':False,'scope':'Checked source/object reuse only: every overlap has byte-identical .v and .vo; all component statuses true; final fresh whole-case gate remains mandatory','source_sha256':sources,'object_sha256':objects,'origin_receipts':origins}
 (run/'status.json').write_text(json.dumps(state,indent=2)+'\n');return coq

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--core',type=Path,action='append',required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--live-jobs-file',type=Path);ap.add_argument('--timeout',type=int,default=7200);a=ap.parse_args()
 root=next(p for p in C.parents if (p/'.git').exists())
 quota_path=root/'.build/memory/quota/state.json'
 quota=json.loads(quota_path.read_text())
 assert not quota.get('wind_down_requested',False),'Quota monitor requests wind-down: preserve active evidence; no new interface batch launched'
 quota_sha=sha(quota_path)
 paths=[p.resolve()for p in a.core];coq=make_core(paths)
 (coq.parent/'quota-before-launch.json').write_text(json.dumps({'source':str(quota_path),'source_sha256':quota_sha,'state':quota},indent=2)+'\n')
 subprocess.run([sys.executable,str(P/'prepare_neon_interface.py')],cwd=C,check=True)
 f=json.loads((P/'neon-interface-fieldmap.json').read_text());gen=P/'neon-generation-status.json';gen_sha=sha(gen);g=json.loads(gen.read_text());assert f['actual_goal_sha256']==g['goal_sha256']
 command=[sys.executable,str(P/'check_modules.py'),'--core',str(coq),'--jobs',str(a.jobs),'--memory-gib','16','--timeout',str(a.timeout),'--module','NeonChecked']
 for n in f['assumption_part_modules']:command+=['--module',n]
 if a.live_jobs_file:command+=['--live-jobs-file',str(a.live_jobs_file)]
 log=coq.parent/'interface-launch.log'
 with log.open('w')as out:result=subprocess.run(command,cwd=C,stdout=out,stderr=out)
 assert result.returncode==0,log
 summary=json.loads(log.read_text().splitlines()[-1]);run=Path(summary['run_directory']);st=run/'status.json';d=json.loads(st.read_text());assert d['passed']
 names=[x['name']for x in f['fields']];assert len(names)==len(set(names))==528
 counts={}
 for n in f['assumption_part_modules']:
  src=P/'coq'/(n+'.v');text=src.read_text();targets=re.findall(r'^Print Assumptions exact_(\w+)\.',text,re.M)
  assert len(targets)==len(set(targets));out=(run/(n+'.log')).read_text();count=len(re.findall(r'^(?:Axioms:|Closed under the global context)',out,re.M));assert count==len(targets),(n,count,len(targets));counts[n]=count
 assert sum(counts.values())==528 and sha(gen)==gen_sha
 source={n:h for n,h in {**d.get('core_available_source_sha256',{}),**d['source_sha256']}.items()}
 for n,h in source.items():
  if not n.endswith('_goal'):assert sha(P/'coq'/(n+'.v'))==h,n
 out={'passed':True,'vc_correct_passed':True,'kernel_vc_correct_passed':True,'whole_kernel_verified':False,'whole_case_verified':False,'scope':'Complete actual NEON528 VC_Correct under visible full-scale/full-int16zero, arbitrary-bound and single-map alias-capable contract. Whole-case fresh C/Coq/ISA-spec-ledger admission still pending.','typed_instance':f['typed_instance'],'actual_c_vcs':528,'fields':names,'goal_sha256':g['goal_sha256'],'cpp_sha256':g['cpp_sha256'],'raw_c_sha256':g['raw_c_sha256'],'annotation_sha256':g['annotation_sha256'],'generation_status_sha256':gen_sha,'run_directory':str(run),'core_directory':str(coq),'core_status_sha256':sha(coq.parent/'status.json'),'ordinary_status_sha256':sha(st),'Print_reports':528,'Print_part_counts':counts,'proof_source_sha256':source,'ordinary_records':d['records'],'source_DAG':d['dag'],'configured_parallel_jobs':a.jobs,'parallel_limit_history':d['parallel_limit_history'],'peak_active_jobs':d['peak_active_jobs'],'assumption_audit':'528 exact fully qualified fields each Print once. The fixed canonical assumption-name allowlist and external recursive import audit remain mandatory in the whole-case gate.','created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
 dest=P/'neon-proof-status.json'
 if dest.exists():
  h=P/'history'/('neon-proof-status-before-'+sha(dest)+'.json');h.write_bytes(dest.read_bytes())
 dest.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:out[k]for k in ['passed','vc_correct_passed','actual_c_vcs','Print_reports','run_directory']}),flush=True)
if __name__=='__main__':main()
