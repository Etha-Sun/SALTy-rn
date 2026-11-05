"""Three matched implementations, legal explicit AVL=0 measurement reset."""
from pathlib import Path
import json
import bench
from campaign import quota
for role in ['C-public','D-manual-16x8','A-target']:
 quota();d=bench.OUT/'runs/x32-transposec'/role/'0-primary1-avl0'
 if (d/'result.json').exists():continue
 if not (d/'test.elf').exists():bench.build('x32-transposec',role,'0-primary1-avl0')
 if bench.native_check(d):bench.run(d,360)
 else:bench.write(d/'result.json',dict(valid=False,stage='native_precheck'))
