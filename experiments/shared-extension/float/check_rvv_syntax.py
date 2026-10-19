"""Syntax-only check using the installed older RVV API with explicit name adaptation."""
from pathlib import Path
import hashlib,json,re,subprocess
b=Path(__file__).resolve().parent;out=b/'.build/rvv-syntax';out.mkdir(parents=True,exist_ok=True)
prelude='''#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
struct xnn_f32_default_params {char unused;};
struct xnn_f32_lrelu_params {struct {float slope;} scalar;};
'''
records=[]
for case in sorted(p for p in b.iterdir() if (p/'rvv.c').exists()):
 text=(case/'rvv.c').read_text();calls=sorted(set(re.findall(r'\b(__riscv_\w+)\s*\(',text)));aliases=[]
 for call in calls:
  legacy=call.removeprefix('__riscv_')
  if 'vmerge_vvm_' in call:aliases.append(f'#define {call}(a,b,m,vl) {legacy}(m,a,b,vl)')
  else:aliases.append(f'#define {call} {legacy}')
 unit=out/(case.name+'.c');unit.write_text(prelude+'\n'.join(aliases)+'\n'+text)
 cmd=['clang-14','--target=riscv64','-march=rv64gcv','-ffreestanding','-fsyntax-only','-Werror=implicit-function-declaration',str(unit)]
 p=subprocess.run(cmd,capture_output=True,text=True)
 records.append({'kernel':case.name,'exit':p.returncode,'command':cmd,'source_sha256':hashlib.sha256((case/'rvv.c').read_bytes()).hexdigest(),'compatibility_aliases':aliases,'stderr':p.stderr})
 print(case.name,p.returncode)
(b/'rvv-syntax-results.json').write_text(json.dumps({'scope':'Syntax only, clang14 legacy RVV prefix and merge-argument API adaptation; no code execution or ISA-to-C proof','records':records},indent=2)+'\n')
