from pathlib import Path
import sys,subprocess,hashlib,json,time,runpy,os,signal
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;B=R/'experiments/shim-c-v2';c=H/sys.argv[1];name=sys.argv[2];logs=c/'logs';logs.mkdir(exist_ok=True)
obs=B/'stage3-inventory-research/.build/observer.cmxs';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();assert sha(obs)=='df62e27ec11d707f2dee90423f3f42e485784b0dd7182a8848f3fd53f9de6d96'
sys.path.insert(0,str(R/'tools'));actual=subprocess.run;counter=0

def bounded(cmd,*args,**kw):
 global counter
 if not isinstance(cmd,list) or '-wp' not in cmd:return actual(cmd,*args,**kw)
 counter+=1;requested=list(cmd);cmd=list(cmd);cmd[1:1]=['-load-module',str(obs)]
 if '-wp-memlimit' in cmd:cmd[cmd.index('-wp-memlimit')+1]='2048'
 else:cmd+=['-wp-memlimit','2048']
 ev=logs/(name+'-events-'+str(counter)+'.jsonl');kw['env']={**kw.get('env',os.environ),'WP_OBSERVER_JSONL':str(ev)};timeout=kw.pop('timeout',None)
 with (logs/(name+'-execution.jsonl')).open('a') as f:f.write(json.dumps(dict(requested=requested,actual=cmd,timeout=timeout,events=str(ev),observer_sha256=sha(obs),start_utc=time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime())))+'\n')
 p=subprocess.Popen(cmd,*args,start_new_session=True,**kw)
 try:out,err=p.communicate(timeout=timeout)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.communicate();raise
 return subprocess.CompletedProcess(cmd,p.returncode,out,err)
subprocess.run=bounded
sys.argv=[str(R/'tools/shim_c_campaign_v4.py'),str(c),'--frozen-sha256',sha(c/'frozen.json'),'--name',name,'--framac',str(B/'handoff-model-plus/frama-c.py'),'--prover-bin',str(B/'handoff-solvers/.build/bin')]
runpy.run_path(sys.argv[0],run_name='__main__')
