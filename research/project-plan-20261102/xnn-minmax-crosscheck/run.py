from pathlib import Path
import subprocess,os,json,hashlib
R=Path(__file__).resolve().parent;ROOT=R.parents[2];TOOLS=ROOT/'research/sol-pipeline-comparison-20261030/tools';XNN=ROOT/'benchmark/XNNPACK'
(R/'prelude.h').write_text('#ifndef XNN_REPRO_PRELUDE_H\n#define XNN_REPRO_PRELUDE_H\n#include <stddef.h>\n#include <assert.h>\n#include "src/xnnpack/common.h"\n#include "src/xnnpack/microparams.h"\n#endif\n')
(R/'harness.c').write_bytes((R.parent/'final-minmax-reproduction/harness.c').read_bytes())
env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR='/tmp/vekto-perf-zig-global',ZIG_LOCAL_CACHE_DIR='/tmp/vekto-perf-zig-local');results=[]
for op in ['vmax','vmin']:
 for arch,target,suffix,flags,qemu in [('neon','aarch64-linux-musl','neon-u8',[],Path('/tmp/vekto-qemu-arm/extracted/usr/bin/qemu-aarch64-static')),('rvv','riscv64-linux-musl','rvv-u8v',['-mcpu=generic_rv64+m+a+f+d+c+v'],TOOLS/'qemu-riscv64-static')]:
  rel=f'src/f32-vbinary/gen/f32-{op}-{suffix}.c';src=R/'upstream'/rel;assert src.read_bytes()==(XNN/rel).read_bytes()
  d=R/'runs'/(op+'-'+arch);d.mkdir(parents=True,exist_ok=True)
  symbol=f'xnn_f32_{op}_ukernel__'+suffix.replace('-','_')
  cmd=[str(TOOLS/'ziglang/zig'),'cc','-target',target,*flags,'-O3','-fno-fast-math','-ffp-contract=off','-static','-I'+str(XNN),'-I'+str(XNN/'src'),'-I'+str(ROOT/'third_party/zephyr/third-party/executorch/backends/xnnpack/third-party/pthreadpool/include'),'-Dtest_'+arch+'='+symbol,str(src),str(R/'harness.c'),'-o',str(d/'test.elf')]
  p=subprocess.run(cmd,env=env,capture_output=True,text=True,timeout=120);(d/'compile.log').write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr
  for vl in ([128,256,512] if arch=='rvv' else [None]):
   run=[str(qemu),'-cpu',f'rv64,v=true,vlen={vl},elen=64,vext_spec=v1.0' if vl else 'max',str(d/'test.elf')]
   p=subprocess.run(run,capture_output=True,text=True,timeout=30);assert p.returncode==0,p.stderr
   (d/f'vlen{vl}.jsonl').write_text(p.stdout)
   rows=[json.loads(s) for s in p.stdout.splitlines()];assert len(rows)==60
   for x in rows:
    u=int(x['output'],16);nan=(u&0x7fffffff)>0x7f800000;assert x['uniform'] and x['output_frame']
    if x['case'] in ['left_qnan','right_qnan']:assert nan if arch=='neon' else u==0x3f800000
    elif x['case']=='both_qnan':assert nan
    else:assert u==(0x40000000 if op=='vmax' else 0x3f800000)
   results.append({'kernel':op,'arch':arch,'vlen':vl,'cases':len(rows),'source':rel,'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'source_git_blob':subprocess.check_output(['git','hash-object',str(src)],text=True).strip(),'compile_command':cmd,'run_command':run,'first_counterexample':rows[0]})
   print(op,arch,vl,rows[0]['output'],flush=True)
(R/'results.json').write_text(json.dumps({'upstream_commit':'82be86388c131862c3673c177d9dbcd5d3e3844d','header_snapshot':'867d5a344790802ee067be62f572c2e2722bf6fb','kernel_files_byte_identical_between_snapshots':True,'scope':'Unmodified XNNPACK microkernel files, compiled and executed in ISA emulators. Not full library build, operator runtime, hardware or formal proof.','runs':results},indent=2)+'\n')
