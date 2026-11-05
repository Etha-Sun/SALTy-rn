from pathlib import Path
import subprocess,json,hashlib,os
R=Path(__file__).resolve().parent
repo=R.parents[2]
tools=repo/'research/sol-pipeline-comparison-20261030/tools'
zig=tools/'ziglang/zig';rvv=tools/'qemu-riscv64-static';arm=Path('/tmp/vekto-qemu-arm/extracted/usr/bin/qemu-aarch64-static')
results=[]
env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR='/tmp/vekto-minmax-zig-cache',ZIG_LOCAL_CACHE_DIR='/tmp/vekto-minmax-zig-local')
for k in ['vmax','vmin']:
 for arch,target,flags,qemu in [('rvv','riscv64-linux-musl',['-mcpu=generic_rv64+m+a+f+d+c+v'],rvv),('neon','aarch64-linux-musl',[],arm)]:
  d=R/k;binary=d/(arch+'.elf')
  cmd=[str(zig),'cc','-target',target,*flags,'-O3','-fno-fast-math','-ffp-contract=off','-static','-include',str(R/'prelude.h'),str(d/(arch+'.c')),str(R/'harness.c'),'-o',str(binary)]
  # prelude is injected in both units; the harness must not include it twice.
  p=subprocess.run(cmd,env=env,capture_output=True,text=True,timeout=120)
  (d/(arch+'-compile.log')).write_text(p.stdout+p.stderr)
  if p.returncode: raise RuntimeError(p.stderr)
  for vlen in ([128,256,512] if arch=='rvv' else [None]):
   cmdrun=[str(qemu),*(['-cpu',f'rv64,v=true,vlen={vlen},elen=64,vext_spec=v1.0'] if vlen else ['-cpu','max']),str(binary)]
   p=subprocess.run(cmdrun,capture_output=True,text=True,timeout=30)
   log=d/(arch+('-vlen'+str(vlen) if vlen else '')+'.jsonl');log.write_text(p.stdout)
   (d/(log.stem+'.stderr')).write_text(p.stderr)
   if p.returncode: raise RuntimeError(p.stderr)
   rows=[json.loads(s) for s in p.stdout.splitlines()]
   assert len(rows)==60 and all(x['uniform'] and x['output_frame'] for x in rows)
   for x in rows:
    u=int(x['output'],16);nan=(u&0x7fffffff)>0x7f800000
    if x['case'] in ['left_qnan','right_qnan']: assert nan if arch=='neon' else u==0x3f800000
    elif x['case']=='both_qnan': assert nan
    else: assert u==(0x40000000 if k=='vmax' else 0x3f800000)
   results.append({'kernel':k,'architecture':arch,'vlen':vlen,'compile_command':cmd,'run_command':cmdrun,'cases':len(rows),'source_sha256':hashlib.sha256((d/(arch+'.c')).read_bytes()).hexdigest(),'source_git_blob':subprocess.check_output(['git','hash-object',str(d/(arch+'.c'))],text=True).strip(),'log':str(log.relative_to(R)),'returncode':p.returncode})
   print(k,arch,vlen,'60 cases: expected outputs reproduced',flush=True)
(R/'results.json').write_text(json.dumps({'kind':'fresh compiled ISA-emulator execution, not physical hardware, proof, or performance','compiler':subprocess.check_output([str(zig),'version'],text=True).strip(),'rvv_emulator':subprocess.check_output([str(rvv),'--version'],text=True).splitlines()[0],'arm_emulator':subprocess.check_output([str(arm),'--version'],text=True).splitlines()[0],'runs':results},indent=2)+'\n')
