#!/usr/bin/env python3
from pathlib import Path
import json,tempfile,shutil,subprocess,hashlib,os,re,shlex,time
C=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();run=Path(tempfile.mkdtemp(prefix='neon-pixel-native-',dir=C/'.build'));work=run/'case';work.mkdir();files=['proof/check_neon_pixel_native.py','proof/native/neon_pixel_harness.c','proof/native/runtime.h','proof/native/extra.h','shim/neon3_helpers.c','shim/neon3_helpers.h','shim/neon_rows_pixel.c','shim/neon_rows_pixel.h'];inputs={p:sha(C/p)for p in files}
for n in files:p=work/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(C/n,p)
records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'Finite new ordinary27-FMA C body vs direct27 original-intrinsic source-order C reference and independent scalar fmaf oracle. All nonNaN bits exact, NaN observer bothNaN. Native instruction emulation, not physical ISA execution or formal proof.','input_sha256':inputs,'run_directory':str(run),'configured_jobs':32,'max_live_processes':1,'per_process_memory_GiB':16,'records':records}
env={**os.environ};env.pop('HWC_NEGATIVE',None)
cgroup=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',"import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"]
def execute(label,cmd,address=False,negative=None):
 cmd=list(map(str,cmd))
 if negative is not None:cmd=['env','HWC_NEGATIVE='+str(negative),*cmd]
 cmd=[*cgroup,*cmd]if address else['prlimit','--as=17179869184:17179869184','--',*cmd];log=run/(label+'.log');t=time.monotonic()
 with log.open('w')as f:r=subprocess.run(cmd,cwd=work,env=env,stdout=f,stderr=f,timeout=1800)
 records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,r.returncode,flush=True);return r.returncode,log.read_text()
try:
 results={}
 for san in ['undefined','address']:
  flags=['-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fno-omit-frame-pointer','-fno-sanitize-recover=all','-fsanitize='+('address,undefined'if san=='address'else'undefined')];exe=work/('test-'+san)
  code,out=execute(san+'-compile',['gcc',*flags,work/'proof/native/neon_pixel_harness.c','-lm','-o',exe]);assert code==0,out[-2500:]
  depcmd=['gcc',*flags,'-MM',str(work/'proof/native/neon_pixel_harness.c')];dep=subprocess.run(depcmd,capture_output=True,text=True,cwd=work,env=env,timeout=60);assert dep.returncode==0,dep.stderr;local={}
  for f in shlex.split(dep.stdout.replace('\\\n',' '))[1:]:
   p=Path(f).resolve();assert p.is_relative_to(work);rel=str(p.relative_to(work));assert rel in files;local[rel]=sha(p)
  (run/(san+'-dependencies.mk')).write_text(dep.stdout)
  code,out=execute(san+'-correct',[exe],san=='address');assert code==0,out[-2500:];m=re.findall(r'^\{.*"failures":0\}$',out,re.M);assert len(m)==1;row=json.loads(m[0]);assert row['cases']==4000 and row['lanes']==16000,row
  if san=='address':assert '"actual_memory_max": "17179869184"'in out and'"actual_memory_swap_max": "0"'in out
  neg=[]
  for n in [1,2]:
   code,out=execute(san+'-wrong-'+str(n),[exe],san=='address',n);assert code==2 and'mismatch'in out,out[-2000:];assert not any(k in out for k in ['AddressSanitizer','LeakSanitizer','runtime error:'])
   v=re.search(r'actual=([0-9a-f]+) reference=([0-9a-f]+) oracle=([0-9a-f]+)',out);assert v
   if n==2:assert v[1]==v[2] and v[1]!=v[3]
   neg.append({'kind':'wrong-both-same'if n==2 else'wrong-one','oracle_rejected':True,'exit_code':code})
  results[san]={**row,'negative_controls':neg,'actual_recursive_local_input_sha256':local,'actual_recursive_local_input_count':len(local),'executable_sha256':sha(exe),'ASan_real_cgroup_16GiB_swap0':san=='address'}
 assert inputs=={p:sha(C/p)for p in files};s.update(passed=True,results=results)
except Exception as e:s['error']=str(e)
(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/neon-pixel-native-status.json'
if dest.exists():h=C/'proof/history/neon-pixel-native';h.mkdir(parents=True,exist_ok=True);shutil.copyfile(dest,h/(sha(dest)+'.json'))
dest.write_bytes((run/'status.json').read_bytes());print(run);raise SystemExit(0 if s['passed']else 1)
