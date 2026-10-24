"""Fresh C generation/identity only; cannot issue any whole-kernel certificate."""
from pathlib import Path
import importlib.util,json,hashlib,re,tempfile,subprocess,time,concurrent.futures,argparse
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();spec=importlib.util.spec_from_file_location('sqrt_current_inputs',H/'full_inputs.py');inputs=importlib.util.module_from_spec(spec);spec.loader.exec_module(inputs)
COUNTS={'store_adapters':17,'rvv_store':75,'assert_unit':1,'array_read':2,'bridge':14,'comparator':12,'wrapper_unit':11,'neon_unit':77,'rvv_unit':53}
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--stems',nargs='+',default=list(COUNTS));a=ap.parse_args();assert set(a.stems)<=set(COUNTS);run=Path(tempfile.mkdtemp(prefix='current-tu-gen-',dir=C/'.build'));records=[]
 slp=['-slp',C/'shim','Sqrt','-slp',H/'c','Sqrt',*sum((['-slp',p,p.name]for p in sorted((B/'proof/c').iterdir())if p.is_dir()),[])]
 def work(stem):
  d=run/stem;d.mkdir();src=d/(stem+'.raw.c');render=inputs.render_unit(stem,src);cpp=d/(stem+'.c');rs=[]
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C,'-I',C/'shim',src,'-o',cpp]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(cpp),'--coq-output-dir='+str(d),'--coq-logic-path=Sqrt',*slp])]:
   command=['prlimit','--as=34359738368:34359738368','--',*map(str,cmd)];log=d/(label+'.log');t=time.monotonic()
   with log.open('w')as out:
    try:ec=subprocess.run(command,cwd=d,stdout=out,stderr=out,timeout=21600).returncode
    except subprocess.TimeoutExpired:ec=124
   rs.append(dict(label=label,command=command,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)))
   if ec:return dict(stem=stem,passed=False,records=rs)
  g=d/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);current=H/'coq'/g.name;assert len(fields)==COUNTS[stem];assert sha(g)==sha(current),'Fresh current goal differs from typed component '+stem
  return dict(stem=stem,passed=True,goal_sha256=sha(g),cpp_sha256=sha(cpp),fields=fields,generated_c_vcs=len(fields),generation_directory=str(d),goal=str(g),construction=render['construction'],records=rs)
 try:
  with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
   for r in pool.map(work,a.stems):records.append(r);print(r['stem'],r['passed'],r.get('generated_c_vcs'),flush=True)
  passed=all(r['passed']for r in records);error=None
 except Exception as e:passed=False;error=str(e)
 s=dict(passed=passed,whole_kernel_verified=False,scope='fresh_actual_C_generation_and_exact_checked_goal_identity_only',run_directory=str(run),units=records,error=error);(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if passed else 1)
if __name__=='__main__':main()
