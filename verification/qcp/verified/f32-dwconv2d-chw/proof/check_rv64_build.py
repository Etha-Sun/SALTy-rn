#!/usr/bin/env python3
from pathlib import Path
import json,hashlib,shutil,subprocess,tempfile
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();run=Path(tempfile.mkdtemp(prefix='rv64-current-build-',dir=C/'.build'));compiler='/srv/home/yuechunsun/tools/lean/research/sail-binary-reduction/vendor/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc';prefix='''#include <stddef.h>
#include <stdint.h>
#include <assert.h>
#include <riscv_vector.h>
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
''';unit=run/'unit.c';unit.write_text(prefix+'#include "'+str(C/'shim/propagating.c')+'"\n#include "'+str(C/'shim/read_scalar.c')+'"\n#include "'+str(C/'impl/testRVV.c')+'"\n');cmd=['prlimit','--as=17179869184:17179869184','--',compiler,'-march=rv64gcv','-mabi=lp64d','-ffreestanding','-frounding-math','-ffp-contract=off','-Wall','-Werror','-c',str(unit),'-o',str(run/'unit.o')]
with(run/'compile.log').open('w')as f:r=subprocess.run(cmd,stdout=f,stderr=f,timeout=180)
s={'passed':r.returncode==0,'exit_code':r.returncode,'scope':'Buildability of actual repaired RVV main and ordinary helpers with real GCC15 RVV API; not formal ISA/proof credit','run_directory':str(run),'command':cmd,'input_sha256':{p:sha(C/p)for p in ['impl/testRVV.c','shim/propagating.c','shim/propagating_api.h','shim/read_scalar.c','shim/read_api.h','proof/check_rv64_build.py']},'generated_unit_sha256':sha(unit),'log_sha256':sha(run/'compile.log')};q=C/'proof/rv64-buildability-status.json'
if q.exists():shutil.copy2(q,C/'proof/history'/('rv64-buildability-'+sha(q)+'.json'))
q.write_text(json.dumps(s,indent=2)+'\n');(run/'status.json').write_bytes(q.read_bytes());print(json.dumps(s,indent=2));raise SystemExit(not s['passed'])
