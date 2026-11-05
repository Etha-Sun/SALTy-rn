import bench
from campaign import quota
for role in ['C-public','D-manual-16x8','C-branch-8xv1','C-branch-8xv4']:
 quota();s='0-cold1-avl0-aligned64-diagnostic';d=bench.OUT/'runs/x32-transposec'/role/s
 if (d/'result.json').exists():continue
 bench.write(bench.OUT/'CONTINUE.json',dict(status='aligned_transpose_probe',kernel='x32-transposec',role=role,shape=s,entrypoint='aligned_transpose_probe.py'))
 if not (d/'test.elf').exists():bench.build('x32-transposec',role,s)
 if bench.native_check(d):bench.run(d,120)
 else:bench.write(d/'result.json',dict(valid=False,stage='native_precheck'))
