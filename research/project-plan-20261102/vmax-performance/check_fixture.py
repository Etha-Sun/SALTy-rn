from pathlib import Path
import subprocess,os,json
R=Path(__file__).resolve().parent;root=R.parents[2];old=root/'research/sol-pipeline-comparison-20261030'
env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR='/tmp/vekto-perf-zig-global',ZIG_LOCAL_CACHE_DIR='/tmp/vekto-perf-zig-local')
for name in ['xnn-u4','xnn-u8','optimized','repaired']:
 d=R/'runs'/name
 cmd=[str(old/'tools/ziglang/zig'),'cc','-target','riscv64-linux-musl','-mcpu=generic_rv64+m+a+f+d+c+v','-O2','-fno-vectorize','-fno-slp-vectorize','-static','-I'+str(root/'benchmark/XNNPACK'),'-I'+str(root/'benchmark/XNNPACK/src'),'-I'+str(root/'third_party/zephyr/third-party/executorch/backends/xnnpack/third-party/pthreadpool/include'),str(R/'harness.c'),str(d/'kernel.o'),'-o',str(d/'fixture-qemu.elf')]
 p=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=120);(d/'fixture-qemu-compile.log').write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr
 q=[str(old/'tools/qemu-riscv64-static'),'-cpu','rv64,v=true,vlen=512,elen=64,vext_spec=v1.0',str(d/'fixture-qemu.elf')]
 p=subprocess.run(q,capture_output=True,text=True,timeout=60);(d/'fixture-qemu.log').write_text('QEMU COUNTERS BELOW ARE NOT PERFORMANCE MEASUREMENTS\n'+p.stdout+p.stderr);assert p.returncode==0 and 'PASS' in p.stdout and 'FAIL' not in p.stdout
 (d/'fixture-qemu.json').write_text(json.dumps({'passed':True,'scope':'same finite fixture and GCC kernel object, all 7 sizes; QEMU cycle values discarded','compile_command':cmd,'run_command':q},indent=2)+'\n');print(name,'entire fixture PASS',flush=True)
