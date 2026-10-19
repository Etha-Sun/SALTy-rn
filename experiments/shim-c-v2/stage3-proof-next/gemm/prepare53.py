from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate50';new=H/'candidate53';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_memory.c';s=p.read_text();import re
for fn,n,arg in [('vld1_f32',2,'p[{j}]'),('vdupq_n_f32',4,'x'),('vdupq_lane_f32',4,'v.lane[lane]')]:
 needle=('float32x2_t ' if fn=='vld1_f32' else 'float32x4_t ')+fn+'(';assert s.count(needle)==1;pos=s.index(needle);end=s.rfind('*/',0,pos);assert s[end+2:pos].strip()==''
 extra=''.join(' ensures next_'+fn+'_fixed_'+str(j)+': ext_same(\\result.lane['+str(j)+'],'+arg.format(j=j)+');' for j in range(n))
 s=s[:end]+extra+' '+s[end:]
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Retain all original contracts; append ten scalar ensures to real vld1_f32, vdupq_n_f32 and vdupq_lane_f32, all requiring full body proof. No requires or C/spec change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
