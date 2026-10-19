"""Build original C kernels against the ordinary C shim and run sanitizers."""
from pathlib import Path
import subprocess,json,hashlib,datetime
ROOT=Path(__file__).resolve().parent
CASES=['f32-vsub','f32-vmul','f32-vdiv','f32-vsqrt','f32-vmulc','f32-vmin','f32-vmax','f32-vlrelu','f32-vrndne']

def run(name,original=False):
    case=ROOT/name;build=case/'.build';build.mkdir(exist_ok=True)
    modules=json.loads((case/'modules.json').read_text());sources=[ROOT/'shared'/m for m in modules]+[case/'neon.c',case/('original/rvv.c' if original else 'rvv.c'),case/'harness.c',ROOT/'native.c']
    unit=build/('native-original.c' if original else 'native.c')
    unit.write_text('#include "shim.h"\n'+'\n'.join('#include "'+str(p)+'"' for p in sources)+'\n')
    binary=unit.with_suffix('');cmd=['gcc','-std=c11','-O1','-g','-fno-fast-math','-frounding-math','-fsanitize=address,undefined','-fno-omit-frame-pointer','-DCASE='+str(CASES.index(name)+1),'-I'+str(ROOT/'shared'),'-I'+str(case),str(unit),'-lm','-o',str(binary)]
    compile=subprocess.run(cmd,capture_output=True,text=True)
    if compile.returncode:return {'compiled':False,'stderr':compile.stderr,'command':cmd}
    import os
    env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0')
    result=subprocess.run([str(binary)],capture_output=True,text=True,env=env,timeout=120)
    files=sources+[ROOT/'shared'/p for p in ['shim.h','base.h','rsum.h','clamp.h','float_ops.h','extensions.h']]+[case/'spec.h',case/'interface.json',ROOT/'generate.py']
    return {'compiled':True,'passed':result.returncode==0,'exit_code':result.returncode,'stdout':result.stdout,'stderr':result.stderr,'command':cmd,'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}

if __name__=='__main__':
    import concurrent.futures
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
        jobs={pool.submit(run,n):n for n in CASES}
        results={jobs[job]:job.result() for job in concurrent.futures.as_completed(jobs)}
    for name in ['f32-vmin','f32-vmax']:results[name]['original_target']=run(name,True)
    (ROOT/'native-results.json').write_text(json.dumps(results,indent=2)+'\n')
    for name,r in results.items():print(name,r.get('passed'),r.get('stdout',r.get('stderr',''))[:100])
