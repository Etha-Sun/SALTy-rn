from pathlib import Path
import sys,json,hashlib,subprocess,difflib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
names=['f32-conv-hwc2chw','f32-dwconv-minmax','f32-dwconv2d-chw']
freeze={}
for name in names:
 old=HERE.parent/'v4-campaign'/name;case=HERE/name;case.mkdir()
 data=json.loads((old/'frozen.json').read_text())
 for item in data['files'].values():assert sha(ROOT/item['path'])==item['sha256']
 work=case/'.build/edit';plain=work/'plain';ann=work/'annotated';plain.mkdir(parents=True);ann.mkdir()
 for n,item in data['files'].items():
  (plain/n).write_bytes((ROOT/item['path']).read_bytes());(ann/n).write_bytes((plain/n).read_bytes())
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=ann,check=True,capture_output=True)
 for side in ['neon.c','rvv.c']:
  p=ann/side;s=p.read_text()
  def replace(a,b):
   global s
   assert a in s,(name,side,a);s=s.replace(a,b,1)
  if name=='f32-conv-hwc2chw':
   replace('  for (size_t output_y = output_y_start;', '''  /*@ loop invariant stage3_rows: output_y_start <= output_y <= output_y_end+1;
      loop invariant stage3_row_parity: (output_y-output_y_start)%2==0;
      loop variant output_y_end+1-output_y;
  */
  for (size_t output_y = output_y_start;''')
   replace('    do {', '''    /*@ loop invariant stage3_channels: 0<=c<=output_channels;
        loop invariant stage3_channel_blocks: c==0 || (output_channels-c)%4==0;
        loop variant c;
    */
    do {''')
   if side=='neon.c':
    replace('      for (; iw >= 4;', '''      /*@ loop invariant stage3_width: 0<=iw<=input_width;
          loop invariant stage3_width_blocks: (input_width-iw)%4==0;
          loop variant iw;
      */
      for (; iw >= 4;''')
   else:
    replace('      while (ow > 0) {', '''      /*@ loop invariant stage3_width: 0<=ow<=output_width;
          loop invariant stage3_cursor: ow_done+ow==output_width;
          loop invariant stage3_store_cursor: current_o0c0==o0c0+ow_done;
          loop variant ow;
      */
      while (ow > 0) {''')
    replace('        size_t vl = __riscv_vsetvl_e32m1(ow);','''        size_t vl = __riscv_vsetvl_e32m1(ow);
        /*@ assert stage3_vl: 0<vl<=4 && vl<=ow; */''')
  elif name=='f32-dwconv2d-chw':
   replace('  do {', '''  /*@ loop invariant stage3_height: 0<=output_height<=input_height;
      loop invariant stage3_rows: output_height==0 || (input_height-output_height)%3==0;
      loop variant output_height;
  */
  do {''')
   if side=='neon.c':
    replace('    for (; w > 4 * sizeof(float);', '''    /*@ loop invariant stage3_width: 0<w<=input_width;
        loop invariant stage3_width_blocks: (input_width-w)%16==0;
        loop variant w;
    */
    for (; w > 4 * sizeof(float);''')
   else:
    replace('    while (w > 0) {', '''    /*@ loop invariant stage3_width: 0<=w<=input_width/sizeof(float);
        loop variant w;
    */
    while (w > 0) {''')
    replace('      size_t vl = __riscv_vsetvl_e32m2(w);','''      size_t vl = __riscv_vsetvl_e32m2(w);
      /*@ assert stage3_vl: 0<vl<=8 && vl<=w; */''')
  else:
   if side=='rvv.c':
    replace('      size_t vl = __riscv_vsetvl_e32m4(c < 4 ? c : 4);','''      size_t vl = __riscv_vsetvl_e32m4(c < 4 ? c : 4);
      /*@ assert stage3_vl: vl==(c<4?c:4) && 0<vl<=c;
          assert stage3_weight_block: (CH-c)%4==0;
          assert stage3_store_range: 0<=CH-c && CH-c+vl<=CH;
      */''')
   else:
    replace('    for (; c >= 4; c -= 4) {','''    for (; c >= 4; c -= 4) {
      /*@ assert stage3_weight_block: (CH-c)%4==0;
          assert stage3_store_range: 0<=CH-c && CH-c+4<=CH;
      */''')
  p.write_text(s)
 patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(ann/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(ann/n).read_bytes())
 (case/'proof.patch').write_text(patch)
 lock=HERE.parent/'handoff-model-plus/float_model_lock.json';ld=json.loads(lock.read_text())
 data['files']['float_model_lock.json']={'path':str(lock.relative_to(ROOT)),'sha256':sha(lock)}
 data.update(previous_version=str(old.relative_to(ROOT)),proof_patches=[str((case/'proof.patch').relative_to(ROOT))],wp_share=ld['share'],wp_why3_config=ld['why3_config'],wp_timeout=3,wp_budget=300,proof_stage='Stage3 isolated loop cursor/range/termination proof continuation')
 (case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n')
 _,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01')
 (case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
 freeze[name]={'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch'),'source_guard':guard['passed']}
(HERE/'freeze.json').write_text(json.dumps(freeze,indent=2)+'\n')
