#!/usr/bin/env python3
"""Additional finite native replay with verifiable budgets; no formal proof claim."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,json,re,os,hashlib,subprocess,tempfile,time,resource,threading,shlex
resource.setrlimit(resource.RLIMIT_CORE,(0,0))
p=argparse.ArgumentParser();p.add_argument('case',type=Path);a=p.parse_args();case=a.case.resolve();root=next(p for p in case.parents if(p/'.git').exists());work=Path(tempfile.mkdtemp(prefix='publication-native-',dir=case/'.build'));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[];lock=threading.Lock();status={'passed':False,'formal_proof_replayed':False,'scope':'Additional independently built actual C providers, original kernels and public caller with nearbyintf oracle; same public numeric-or-both-NaN observation, finite tests only. ASAN actual16GiB cgroup, UBSAN/compilers16GiB address-space cap.','run_directory':str(work),'records':records,'parallel_jobs':16}
def execute(label,command,expected=0,bounded=True):
 cmd=list(map(str,command));cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]if bounded else cmd;folder=work/'jobs'/label;folder.mkdir(parents=True);log=work/(label+'.log');t=time.monotonic()
 with log.open('w')as f:r=subprocess.run(cmd,cwd=folder,stdout=f,stderr=f,timeout=1800)
 with lock:records.append({'label':label,'command':cmd,'cwd':str(folder),'exit_code':r.returncode,'expected_exit_code':expected,'seconds':time.monotonic()-t,'log_sha256':sha(log)})
 assert r.returncode==expected,(label,r.returncode,log.read_text()[-3000:]);print(label,r.returncode,flush=True);return log.read_text()
try:
 providers=[case/'spec.c']+[case/'shim'/n for n in ['bits.c','scalar.c','active.c','memory_neon.c','memory_rvv_load.c','memory_rvv_store.c','rvv_control.c']]+[case/u['source']for u in json.loads((case/'proof/vector-units.json').read_text())];harness=case/'shim/runtime/harness.c';wrong_harness=work/'wrong-harness.c';htext=harness.read_text();assert htext.count('return 1;')==htext.count('return 2;')==1;wrong_harness.write_text(htext.replace('return 1;','fflush(stdout);free(a);free(saved);free(neon);free(rvv);return 1;').replace('return 2;','fflush(stdout);free(a);free(saved);free(neon);free(rvv);return 2;'));kernels=[];mutants=[]
 for side,file in [('neon','testNEON.c'),('rvv','testRVV.c')]:
  prefix='#include "'+str(case/'shim'/(side+'_frontend.h'))+'"\n';raw=(case/'impl'/file).read_text();unit=work/(side+'.c');unit.write_text(prefix+raw);kernels.append(unit)
  mutant=work/(side+'-wrong.c');name='test_'+side;mutant.write_text(prefix+'#include <stdint.h>\n#include <string.h>\n#define '+name+' real_'+name+'\n'+raw+'\n#undef '+name+'\nvoid '+name+'(size_t n,const float *input,float *output,const struct xnn_f32_default_params *params){real_'+name+'(n,input,output,params);if(n>=sizeof(float)){uint32_t bits;memcpy(&bits,output,4);bits^=1U;memcpy(output,&bits,4);}}\n');mutants.append(mutant)
 inventory={}
 for i,source in enumerate([*providers,harness,*kernels]):
  text=execute('dependencies-'+str(i),['cc','-std=c11','-DQCP_NATIVE','-MM','-I',case/'shim',source]).replace('\\\n',' ')
  for line in text.splitlines():
   assert ':' in line
   for name in shlex.split(line.split(':',1)[1]):
    path=Path(name).resolve();assert path.is_relative_to(root)
    if not path.is_relative_to(work):inventory[os.path.relpath(path,case)]=sha(path)
 for name in ['impl/testNEON.c','impl/testRVV.c','proof/semantics.json','proof/native.py']:inventory[name]=sha(case/name)
 old=json.loads((case/'proof/native-status.json').read_text());expected_inventory={os.path.relpath((case/name).resolve(),case):digest for name,digest in old['input_sha256'].items()};assert inventory==expected_inventory;assert len(inventory)==52
 status['input_sha256']=inventory;status['system_headers_hashed']=False;status['negative_harness_scope']='Only negative fixture frees allocations and flushes the oracle mismatch before returning; all original frozen case files unchanged.';status['new_generated_sources']={p.name:sha(p)for p in [*kernels,*mutants,wrong_harness]}
 launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
 for mode in ['undefined','address']:
  flags=['cc','-std=c11','-O1','-g','-Wall','-Wextra','-Wno-unused-parameter','-Werror','-DQCP_NATIVE','-frounding-math','-fno-fast-math','-fsanitize='+mode,'-fno-sanitize-recover=all','-I',str(case/'shim')];sources=[*providers,harness,*kernels,*mutants];objects=[work/(mode+'-'+str(i)+'.o')for i in range(len(sources))]
  with ThreadPoolExecutor(max_workers=16)as pool:list(pool.map(lambda i:execute(mode+'-compile-'+str(i),[*flags,'-c',sources[i],'-o',objects[i]]),range(len(sources))))
  positive=work/(mode+'-native');execute(mode+'-link',[*flags,*objects[:-2],'-lm','-o',positive]);base=objects[:len(providers)];negative_harness_obj=work/(mode+'-wrong-harness.o');execute(mode+'-negative-harness-compile',[*flags,'-c',wrong_harness,'-o',negative_harness_obj]);negative=work/(mode+'-common-wrong');execute(mode+'-negative-link',[*flags,*base,negative_harness_obj,*objects[-2:],'-lm','-o',negative])
  if mode=='undefined':out=execute(mode+'-run',[positive])
  else:
   out=execute(mode+'-run',['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,positive],bounded=False);status['asan_cgroup']=json.loads(out.splitlines()[0])
  assert '6300 cases, 378600 lanes per side, scalar nearbyintf independent oracle passed' in out
  if mode=='undefined':out=execute(mode+'-common-wrong',[negative],expected=1)
  else:out=execute(mode+'-common-wrong',['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,negative],expected=1,bounded=False)
  assert 'ERROR: LeakSanitizer' not in out and 'ERROR: AddressSanitizer'not in out,'Negative control rejected by sanitizer rather than scalar oracle'
  match=re.search(r'mismatch n=(\d+) i=(\d+) x=(\w+) neon=(\w+) rvv=(\w+) oracle=(\w+)',out);assert match and match[4]==match[5]and match[4]!=match[6];status[mode+'_negative_control']={'both_sides_same_wrong_bits':match[4],'independent_nearbyintf_expected_bits':match[6],'exit_code':1}
 assert all(sha(case/n)==digest for n,digest in inventory.items());status.update(passed=True,cases_per_sanitizer=6300,lanes_per_side_per_sanitizer=378600,per_process_memory_GiB=16,input_identity_unchanged=True,common_wrong_negative_control_rejected=True)
except Exception as e:status['error']=str(e);print(e,flush=True)
(work/'status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',work,flush=True);raise SystemExit(0 if status['passed']else 1)
