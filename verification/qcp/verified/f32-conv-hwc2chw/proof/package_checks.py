"""Read-only HWC source/repair/runtime checks. No QCP/Coq proof credit.
Runtime evidence is finite host instruction emulation or real SDK compilation.
"""
from pathlib import Path
import hashlib,json,re,subprocess,tempfile,shutil,shlex
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
read=lambda p:json.loads(Path(p).read_text())
def require(v,m):
 if not v:raise ValueError(m)
def local(case,name):
 p=Path(name);require(not p.is_absolute()and(case/p).resolve().is_relative_to(case.resolve()),'Case input escapes '+name);p=case/p;require(p.is_file()and not p.is_symlink(),'Missing regular case file '+name);return p
def check_inputs(case,pins):
 require(bool(pins),'Empty runtime input manifest')
 for n,h in pins.items():require(sha(local(case,n))==h,'Current input changed '+n)
def archive(case,status_name,filename):return local(case,'proof/evidence/runtime/'+Path(status_name).stem+'/'+filename)
def checked_log(case,status_name,record):
 p=archive(case,status_name,record['label']+'.log');require(sha(p)==record['log_sha256'],'Archived runtime log drift '+status_name+'/'+record['label']);return p.read_text()
def audit_native(case):
 results=[]
 for san in ['undefined','address']:
  name='native-'+san+'-status.json';p=local(case,'proof/'+name);require(p.read_bytes()==archive(case,name,'status.json').read_bytes(),'Archived native receipt differs');j=read(p);require(j['passed']is True and j['whole_kernel_verified']is False and j['quick']is False and j['original_rvv']is False,'Complete current native scope '+name);check_inputs(case,j['input_sha256']);check_inputs(case,j['actual_recursive_local_input_sha256'])
  require(j['actual_recursive_local_input_count']==len(j['actual_recursive_local_input_sha256']),'Recursive native input count differs')
  require(set(j['actual_recursive_local_input_sha256'])<=set(j['input_sha256']),'Unrecorded recursive native input')
  for n,h in j['actual_recursive_local_input_sha256'].items():require(j['input_sha256'][n]==h,'Recursive native SHA differs')
  require({'spec.c','impl/testNEON.c','impl/testRVV.c','shim/neon_rows_pixel.c','shim/rvv_rows_fma3.c','shim/hc_rvv_pixel9.c'}<=set(j['actual_recursive_local_input_sha256']),'Actual current bodies/caller missing')
  dep=archive(case,name,'dependencies.mk').read_text();dep_paths=dep.replace('\\\n',' ').split(':',1)[1].split();root=Path(j['run_directory'])/'case';observed={str(Path(n).resolve().relative_to(root.resolve()))for n in dep_paths};require(observed==set(j['actual_recursive_local_input_sha256']),'Actual recursive dependency output differs')
  require(j['sanitizer']==san and j['configured_jobs']==32 and j['max_live_processes']==1 and j['per_process_memory_GiB']==16,'Native profile changed')
  require(j['public_mode_calls_per_case']==2 and j['public_modes']==[0,4294967295],'Public caller modes not exercised')
  require(j['cases']==307800 and j['lanes_per_side']==14040000 and j['RO_alias_cases']==246240 and j['unwritten_frame_cells']==87879870 and j['failures']==0,'Full oracle case accounting differs')
  rec={r['label']:r for r in j['records']};require(len(rec)==len(j['records'])==4 and set(rec)=={'compile','correct','wrong-1','wrong-2'},'Missing actual native executions')
  require(rec['compile']['exit_code']==rec['correct']['exit_code']==0,'Actual native execution failed');require(checked_log(case,name,rec['compile'])=='','Unexpected compiler diagnostic')
  out=checked_log(case,name,rec['correct']);lines=out.strip().splitlines()
  if san=='address':
   require(j['actual_memory_max']==17179869184 and j['actual_memory_swap_max']==0 and j['LSan_enabled']is True,'Actual ASan cgroup missing');require(json.loads(lines.pop(0))=={'actual_memory_max':'17179869184','actual_memory_swap_max':'0'},'ASan observer differs')
  require(len(lines)==1,'Unexpected native correct log');payload=json.loads(lines[0]);require(payload=={k:j[k]for k in ['cases','lanes_per_side','RO_alias_cases','unwritten_frame_cells','failures']},'Actual oracle output differs')
  for n in [1,2]:
   summary=j['negative_controls'][n-1];require(summary==dict(kind='wrong-one'if n==1 else'wrong-both-same',exit_code=rec['wrong-'+str(n)]['exit_code'],oracle_rejected=True,log_sha256=rec['wrong-'+str(n)]['log_sha256']),'Negative control receipt/log/exit mismatch')
   r=rec['wrong-'+str(n)];out=checked_log(case,name,r);require(r['exit_code']==2 and 'mismatch'in out and not any(t in out for t in ['AddressSanitizer','LeakSanitizer','runtime error:']),'Negative control not semantic rejection');m=re.search(r'N=([0-9a-f]+) R=([0-9a-f]+) O=([0-9a-f]+)',out);require(m is not None,'Negative control witness absent')
   if n==2:require(m[1]==m[2]and m[1]!=m[3],'Both-wrong oracle control absent')
  require([x['kind']for x in j['negative_controls']]==['wrong-one','wrong-both-same']and all(x['oracle_rejected']for x in j['negative_controls']),'Negative controls incomplete')
  for r in j['records']:
   cmd=r['command']
   if san=='address'and r['label']!='compile':require(cmd[0]=='systemd-run'and'MemoryMax=17179869184'in cmd and'MemorySwapMax=0'in cmd,'Actual ASan limit command differs')
   else:require(cmd[:3]==['prlimit','--as=17179869184:17179869184','--'],'Finite native memory command absent')
  results.append(dict(path='proof/'+name,sha256=sha(p),cases=j['cases'],lanes_per_side=j['lanes_per_side'],public_mode_calls=2*j['cases'],scope='finite oracle/sanitizer regression; no formal proof credit'))
 return results
