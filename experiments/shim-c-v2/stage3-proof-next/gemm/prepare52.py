from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate50';new=H/'candidate52';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
import re
for fname,typ,count,tag in [('vld1_f32','float32x2_t',2,'next_a_load_fixed'),('vdupq_n_f32','float32x4_t',4,'next_a_dup_n_fixed'),('vdupq_lane_f32','float32x4_t',4,'next_a_dup_fixed')]:
 matches=[]
 for p in t.glob('*.c'):
  s=p.read_text();match=re.search(r'\b'+typ+r'\s+'+fname+r'\s*\(([^)]*)\)\s*\{',s)
  if match:matches.append((p,s,match))
 assert len(matches)==1,(fname,len(matches));p,s,match=matches[0];args=match.group(1).split(',');names=[re.search(r'([A-Za-z_]\w*)\s*$',x).group(1) for x in args]
 def rhs(j):
  if fname=='vld1_f32':return names[0]+'['+str(j)+']'
  if fname=='vdupq_n_f32':return names[0]
  return names[0]+'.lane['+names[1]+']'
 close=s.rfind('*/',0,match.start());assert close>=0
 posts=''.join(' ensures '+tag+'_'+str(j)+': ext_same(\\result.lane['+str(j)+'],'+rhs(j)+');' for j in range(count))
 s=s[:close]+posts+' '+s[close:];p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Append two scalar lane posts to actual vld1_f32, four to actual vdupq_n_f32, four to actual vdupq_lane_f32. Preserve all original contracts and ordinary bodies; fully verify all three callees including original RTE/frame/post obligations. No new caller seed, requires or FMA helper.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
