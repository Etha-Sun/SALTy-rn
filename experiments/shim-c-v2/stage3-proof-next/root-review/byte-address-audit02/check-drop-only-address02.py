from pathlib import Path
import importlib.util,json,hashlib,subprocess,time,re
D=Path(__file__).resolve().parent;R=D.parents[4];H=R/'experiments/shim-c-v2/stage3-byte-fp-front-v35';sp=importlib.util.spec_from_file_location('slice35',H/'sliced-z3-adapter.py');mod=importlib.util.module_from_spec(sp);sp.loader.exec_module(mod)
mod.KEEP = {'H','addr_of_null','addr_of_int_bijection','valid_pointers_are_statically_allocated','valid_rw_rd',"statically_allocated'def","is_uint64'def"}
L=D/'drop-only-address02';L.mkdir();chosen={}
for p in sorted((H/'qualification01/z3-adapter-evidence').glob('*/original.smt2')):
 s=p.read_text()
 if '(assert (valid_rw t a 4))' not in s:continue
 reduced,removed,goal=mod.slice_task(s,False,True)
 if 'addr_of_int' not in goal:continue
 key=hashlib.sha256(goal.encode()).hexdigest()
 chosen.setdefault(key,(p,s,reduced,removed,goal))
records=[]
for i,(key,(source,original,reduced,removed,goal)) in enumerate(chosen.items()):
 O=L/str(i);O.mkdir();(O/'original.smt2').write_text(original);(O/'subset.smt2').write_text(reduced);spans=list(mod.scan.commands(reduced));newgoal=[reduced[a:b] for a,b in spans if re.match(r'\(\s*assert\b',reduced[a:b])][-1];assert goal==newgoal
 cmd=[str(H.parent/'handoff-solvers/.build/bin/z3'),'-T:10',str(O/'subset.smt2')];t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,timeout=30);(O/'stdout.txt').write_text(r.stdout);(O/'stderr.txt').write_text(r.stderr);record={'source':str(source.relative_to(R)),'original_sha256':hashlib.sha256(original.encode()).hexdigest(),'subset_sha256':hashlib.sha256(reduced.encode()).hexdigest(),'goal_sha256':key,'goal_byte_identical':True,'removed_assertions':removed,'command':cmd,'exit':r.returncode,'stdout':r.stdout,'seconds':time.monotonic()-t,'scope':'Same-goal assumption subset only. UNSAT supports this exact VC; not a Frama-C raw acceptance or environment qualification.'};(O/'result.json').write_text(json.dumps(record,indent=2)+'\n');records.append({k:v for k,v in record.items() if k!='removed_assertions'});print(i,r.stdout.strip(),flush=True)
(L/'result.json').write_text(json.dumps({'tasks':records,'qualified':False,'whole_kernel_accepted':False},indent=2)+'\n')