def audit_sdk(case):
 results=[]
 for side,name in [('rvv','rv64-buildability-status.json'),('neon','neon-front-buildability-status.json')]:
  p=local(case,'proof/'+name);require(p.read_bytes()==archive(case,name,'status.json').read_bytes(),'Archived SDK receipt differs');j=read(p);require(j['passed']is True and j['exit_code']==j['dependency_command_exit_code']==0,'SDK compilation failed');check_inputs(case,j['input_sha256']);require(j['runner_sha256']==sha(local(case,'proof/check_current_sdk.py')),'SDK runner changed')
  require('spec.c'in j['input_sha256']and('impl/testRVV.c'if side=='rvv'else'impl/testNEON.c')in j['input_sha256'],'SDK current main/caller absent');require(set(j['input_sha256'])=={x['source']for x in j['source_mapping']},'SDK source map incomplete')
  for row in j['source_mapping']:
   raw=local(case,row['source']).read_text();body=re.sub(r'^\s*#include[^\n]*\n','',raw,flags=re.M);require(row['source_sha256']==sha(local(case,row['source']))and row['included_source_sha256']==hashlib.sha256(body.encode()).hexdigest(),'SDK body changed');require(row['omitted_include_lines']==[l for l in raw.splitlines()if re.match(r'\s*#include\b',l)],'SDK include-only transform changed')
  require(sha(archive(case,name,'unit.c'))==j['generated_unit_sha256']and sha(archive(case,name,'compile.log'))==j['log_sha256'],'SDK archived unit/log drift');require(j['command'][:3]==['prlimit','--as=17179869184:17179869184','--']and sha(j['command'][3])==j['compiler_sha256'],'SDK compiler/profile drift')
  deps=archive(case,name,'dependencies.log').read_text().replace('\\\n',' ').split(':',1)[1];actual_deps={str(Path(n).resolve())for n in shlex.split(deps)};require(actual_deps==set(j['sdk_dependency_sha256'])and len(actual_deps)>=4,'SDK recursive header inventory incomplete');require(any(p.endswith('/arm_neon.h'if side=='neon'else'/riscv_vector.h')for p in actual_deps),'Real target SDK header missing')
  for path,h in j['sdk_dependency_sha256'].items():
   require(sha(archive(case,name,'unit.c')if Path(path)==Path(j['run_directory'])/'unit.c'else Path(path))==h,'SDK dependency changed '+path)
  results.append(dict(path='proof/'+name,sha256=sha(p),scope='real SDK compile only; no execution/ISA/ABI or formal proof credit'))
 return results
