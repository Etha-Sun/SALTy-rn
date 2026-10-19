from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate09';new=H/'candidate17';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
pred=r"""/*@ predicate next_vec2_read{L}(float32x2_t v,float *a,integer t) =
  \forall integer j;0<=j<2 ==> ext_same(v.lane[j],a[t+j]);
 predicate next_vec4_splat(float32x4_t v,float x) =
  \forall integer j;0<=j<4 ==> ext_same(v.lane[j],x);
 predicate next_vec4_acc{L}(float32x4_t v,float *a,float *w,integer b,integer t,integer K) =
  \forall integer j;0<=j<4 ==> ext_same(v.lane[j],stage3_gacc{L}(a,w,0,b,j,t,K));
*/

"""
s=s.replace('void test_neon(',pred+'void test_neon(',1)
anchor='        loop invariant stage3_acc_neon_0_0:'
ann=r"""        loop invariant next_acc_aggregate: next_vec4_acc{Stage3Block}(vacc0x0,A0,W0,(NC-nc)/8,(KC-k)/4,KC/4);
"""
assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor)
anchor='      /*@ assert next_a_load:'
ann=r"""      /*@ assert next_a_aggregate: next_vec2_read{Stage3Block}(va0,A0,(KC-k)/4); */
"""
assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor)
for i in range(2):
 anchor=f'      const float32x4_t va0c{i} = vdupq_lane_f32(va0, {i});'
 ann=f'\n      /*@ assert next_dup_current_{i}: next_vec4_splat(va0c{i},va0.lane[{i}]); */\n      /*@ assert next_dup_ref_{i}: next_vec4_splat(va0c{i},next_read{{Stage3Block}}(A0,(KC-k)/4+{i})); */'
 assert s.count(anchor)==1;s=s.replace(anchor,anchor+ann)
 anchor=f'      vacc0x0 = vfmaq_f32(vacc0x0, va0c{i}, vb0123c{i});'
 before=f'      /*@ assert next_acc_before_{i}: next_vec4_acc{{Stage3Block}}(vacc0x0,A0,W0,(NC-nc)/8,(KC-k)/4+{i},KC/4); */\n'
 after=f'\n      /*@ assert next_acc_after_{i}: next_vec4_acc{{Stage3Block}}(vacc0x0,A0,W0,(NC-nc)/8,(KC-k)/4+{i+1},KC/4); */'
 assert s.count(anchor)==1;s=s.replace(anchor,before+anchor+after)
p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Defined aggregate predicates retain typed struct projections for first row accumulation and two vdup returns; original forall invariants/cuts retained. Every new cut and aggregate loop establishment/preservation is proof debt.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
