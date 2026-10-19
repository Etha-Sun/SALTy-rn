from pathlib import Path
import shutil,json,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'column-v3';c=H/'neon-frame-v5';c.mkdir();d=json.loads((old/'frozen.json').read_text());plain=c/'.build/plain';ann=c/'.build/edit';plain.mkdir(parents=True)
for name,item in d['files'].items():shutil.copyfile(R/item['path'],plain/name)
shutil.copytree(plain,ann)
for pp in d['proof_patches']:
 r=subprocess.run(['patch','-p1','-i',str(R/pp)],cwd=ann,text=True,capture_output=True);assert r.returncode==0,r.stdout+r.stderr
p=ann/'neon.c';original=p.read_text();s=original
needle='  size_t output_decrement =';s=s.replace(needle,'  //@ ghost size_t spn_MC=mc;\n  //@ ghost float *spn_output=output;\n'+needle)
s=s.replace('  while XNN_LIKELY(mc >= 4 * sizeof(float)) {',r'''  /*@ loop invariant spn_mc_range: 0<=mc<=spn_MC && mc%4==0;
      loop invariant spn_output_row: output==spn_output+(spn_MC-mc)/4;
      loop assigns mc,input,output,errno,spn_output[0..nc*(spn_MC/4+4)-1];
      loop variant mc;
  */
  while XNN_LIKELY(mc >= 4 * sizeof(float)) {''')
# Every actual column loop receives a frame. Temporary locals declared inside loops are local to their iterations.
for suffix,indent,acc in [('4','    ','vacc0123'),('2','      ','vacc01'),('1','      ','vacc0')]:
 needle=indent+'size_t n = nc;\n'+indent+'do {'
 assert s.count(needle)>=1
 repl=indent+'size_t n = nc;\n'+indent+f'//@ ghost float *spn_column_{suffix}=output;\n'+indent+f'''/*@ loop invariant spn_n_{suffix}: 0<n<=nc;
{indent}    loop invariant spn_map_{suffix}: nnzmap==nidx_nnzmap+(nc-n);
{indent}    loop invariant spn_out_{suffix}: output==spn_column_{suffix}+(nc-n)*(spn_MC/4+4);
{indent}    loop assigns n,w,dmap,nnzmap,input,output,errno,spn_output[0..nc*(spn_MC/4+4)-1];
{indent}    loop variant n;
{indent}*/
{indent}do {{'''
 s=s.replace(needle,repl,1)
 needle=indent+'  if XNN_LIKELY(nnz != 0) {\n'+indent+'    do {'
 repl=indent+f'  //@ ghost uint32_t spn_nnz0_{suffix}=nnz;\n'+indent+f'  //@ ghost const float *spn_w_{suffix}=w;\n'+indent+f'  //@ ghost const int32_t *spn_d_{suffix}=dmap;\n'+indent+'  if XNN_LIKELY(nnz != 0) {\n'+indent+f'''    /*@ loop invariant spn_nnz_{suffix}: 0<nnz<=spn_nnz0_{suffix};
{indent}        loop invariant spn_wstep_{suffix}: w==spn_w_{suffix}+(spn_nnz0_{suffix}-nnz);
{indent}        loop invariant spn_dstep_{suffix}: dmap==spn_d_{suffix}+(spn_nnz0_{suffix}-nnz);
{indent}        loop assigns nnz,dmap,input,w,{acc},errno;
{indent}        loop variant nnz;
{indent}    */
{indent}    do {{'''
 assert needle in s;s=s.replace(needle,repl,1)
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));(c/'REVIEW.diff').write_text(''.join(difflib.unified_diff(original.splitlines(True),s.splitlines(True),fromfile='v3/neon.c',tofile='v5/neon.c')));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='spmm-neon-frame-v5',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),stage3_revision='Add checked loop frames and scalar/cursor invariants for all seven actual NEON loops. No function requires/assigns change. All new frame obligations must be checked.')
d.setdefault('stage3',{})['proof_sha256']=sha(c/'proof.patch');(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n')
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(c,sha(c/'frozen.json'),'guard01');(c/'source-guard.json').write_text(json.dumps(g,indent=2));assert g['passed']
for name in ['run.py','control.py']:
 t=(H/'column-inline-v4'/name).read_text().replace("case=H/'column-inline-v4'", "case=H/'neon-frame-v5'");(c/name).write_text(t)
(c/'execution-config.json').write_text(json.dumps({'runner_sha256':sha(c/'run.py'),'control_runner_sha256':sha(c/'control.py'),'inline_calls':'test_neon,test_rvv,xnn_prefetch_to_l1','remove_inlined':'test_neon,test_rvv','strict_checker_accepted':False,'same_frozen_files':d['files']==json.loads((old/'frozen.json').read_text())['files']},indent=2))
print('new frame candidate prepared; source guard passed; no solver run')
