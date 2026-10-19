from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate04';new=H/'candidate05';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
anchors=['      const float32x2_t va0 = vld1_f32(a0); a0 += 2;','      const float32x2_t va1 = vld1_f32(a1); a1 += 2;','      const float32x2_t va2 = vld1_f32(a2); a2 += 2;','      const float32x2_t va3 = vld1_f32(a3); a3 += 2;','      const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;','      const float32x4_t vb4567c0 = vld1q_f32(w); w += 4;']
for i,anchor in enumerate(anchors):
 assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n'+f'      /*@ assert next_w_frame_{i}: \\forall integer q; 0<=q<((NC+7)/8)*(8+8*(KC/4)) ==> ext_same(W0[q],next_read{{Stage3Block}}(W0,q)); */')
p.write_text(s)
p=t/'fp_primitives.h';s=p.read_text();i=s.rfind('#endif');s=s[:i]+r'''/*@ lemma next_packed_bound: \forall integer N,n,K,t,j;
 0<n<=N && 0<=t<K && 0<=j<8 ==>
 0<=((N-n)/8)*(8+8*K)+8+8*t+j<((N+7)/8)*(8+8*K);
 lemma next_gacc_substitute{L}: \forall float *a,*w; \forall integer row,block,lane,t,K; \forall float x,y,z;
 0<=t && ext_same(x,a[row*K+t]) && ext_same(y,w[block*(8+8*K)+8+8*t+lane]) && ext_same(z,stage3_gacc(a,w,row,block,lane,t,K)) ==>
 ext_same(shim_fma32(x,y,z),stage3_gacc(a,w,row,block,lane,t+1,K)); */
'''+s[i:];p.write_text(s);
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Split read-only packed-weight frame after each relevant load; add checked packed-index range and one-FMA recurrence substitution lemmas. All added assertions/lemmas remain selected proof obligations.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
