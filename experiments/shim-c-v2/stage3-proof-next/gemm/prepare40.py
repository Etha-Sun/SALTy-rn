from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate39';new=H/'candidate40';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
helper='/*@\n'+''.join(' logic float next_pointer_lane_'+str(j)+'(float32x4_t v) = v.lane['+str(j)+'];\n' for j in range(4))+'*/\n/*@ ghost\n /@ assigns \\nothing;\n'+''.join('    ensures next_pointer_projection_'+str(j)+': \\valid_read(p) ==> ext_same(p->lane['+str(j)+'],next_pointer_lane_'+str(j)+'(*p));\n' for j in range(4))+' @/\n static void next_pointer_project(const float32x4_t *p) {}\n*/\n'
needle='void test_neon(';assert s.count(needle)==1;s=s.replace(needle,helper+'\n'+needle)
needle='      /*@ assert next_acc_entry:';assert s.count(needle)==1;s=s.replace(needle,'      /*@ assert next_pointer_valid: \\valid_read(&vacc0x0); */\n      /*@ ghost next_pointer_project(&vacc0x0); */\n'+needle);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Pointer-to-record four-lane body projection instantiation at real loop entry, conditional valid ensures only; no requires. Helper postconditions, local validity, caller assigns and old kernel targets remain obligations.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