def audit_repair(case):
 p=local(case,'proof/repair.json');j=read(p);require(j.get('whole_kernel_verified')is False,'Repair record must not self-issue whole proof');rows=j['implementations'];require(set(rows)=={'neon','rvv'},'Repair sides incomplete')
 result={};originals=read(local(case,'proof/originals.json'));require(originals['catalog_sha256']==j['original_catalog_sha256'],'Historical catalog provenance differs');repo=next((p for p in case.parents if(p/'.git').exists()),None);require(repo is not None,'Case repository missing');catalog=read(repo/'verification/qcp/catalog.json');entries=[x for x in catalog['kernels']if x['name']=='f32-conv-hwc2chw'];require(len(entries)==1 and entries[0]['files']==originals['files'],'Current catalog original files differ');require({side:row['path']for side,row in originals['files'].items()}=={'neon':'kernels/source/f32-conv-hwc2chw.c','rvv':'kernels/target/f32-conv-hwc2chw.c'},'Noncanonical repository original paths')
 for side,row in rows.items():
  original=local(case,row['original_source']);origin=originals['files'][side];require(origin['sha256']==row['original_sha256']and sha(repo/origin['path'])==origin['sha256']and original.stat().st_size==origin['bytes'],'Repository original identity differs '+side);current=local(case,row['current_source']);patch=local(case,row['patch']);require(sha(original)==row['original_sha256']and sha(current)==row['current_sha256']and sha(patch)==row['patch_sha256'],'Repair ledger drift '+side)
  with tempfile.TemporaryDirectory(prefix='hwc-repair-')as folder:
   work=Path(folder);dest=work/row['current_source'];dest.parent.mkdir(parents=True);shutil.copyfile(original,dest)
   for reverse,expected in [(False,current),(True,original)]:
    cmd=['patch','--batch','--fuzz=0','--no-backup-if-mismatch','-p1',*(['-R']if reverse else[]),'-i',str(patch)];r=subprocess.run(cmd,cwd=work,capture_output=True,text=True,timeout=60);require(r.returncode==0 and not re.search('fuzz|offset|FAILED|reject',r.stdout+r.stderr,re.I),'Nonexact repair patch '+side);require(dest.read_bytes()==expected.read_bytes(),'Repair patch bytes differ '+side)
  result[side]=dict(row,forward_reverse_zero_fuzz=True)
 check_inputs(case,j['supporting_source_sha256'])
 originals_map={row['current_source']:row['original_sha256']for row in rows.values()}
 current_map={row['current_source']:row['current_sha256']for row in rows.values()}
 for key in ['repair_patch','bundle_patch']:
  patch=local(case,j[key]);require(sha(patch)==j[key+'_sha256'],'Combined/bundle patch SHA drift')
  wanted=dict(current_map,**(j['supporting_source_sha256']if key=='bundle_patch'else{}))
  with tempfile.TemporaryDirectory(prefix='hwc-complete-repair-')as folder:
   work=Path(folder)
   for row in rows.values():
    dest=work/row['current_source'];dest.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(local(case,row['original_source']),dest)
   for reverse,expected in [(False,wanted),(True,originals_map)]:
    cmd=['patch','--batch','--fuzz=0','--no-backup-if-mismatch','-p1',*(['-R']if reverse else[]),'-i',str(patch)];r=subprocess.run(cmd,cwd=work,capture_output=True,text=True,timeout=60);require(r.returncode==0 and not re.search('fuzz|offset|FAILED|reject',r.stdout+r.stderr,re.I),'Nonexact bundle patch');actual={str(p.relative_to(work)):sha(p)for p in work.rglob('*')if p.is_file()};require(actual==expected,'Full patch inventory differs '+key)
 return dict(path='proof/repair.json',sha256=sha(p),variant=j['variant'],implementations=result,repository_originals={r['path']:r['sha256']for r in originals['files'].values()},combined_and_bundle_zero_fuzz_exact=True)
def audit_counterexample(case):
 name='original-native-counterexample-status.json';p=local(case,'proof/'+name);require(p.read_bytes()==archive(case,name,'status.json').read_bytes(),'Archived original CE receipt differs');j=read(p);require(j['passed']is True and j['original_counterexample']is True and j['original_rvv']is True,'Original counterexample missing');rec={r['label']:r for r in j['records']};require(set(rec)=={'compile','correct'}and rec['compile']['exit_code']==0 and rec['correct']['exit_code']==2,'Original CE execution differs');checked_log(case,name,rec['compile']);out=checked_log(case,name,rec['correct']);require('mismatch'in out and 'N=7fc00000 R=c0000000 O=7fc00000'in out,'Original actual NaN witness differs')
 for n,h in j['input_sha256'].items():require(sha(local(case,'proof/evidence/runtime/'+Path(name).stem+'/source-snapshot/'+n))==h,'Original CE source snapshot drift '+n)
 require(j['input_sha256']['proof/original/testRVV.c']==sha(local(case,'proof/original/testRVV.c')),'CE original RVV differs');require(j['input_sha256']['impl/testNEON.c']==sha(local(case,'proof/original/testNEON.c')),'CE original NEON differs')
 recursive=j['actual_recursive_local_input_sha256'];require(len(recursive)==j['actual_recursive_local_input_count'],'Original CE recursive count differs');require({'impl/testNEON.c','proof/original/testRVV.c','proof/native/harness.c'}<=set(recursive),'Original actual main bodies absent')
 for n,h in recursive.items():require(j['input_sha256'].get(n)==h,'Original CE recursive source SHA differs')
 root=Path(j['run_directory'])/'case';dep=archive(case,name,'dependencies.mk').read_text().replace('\\\n',' ').split(':',1)[1].split();require({str(Path(n).resolve().relative_to(root.resolve()))for n in dep}==set(recursive),'Original CE actual dependency output differs');require('-DHWC_ORIGINAL_RVV'in rec['compile']['command']and str(root/'proof/native/harness.c')in rec['compile']['command'],'Original CE actual compiler input differs')
 return dict(path='proof/'+name,sha256=sha(p),original_counterexample_observed=True,scope='finite original-source witness, not physical ISA execution')
def audit_package(case):
 case=Path(case).resolve();native=audit_native(case);sdk=audit_sdk(case);repair=audit_repair(case);ce=audit_counterexample(case)
 return dict(passed=True,formal_proof_replayed=False,whole_kernel_verified=False,native_statuses=native,sdk_statuses=sdk,implementations=repair['implementations'],repair=repair,counterexample=ce,intrinsic_spec_body_credit=False,human_intrinsic_review='pending',ISA_ABI_compiler_refinement=False,termination_proved=False)
