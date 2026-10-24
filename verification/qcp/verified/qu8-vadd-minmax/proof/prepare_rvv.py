#!/usr/bin/env python3
"""Prepare one fresh ordinary-Coq kernel environment; no checked-C credit yet."""
from pathlib import Path
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent;NS="Qu8Add";UNSIGNED=True
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def imports(text):
 out=[];clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
 for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
  pre,body=m.groups()
  for w in body.split():
   n=(pre+'.'+w)if pre else w
   if n.startswith(NS+'.'):out.append(n[len(NS)+1:])
 return sorted(set(out))
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();assert 16<=a.jobs<=64 and 0<a.timeout<=7200
 r=Path(tempfile.mkdtemp(prefix='rvv-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();records=[];graph={};sources={};s=dict(passed=False,prepared=False,vc_correct_passed=False,whole_kernel_verified=False,scope='fresh source/goal bootstrap only; proof partitions still pending',run_directory=str(r),coq_directory=str(coq),parallel_jobs=a.jobs,preparation_verifier_limit=1,records=records,source_sha256=sources,dag=graph)
 try:
  generation=json.loads((C/'proof/rvv-generation-status.json').read_text());assert generation['generation_passed'] and generation['raw_source_unchanged'] and sha(C/'impl/testRVV.c')==generation['raw_c_sha256'];g=Path(generation['run_directory'])/'rvv_unit_goal.v';known={'rvv_unit_goal':g};comp=json.loads((C/'proof/neon-composed-status.json').read_text());assert comp['passed'];cr=Path(comp['run_directory']);kind='unsigned_tail'if UNSIGNED else'signed_tail';byte='u8'if UNSIGNED else's8'
  for name in [byte+'_arrays_strategy_goal']:
   hits=list(cr.rglob(name+'.v'));assert hits and len({sha(x)for x in hits})==1;known[name]=hits[0]
  st=json.loads((C/'proof/rvv-kernel-strategy-status.json').read_text());assert st['passed'];hits=list(Path(st['run_directory']).rglob('rvv_kernel_strategy_goal.v'));assert hits and len({sha(x)for x in hits})==1;known['rvv_kernel_strategy_goal']=hits[0]
  def visit(n):
   if n in graph:return
   src=known[n]if n in known else C/'proof/coq'/(n+'.v');text=src.read_text();clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
   if n not in known:assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
   graph[n]=imports(text);sources[n]=dict(origin=str(src),sha256=sha(src));shutil.copyfile(src,coq/(n+'.v'))
   for dep in graph[n]:visit(dep)
  visit('RvvKernelAutomation');assert not list(coq.glob('*.vo'));flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS];done=set()
  # A76MB actual goal is first bootstrapped with one verifier, before any batch.
  # The subsequent independent proof partitions use the configured16-worker pool.
  while len(done)<len(graph):
   ready=sorted(n for n in graph if n not in done and set(graph[n])<=done);assert ready,'unresolved imports';n=ready[0];log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];start=time.monotonic()
   with log.open('w')as f:
    try:z=subprocess.run(cmd,cwd=r,stdout=f,stderr=f,timeout=a.timeout).returncode
    except subprocess.TimeoutExpired:z=124
   records.append(dict(label=n,command=cmd,exit_code=z,seconds=time.monotonic()-start,log_sha256=sha(log)));print(n,z,flush=True);(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert not z,log.read_text()[-3000:];done.add(n)
  assert all(sha(Path(x['origin']))==x['sha256']for x in sources.values());fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);s.update(prepared=True,actual_goal_fields=len(fields),fields=fields,goal_sha256=sha(g),compiled_local_modules=len(done),no_component_vo_reused=True,compiled_source_sha256={NS+'.'+n:sha(coq/(n+'.v'))for n in done})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');d=C/'proof/rvv-preparation-status.json'
 if d.exists():(C/'proof/history'/('rvv-preparation-status-'+sha(d)+'.json')).write_bytes(d.read_bytes())
 d.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['prepared','run_directory','actual_goal_fields','error']},indent=2));return 0 if s['prepared']else 1
if __name__=='__main__':raise SystemExit(main())
