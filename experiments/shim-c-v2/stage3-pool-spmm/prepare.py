from pathlib import Path
import json,hashlib,subprocess,shutil,difflib,sys
ROOT=Path(__file__).resolve().parents[3]; HERE=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for kernel in ('f32-maxpool','f32-argmaxpool','f32-spmm-minmax'):
 old=ROOT/'experiments/shim-c-v2/v4-campaign'/kernel
 case=HERE/kernel;case.mkdir()
 data=json.loads((old/'frozen.json').read_text());plain=case/'.build/edit/plain';ann=case/'.build/edit/annotated';plain.mkdir(parents=True)
 for name,entry in data['files'].items():
  source=ROOT/entry['path'];assert sha(source)==entry['sha256'];shutil.copyfile(source,plain/name)
 shutil.copytree(plain,ann)
 for patch in data['proof_patches']:subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(ROOT/patch)],cwd=ann,check=True,capture_output=True)
 p=ann/'rvv.c';s=p.read_text()
 if kernel in ('f32-maxpool','f32-argmaxpool'):
  import re
  def channels(m):
   indent=m[1];extra='i,current_ab,current_ib,' if kernel=='f32-argmaxpool' else ''
   fields='c,o,'+extra+','.join('i'+str(j) for j in range(9))+',output[0..channels-1]'
   if kernel=='f32-argmaxpool':fields+=',index[0..channels-1]'
   pre=''.join(indent+'//@ ghost const float *stage3_base'+str(j)+'=i'+str(j)+';\n' for j in range(9))
   inv=indent+'/*@ loop invariant stage3_channel_bounds: 0<=c<=channels;\n'+indent+'    loop invariant stage3_output_cursor: o==output+(channels-c);\n'
   if kernel=='f32-argmaxpool':inv+=indent+'    loop invariant stage3_index_cursor: i==index+(channels-c);\n'
   for j in range(9):inv+=indent+'    loop invariant stage3_input_cursor: i'+str(j)+'==stage3_base'+str(j)+'+(channels-c);\n'
   return pre+inv+indent+'    loop assigns '+fields+';\n'+indent+'    loop variant c; */\n'+indent+'while (c > 0) {'
  s=re.sub(r'(?m)^( +)while \(c > 0\) \{',channels,s)
  if kernel=='f32-argmaxpool':
   s=s.replace('    for (; k > 0; k -= 9) {','''    /*@ loop invariant stage3_group_count: -8<=k<=(integer)pooling_elements;
        loop invariant stage3_group_index: (integer)idx0==(integer)pooling_elements-k;
        loop variant k; */
    for (; k > 0; k -= 9) {''')
  else:
   s=s.replace('    for (int k = (int) kernel_elements - 9; k > 0; k -= 9) {','''    /*@ loop invariant stage3_group_count: -8<=k<=(integer)kernel_elements-9;
        loop variant k; */
    for (int k = (int) kernel_elements - 9; k > 0; k -= 9) {''')
 else:
  s=s.replace('  while (m > 0) {','''  /*@ loop invariant stage3_strip_bounds: 0<=m<=mc/sizeof(float);
      loop variant m; */
  while (m > 0) {''')
  s=s.replace('    do {\n      uint32_t nnz', '''    /*@ loop invariant stage3_column_bounds: 1<=n<=nc;
        loop invariant stage3_nnz_cursor: nnzmap==nidx_nnzmap+(nc-n);
        loop invariant stage3_weight_cursor: w==weights+(nc-n)+prefix_nnz(nidx_nnzmap,nc-n);
        loop invariant stage3_delta_cursor: dmap==widx_dmap+prefix_nnz(nidx_nnzmap,nc-n);
        loop variant n; */
    do {\n      uint32_t nnz''')
  s=s.replace('      if (nnz != 0) {\n        do {','''      //@ ghost uint32_t stage3_nnz0=nnz;
      //@ ghost const float *stage3_w=w;
      //@ ghost const int32_t *stage3_dmap=dmap;
      if (nnz != 0) {
        /*@ loop invariant stage3_nnz_bounds: 1<=nnz<=stage3_nnz0;
            loop invariant stage3_weight_step: w==stage3_w+(stage3_nnz0-nnz);
            loop invariant stage3_delta_step: dmap==stage3_dmap+(stage3_nnz0-nnz);
            loop variant nnz; */
        do {''')
 p.write_text(s)
 parts=[]
 for f in sorted(plain.iterdir()):
  if f.suffix not in ('.c','.h'):continue
  a=f.read_text();b=(ann/f.name).read_text()
  if a!=b:
   for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+f.name,tofile='b/'+f.name):parts.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
 (case/'proof.patch').write_text(''.join(parts))
 lock=ROOT/'experiments/shim-c-v2/handoff-model-plus/float_model_lock.json'
 data['files']['float_model_lock.json']={'path':str(lock.relative_to(ROOT)),'sha256':sha(lock)}
 data['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))]
 data['wp_share']='experiments/shim-c-v2/handoff-model-plus/wp-share';data['wp_why3_config']='experiments/shim-c-v2/handoff-model-front/why3.conf'
 data['wp_budget']=300;data['wp_timeout']=5;data['wp_provers']='z3,cvc5'
 data['previous_version']=str(old.relative_to(ROOT));data['stage3_revision']='Proof-only RVV cursor/progress induction; all original implementation/spec files unchanged. New relocated qualified model; previous lock and run preserved.'
 data['proof_sha256']=sha(case/'proof.patch');(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n')
 (case/'freeze-sha256.txt').write_text(sha(case/'frozen.json')+'\n')
 print(kernel,sha(case/'frozen.json'))
