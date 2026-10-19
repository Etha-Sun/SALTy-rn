from pathlib import Path
import sys,json,hashlib,difflib,shutil
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rev=HERE/'revision2';rev.mkdir();freeze={}
for name in json.loads((HERE/'freeze.json').read_text()):
 old=HERE/name;case=rev/name;case.mkdir();data=json.loads((old/'frozen.json').read_text());work=case/'.build/edit';shutil.copytree(old/'.build/guard01/annotated',work)
 for side in ['neon.c','rvv.c']:
  p=work/side;s=p.read_text()
  if name=='f32-conv-hwc2chw':
   out='output[0..output_channels*((input_height+1)/2)*output_width-1],errno'
   s=s.replace('loop variant output_y_end+1-output_y;', 'loop assigns output_y,i0,i1,i2,i3,i4,output0,output1,'+out+';\n      loop variant output_y_end+1-output_y;')
   oslots=','.join('o'+str(row)+'c'+str(col) for row in range(2) for col in range(4))
   s=s.replace('loop variant c;', 'loop assigns c,w,i0,i1,i2,i3,i4,'+oslots+','+out+';\n        loop variant c;',1)
   if side=='neon.c':s=s.replace('loop variant iw;', 'loop assigns iw,i0,i1,i2,i3,i4,'+oslots+','+out+';\n          loop variant iw;')
   else:
    currents=','.join('current_o'+str(row)+'c'+str(col) for row in range(2) for col in range(4))
    s=s.replace('loop variant ow;', 'loop assigns ow,ow_done,'+currents+','+out+';\n          loop variant ow;')
    accum=','.join('v_o'+str(row)+'c'+str(col) for row in range(2) for col in range(4))
    for var in ['dx','c_in','ky']:
     needle='for (int '+var+' = 0; '+var+' < 3; '+var+'++) {'
     s=s.replace(needle,'/*@ loop invariant stage3_'+var+'_bounds: 0<='+var+'<=3;\n              loop assigns '+var+','+accum+',errno;\n              loop variant 3-'+var+';\n          */\n          '+needle)
  elif name=='f32-dwconv2d-chw':
   out='output[0..input_height*(input_width/sizeof(float))-1],errno'
   ptrs='i0,i1,i2,i3,i4,o0,o1,o2'
   s=s.replace('loop variant output_height;', 'loop assigns output_height,'+ptrs+','+out+';\n      loop variant output_height;')
   saved=','.join('vi'+str(i)+'x0123,vi'+str(i)+'x4567' for i in range(5)) if side=='neon.c' else ','.join('prev_i'+str(i) for i in range(5))
   s=s.replace('loop variant w;', 'loop assigns w,'+ptrs+','+saved+','+out+';\n        loop variant w;')
  else:
   # Existing loop frames keep input rows and packed weights read-only. State
   # their validity explicitly for tail loads rather than assuming it at calls.
   token='loop invariant 0<=c<=CH;'
   addition=r'''loop invariant stage3_i0_valid: \valid_read(i0+(0..c+2));
        loop invariant stage3_i1_valid: \valid_read(i1+(0..c+2));
        loop invariant stage3_i2_valid: \valid_read(i2+(0..c+2));
        loop invariant stage3_weights_valid: \valid_read(w+(0..16*((c+3)/4)-1));
        '''.replace('\\\\','\\')
   assert token in s;s=s.replace(token,token+'\n        '+addition,1)
  p.write_text(s)
 plain=old/'.build/guard01/plain';patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes())
 (case/'proof.patch').write_text(patch);data['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))];data['previous_version']=str(old.relative_to(ROOT));data['proof_stage']='Stage3 revision2 explicit real loop frames and tail row/packed-weight validity'
 (case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard02');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
 freeze[name]={'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'previous_frozen_sha256':sha(old/'frozen.json'),'source_guard':True}
(rev/'freeze.json').write_text(json.dumps(freeze,indent=2)+'\n')
