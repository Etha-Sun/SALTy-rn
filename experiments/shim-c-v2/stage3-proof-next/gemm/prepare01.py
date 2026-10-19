from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys
R=Path(__file__).resolve().parents[4];H=Path(__file__).resolve().parent;old=R/'experiments/shim-c-v2/stage3-gemm/f32-gemm-minmax-r4';new=H/'candidate01';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='gemm-next-',dir='/tmp'));plain={}
for n,v in m['files'].items():
 p=R/v['path'];assert sha(p)==v['sha256'];plain[n]=p.read_text();(tmp/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=tmp,capture_output=True,check=True)
p=tmp/'fp_primitives.h';s=p.read_text();i=s.rfind('#endif');s=s[:i]+r'''/*@ lemma next_gacc_two{L}: \forall float *a,*w; \forall integer row,block,lane,t,K;
 0<=t ==> ext_same(stage3_gacc(a,w,row,block,lane,t+2,K),
 shim_fma32(a[row*K+t+1],w[block*(8+8*K)+8+8*(t+1)+lane],
 shim_fma32(a[row*K+t],w[block*(8+8*K)+8+8*t+lane],stage3_gacc(a,w,row,block,lane,t,K)))); */
'''+s[i:];p.write_text(s)
p=tmp/'neon.c';s=p.read_text();anchor='      const float32x4_t va0c0 = vdupq_lane_f32(va0, 0);';assert s.count(anchor)==1
s=s.replace(anchor,r'''      /*@ assert next_a_load: \forall integer j;0<=j<2 ==> ext_same(va0.lane[j],\at(A0[(KC-k)/4+j],Stage3Block));
          assert next_b0_load: \forall integer j;0<=j<4 ==> ext_same(vb0123c0.lane[j],\at(W0[((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4)+j],Stage3Block));
          assert next_b1_load: \forall integer j;0<=j<4 ==> ext_same(vb0123c1.lane[j],\at(W0[((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+1)+j],Stage3Block)); */
'''+anchor)
for call,tag,step in [('      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);','next_acc_first',1),('      vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1);','next_acc_second',2),('      vacc3x1 = vfmaq_f32(vacc3x1, va3c1, vb4567c1);','next_acc_frame',2)]:
 assert s.count(call)==1;s=s.replace(call,call+'\n'+f'      /*@ assert {tag}: \\forall integer j;0<=j<4 ==> ext_same(vacc0x0.lane[j],stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,j,(KC-k)/4+{step},KC/4)); */')
p.write_text(s);diff=[]
for n in m['files']:
 for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(diff));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3'].update(previous_candidate_frozen_sha256=sha(old/'frozen.json'),proof_sha256=sha(new/'proof.patch'));m['proof_next']={'base':str(old.relative_to(R)),'base_frozen_sha256':sha(old/'frozen.json'),'base_proof_sha256':sha(old/'proof.patch'),'revision':'NEON first row/half explicit two-FMA prefix checkpoints and proved two-step recursive expansion; no C/spec/precondition/model changes.'};(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');print('candidate01 source guard',g['passed'])
