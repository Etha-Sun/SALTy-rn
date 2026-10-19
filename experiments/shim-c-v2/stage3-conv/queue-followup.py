"""Serialize the finite follow-ups after the already running first wave."""
from pathlib import Path
import subprocess,time,sys
here=Path(__file__).resolve().parent;deadline=time.monotonic()+420
while not (here/'f32-dwconv2d-chw/summary.json').exists():
 if time.monotonic()>deadline:raise SystemExit('First wave did not finish; no overlapping run started')
 time.sleep(5)
steps=[
 ('revision3/f32-conv-hwc2chw','control03','control',90,''),
 ('revision3/f32-conv-hwc2chw','helpers03','helpers',180,'__riscv_vid_v_u32m1,__riscv_vadd_vx_u32m1,__riscv_vmul_vx_u32m1,__riscv_vmsge_vx_i32m1_b32,__riscv_vmslt_vx_i32m1_b32,__riscv_vmand_mm_b32'),
 ('revision4/f32-dwconv-minmax','control04','control',90,''),
 ('revision4/f32-dwconv-minmax','selected04','selected',180,'stage3_vl,stage3_weight_block,stage3_store_range'),
 ('revision4/f32-dwconv-minmax','lemmas04','lemmas',90,''),
 ('revision4/f32-dwconv-minmax','full04','full',300,''),
 ('revision2/f32-dwconv2d-chw','control02','control',90,''),
 ('revision2/f32-dwconv2d-chw','selected02','selected',180,'stage3_height,stage3_rows,stage3_vl'),
 ('revision3/f32-conv-hwc2chw','selected03','selected',180,'stage3_cursor,stage3_vl,stage3_ky_bounds'),
 ('revision3/f32-conv-hwc2chw','lemmas03','lemmas',90,''),
 ('revision3/f32-conv-hwc2chw','full03','full',1200,'')]
for case,name,mode,budget,properties in steps:
 cmd=[sys.executable,str(here/'run-case.py'),case,name,mode,'--budget',str(budget),'--properties',properties]
 p=subprocess.run(cmd,cwd=here.parents[2])
 if p.returncode:raise SystemExit('Stopped after failed orchestration/control: '+case+' '+name)
