from pathlib import Path
import os,json,re,subprocess,tempfile,time,hashlib,shutil,argparse
P=Path(__file__).resolve().parent;c=P.parent;root=next(p for p in c.parents if(p/'.git').exists());pa=argparse.ArgumentParser();pa.add_argument('--core',type=Path,required=True);pa.add_argument('--modules',nargs='+',default=['NeonInit']);a=pa.parse_args();core=a.core.resolve();run=Path(tempfile.mkdtemp(prefix='neon-memory-',dir=c/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qu8Rsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[];d={'passed':False,'whole_kernel_verified':False,'scope':'Selected actual NEON memory fields only','run_directory':str(run),'source_sha256':{},'dependency_provenance':str(core),'records':records}
def cc(n):
 src=P/'coq'/(n+'.v');d['source_sha256'][str(src.relative_to(c))]=sha(src);shutil.copyfile(src,coq/src.name);log=run/(n+'.log');t=time.monotonic()
 with log.open('w')as f:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/src.name)],cwd=run,env=env,stdout=f,stderr=f,timeout=3600)
 records.append({'module':n,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(n,r.returncode,flush=True)
 if r.returncode:raise RuntimeError(log.read_text()[-2400:])
try:
 old=json.loads((core.parent/'records.json').read_text());assert any(r['module']=='neon_unit_goal'and r['exit_code']==0 for r in old)
 # These dependency artifacts were freshly checked in the recorded actual-goal run.
 for p in core.iterdir():
  if p.suffix in ['.v','.vo','.vos','.vok','.glob']:shutil.copyfile(p,coq/p.name)
 d['reused_dependency_sha256']={p.name:sha(p)for p in core.glob('*.vo')}
 for n in ['RvvBounds','ProgramFacts','RvvFacts','NeonProgramModel','NeonFacts','ByteFrame','NeonSupport','NeonTailFacts',*a.modules]:cc(n)
 d['passed']=True;d['modules']=a.modules;d['selected_fields']=sorted(set(n for m in a.modules for n in re.findall(r'Lemma proof_of_(test_neon_\w+)\b',(P/'coq'/(m+'.v')).read_text())))
except Exception as e:d['error']=str(e);print(str(e),flush=True)
for p in [run/'status.json',P/('neon-memory-'+ '-'.join(a.modules)+'-status.json')]:p.write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps({k:d.get(k)for k in ['passed','run_directory','error']}),flush=True)
raise SystemExit(0 if d['passed']else 1)
