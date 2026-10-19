from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys,re
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();sys.path.insert(0,str(ROOT/'tools'));import shim_c_campaign_closure as c
for name in ['f32-gemm-minmax','f32-igemm-minmax','qd8-f32-qc4w-gemm-minmax']:
 old=HERE/(name+'-r1');new=HERE/(name+'-r2');new.mkdir();m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='stage3-refine-',dir='/tmp'));plain={}
 for n,v in m['files'].items():plain[n]=(ROOT/v['path']).read_text();(tmp/n).write_text(plain[n])
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=tmp,capture_output=True,check=True)
 p=tmp/'fp_primitives.h';s=p.read_text();lemma_names=[]
 if name=='f32-gemm-minmax':
  extra=r'''
/*@ lemma stage3_gacc_seed{L}: \forall float *a,*w; \forall integer row,block,lane,K;
 ext_same(stage3_gacc(a,w,row,block,lane,0,K),w[block*(8+8*K)+lane]);
 lemma stage3_gacc_step{L}: \forall float *a,*w; \forall integer row,block,lane,t,K;
 0<=t ==> ext_same(stage3_gacc(a,w,row,block,lane,t+1,K),shim_fma32(a[row*K+t],w[block*(8+8*K)+8+8*t+lane],stage3_gacc(a,w,row,block,lane,t,K))); */
''';lemma_names=['stage3_gacc_seed','stage3_gacc_step']
 elif name=='f32-igemm-minmax':
  extra=r'''
/*@ lemma stage3_iacc_seed{L}: \forall float **a,*w; \forall integer block,lane,K,P;
 ext_same(stage3_iacc(a,w,block,lane,0,K,P),w[block*(8+8*K*P)+lane]);
 lemma stage3_iacc_step{L}: \forall float **a,*w; \forall integer block,lane,t,K,P;
 0<=t && 0<K ==> ext_same(stage3_iacc(a,w,block,lane,t+1,K,P),shim_fma32(a[t/K][t%K],w[block*(8+8*K*P)+8+8*t+lane],stage3_iacc(a,w,block,lane,t,K,P))); */
''';lemma_names=['stage3_iacc_seed','stage3_iacc_step']
 else:
  extra='';p2=tmp/'quantized.c';q=p2.read_text();q=q.replace('int8_t bits_i8(uint8_t u)',r'/*@ assigns \nothing; ensures \result==(int8_t)u; */'+'\nint8_t bits_i8(uint8_t u)')
  definitions=[('__riscv_vsll_vx_i8m2','vint8m2_t','vint8m2_t a,unsigned n,size_t vl','n<8','(int8_t)((uint8_t)\\at(a.lane[j],Pre)<<n)','a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n))'),('__riscv_vand_vx_i8m2','vint8m2_t','vint8m2_t a,int8_t x,size_t vl',None,'(int8_t)((uint8_t)\\at(a.lane[j],Pre)&(uint8_t)x)','a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)x)')]
  for f,typ,args,req,val,body in definitions:
   oldline=f'{typ} {f}({args}) {{ for(size_t i=0;i<vl;i++){body};return a; }}';assert oldline in q
   newtext=f'/*@ requires vl<=32; '+(f'requires {req}; ' if req else '')+f'assigns \\nothing; ensures \\forall integer j;0<=j<vl ==> \\result.lane[j]=={val}; */\n'
   newtext+=f'{typ} {f}({args}) {{ /*@ loop invariant 0<=i<=vl; loop invariant \\forall integer j;0<=j<i ==> a.lane[j]=={val}; loop invariant \\forall integer j;i<=j<32 ==> a.lane[j]==\\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++){body};return a; }}';q=q.replace(oldline,newtext)
  for f,typ,argtyp,cap,expr in [('__riscv_vle8_v_i8m2','vint8m2_t','const int8_t *p,size_t vl',32,'p[j]'),('__riscv_vsext_vf2_i16m4','vint16m4_t','vint8m2_t a,size_t vl',32,'a.lane[j]')]:
   pattern=rf'{typ} {f}\({re.escape(argtyp)}\) \{{ ([^\n]+) \}}';mt=re.search(pattern,q);assert mt
   body=mt[1];contract=f'/*@ requires vl<={cap}; '+('requires \\valid_read(p+(0..vl-1)); ' if '*p' in argtyp else '')+f'assigns \\nothing; ensures \\forall integer j;0<=j<vl ==> \\result.lane[j]=={expr}; */\n'
   inv=f'/*@ loop invariant 0<=i<=vl; loop invariant \\forall integer j;0<=j<i ==> r.lane[j]=={expr}; loop assigns i,r; loop variant vl-i; */'
   body=body.replace('for(size_t i=0;i<vl;i++)',inv+'for(size_t i=0;i<vl;i++)');q=q[:mt.start()]+contract+f'{typ} {f}({argtyp}) {{ '+body+' }'+q[mt.end():]
  p2.write_text(q)
 extra+=r'''
/*@ \wp::strategy Stage3Child: \prover("cvc5",10), \prover("z3",10);
    \wp::strategy Stage3Array: \tactic("Wp.array",\ingoal(A[I[V]][J]),\children(Stage3Child)), Stage3Child;
    \wp::proof Stage3Array: equivalent'''+(' ,'+','.join(lemma_names) if lemma_names else ', bits_i8, __riscv_vsll_vx_i8m2, __riscv_vand_vx_i8m2, __riscv_vle8_v_i8m2, __riscv_vsext_vf2_i16m4')+'; */\n'
 j=s.rindex('#endif');s=s[:j]+extra+s[j:];p.write_text(s);diff=[]
 for n in m['files']:
  for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
 (new/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(ROOT));m['proof_patches']=[str((new/'proof.patch').relative_to(ROOT))];m['wp_provers']='tip,z3,cvc5';m['wp_budget']=1200;m['stage3'].update(previous_candidate_frozen_sha256=sha(old/'frozen.json'),proof_sha256=sha(new/'proof.patch'),fix='Expose and check recursive seed/step lemmas plus checked array strategy; qc4w also contracts actual byte/shift/and/load/extend bodies.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=c.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');print(name,'r2',g['passed'])
s=(HERE/'run-r1.py').read_text().replace('-r1','-r2').replace("'z3,cvc5','-wp-par'","'tip,z3,cvc5','-wp-par'").replace("budget=540;run='full01-launch'","budget=1500;run='full01-launch'")
(HERE/'run-r2.py').write_text(s)
