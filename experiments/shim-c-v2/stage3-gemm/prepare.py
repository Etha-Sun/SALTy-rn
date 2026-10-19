from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys
ROOT=Path(__file__).resolve().parents[3]; HERE=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
# Independent copy changes concurrency only; original checker remains frozen.
original=ROOT/'tools/shim_c_campaign_v4.py'; runner=HERE/'serial-v4.py'
s=original.read_text();needle='    command = list(command)\n';assert s.count(needle)==1
s=s.replace(needle,needle+'    command[command.index("-wp-par") + 1] = "1"\n');runner.write_text(s)
(HERE/'checker-delta.json').write_text(json.dumps({'base':str(original.relative_to(ROOT)),'base_sha256':sha(original),'copy_sha256':sha(runner),'only_change':'Force wp-par=1 before pinned command/control/global/body execution; import via PYTHONPATH=tools. No proof/coverage semantics changed.'},indent=2)+'\n')
for name in ['f32-gemm-minmax','f32-igemm-minmax','qd8-f32-qc4w-gemm-minmax']:
 old=ROOT/'experiments/shim-c-v2/v4-campaign'/name; case=HERE/name;case.mkdir(exist_ok=False); m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='stage3-gemm-',dir='/tmp'));plain={}
 for n,v in m['files'].items():
  src=ROOT/v['path'];assert sha(src)==v['sha256'],str(src);plain[n]=src.read_text();(tmp/n).write_text(plain[n])
 for patch in m['proof_patches']:subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(ROOT/patch)],cwd=tmp,capture_output=True,check=True)
 if name=='f32-gemm-minmax':
  p=tmp/'fp_primitives.h';s=p.read_text();s+='''\n/*@ logic float stage3_gacc{L}(const float *a,const float *w,integer row,integer block,integer lane,integer t,integer K) =
 t<=0 ? w[block*(8+8*K)+lane] : shim_fma32(a[row*K+t-1],w[block*(8+8*K)+8+8*(t-1)+lane],stage3_gacc(a,w,row,block,lane,t-1,K)); */\n''';p.write_text(s)
  for file in ['neon.c','rvv.c']:
   p=tmp/file;s=p.read_text();at='        loop assigns k,a0,a1,a2,a3,w,';assert s.count(at)==1
   inv=''
   for row,ridx in [(0,'0'),(1,'(mr<2?0:1)'),(2,'(mr<=2?mr-1:2)'),(3,'(mr==4?3:mr-1)')]:
    for half in (range(2) if file=='neon.c' else range(1)):
     vector=f'vacc{row}x{half}' if file=='neon.c' else f'vacc{row}';bound='4' if file=='neon.c' else 'vl';lane=f'{4*half}+j' if file=='neon.c' else 'j'
     inv+=f'        loop invariant stage3_acc_{file[:-2]}_{row}_{half}: \\forall integer j; 0<=j<{bound} ==> ext_same({vector}.lane[j],stage3_gacc(A0,W0,{ridx},(NC-nc)/8,{lane},(KC-k)/4,KC/4));\n'
   s=s.replace(at,inv+at);p.write_text(s)
 elif name=='f32-igemm-minmax':
  p=tmp/'fp_primitives.h';s=p.read_text();s+='''\n/*@ logic float stage3_iacc{L}(const float **a,const float *w,integer block,integer lane,integer t,integer K,integer P) =
 t<=0 ? w[block*(8+8*K*P)+lane] : shim_fma32(a[(t-1)/K][(t-1)%K],w[block*(8+8*K*P)+8+8*(t-1)+lane],stage3_iacc(a,w,block,lane,t-1,K,P)); */\n''';p.write_text(s)
  for file in ['neon.c','rvv.c']:
   p=tmp/file;s=p.read_text();s=s.replace('  float* c0 = c;','''  //@ ghost size_t NC=nc,KC=kc,KS=ks;
  //@ ghost const float **A=a;
  //@ ghost const float *W=w;
  //@ ghost float *C=c;
  float* c0 = c;''')
   s=s.replace('  do {','''  /*@ loop invariant stage3_nc: 0<nc<=NC && (NC-nc)%8==0;
      loop invariant a==A;
      loop invariant c0==C+(NC-nc);
      loop invariant w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)));
      loop assigns nc,a,w,c0,C[0..NC-1],errno; loop variant nc; */
  do {''',1)
   inv='''    /*@ loop invariant stage3_positions: 0<p<=KS && p%sizeof(void*)==0;
        loop invariant a==A+(KS-p)/sizeof(void*);
        loop invariant w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)))+8+8*((KS-p)/sizeof(void*))*(KC/4);
'''
   for half in (range(2) if file=='neon.c' else range(1)):
    vector=f'vacc0x{half}' if file=='neon.c' else 'vacc';bound='4' if file=='neon.c' else 'vl';lane=f'{4*half}+j' if file=='neon.c' else 'j'
    inv+=f'        loop invariant stage3_position_acc_{file[:-2]}_{half}: \\forall integer j;0<=j<{bound} ==> ext_same({vector}.lane[j],stage3_iacc(A,W,(NC-nc)/8,{lane},((KS-p)/sizeof(void*))*(KC/4),KC/4,KS/sizeof(void*)));\n'
   vectors='vacc0x0,vacc0x1' if file=='neon.c' else 'vacc'
   inv+=f'        loop assigns p,a,w,{vectors},errno; loop variant p; */\n'
   s=s.replace('    do {',inv+'    do {',1)
   inner='''      //@ ghost const float *stage3_row=a0;
      //@ ghost const float *stage3_weights=w;
      /*@ loop invariant stage3_k: 0<=k<=KC && k%4==0;
          loop invariant a0==stage3_row+(KC-k)/4;
          loop invariant w==stage3_weights+8*((KC-k)/4);
'''
   for half in (range(2) if file=='neon.c' else range(1)):
    vector=f'vacc0x{half}' if file=='neon.c' else 'vacc';bound='4' if file=='neon.c' else 'vl';lane=f'{4*half}+j' if file=='neon.c' else 'j'
    inner+=f'          loop invariant stage3_inner_acc_{file[:-2]}_{half}: \\forall integer j;0<=j<{bound} ==> ext_same({vector}.lane[j],stage3_iacc(A,W,(NC-nc)/8,{lane},((KS-p)/sizeof(void*))*(KC/4)+(KC-k)/4,KC/4,KS/sizeof(void*)));\n'
   inner+=f'          loop assigns k,a0,w,{vectors},errno; loop variant k; */\n'
   needle='      for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {' if file=='neon.c' else '      while (k > 0) {'
   assert s.count(needle)==1;s=s.replace(needle,inner+needle);p.write_text(s)
 else:
  p=tmp/'fp_primitives.h';s=p.read_text();s+='\n/*@ logic integer stage3_signed_nibble(integer u)=u<8?u:u-16; */\n';p.write_text(s)
  for file in ['neon.c','rvv.c']:
   p=tmp/file;s=p.read_text();s=s.replace('  kc = round_up_po2(kc, 2);','''  kc = round_up_po2(kc, 2);
  //@ ghost size_t NC=nc,KC=kc;
  //@ ghost const int8_t *A=a;
  //@ ghost float *C=c;''');s=s.replace('  do {','''  /*@ loop invariant stage3_nc: 0<nc<=NC && (NC-nc)%16==0;
      loop invariant stage3_even_kc: 0<KC && KC%2==0 && kc==KC;
      loop invariant a0==A;
      loop invariant c0==C+(NC-nc);
      loop assigns nc,a0,c0,w,C[0..NC-1],errno; loop variant nc; */
  do {''',1)
   vectors='vacc0x0123,vacc0x4567,vacc0x89AB,vacc0xCDEF' if file=='neon.c' else 'vacc'
   needle='    while (k >= 8 * sizeof(int8_t)) {' if file=='neon.c' else '    while (k > 0) {'
   assert s.count(needle)==1;s=s.replace(needle,f'''    //@ ghost const unsigned char *stage3_weights=(const unsigned char*)w;
    /*@ loop invariant stage3_k: 0<=k<=KC && k%2==0;
        loop invariant stage3_input_cursor: a0==A+(KC-k);
        loop invariant stage3_weight_cursor: (const unsigned char*)w==stage3_weights+8*(KC-k);
        loop assigns k,a0,w,{vectors}; loop variant k; */
'''+needle)
   if file=='rvv.c':
    needle='      vint16m4_t vxb_c0 = __riscv_vsext_vf2_i16m4(vb_c0, vl);'
    s=s.replace(needle,'''      /*@ assert stage3_low_nibble: \\forall integer j;0<=j<vl ==> vb_c0.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]%16); */
      /*@ assert stage3_high_nibble: \\forall integer j;0<=j<vl ==> vb_c1.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]/16); */
'''+needle)
   p.write_text(s)
 diff=[]
 for n in m['files']:
  for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
 (case/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(ROOT));m['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))]
 m['files']['model_runner.py']={'path':str(runner.relative_to(ROOT)),'sha256':sha(runner)};lock=ROOT/'experiments/shim-c-v2/handoff-model-plus/float_model_lock.json';m['files']['float_model_lock.json']={'path':str(lock.relative_to(ROOT)),'sha256':sha(lock)}
 m.update(wp_share='experiments/shim-c-v2/handoff-model-plus/wp-share',wp_why3_config='experiments/shim-c-v2/handoff-model-front/why3.conf',wp_budget=300,wp_timeout=10,wp_provers='z3,cvc5')
 m['stage3']={'previous_frozen_sha256':sha(old/'frozen.json'),'previous_proof_sha256':sha(ROOT/json.loads((old/'frozen.json').read_text())['proof_patches'][0]),'proof_sha256':sha(case/'proof.patch'),'environment_evidence':'experiments/shim-c-v2/handoff-plus-evidence/summary.json','implementation_and_public_spec_changes':False,'checker_change':'Independent serial copy: wp-par=1 only.'};(case/'frozen.json').write_text(json.dumps(m,indent=2)+'\n')
 print(name,sha(case/'frozen.json'))
