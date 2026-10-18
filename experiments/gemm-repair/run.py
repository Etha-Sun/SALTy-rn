from pathlib import Path
import hashlib,json,os,re,resource,shutil,subprocess,time
b=Path(__file__).resolve().parent
(b/'logs').mkdir(exist_ok=True)
(b/'.build').mkdir(exist_ok=True)
framac=os.environ.get('FRAMAC') or shutil.which('frama-c')
if not framac:
    raise SystemExit('Set FRAMAC to the Frama-C executable or put frama-c in PATH; optional PROVER_BIN prepends prover executables.')
env=dict(os.environ)
if env.get('PROVER_BIN'):
    env['PATH']=env['PROVER_BIN']+os.pathsep+env['PATH']
def memory_limit():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
def run(name,cmd,wall=180,extra_env=None,limit=False):
    start=time.monotonic()
    with (b/'logs'/f'{name}.log').open('w')as out:
        out.write('COMMAND '+repr(cmd)+'\n');out.flush()
        try:
            r=subprocess.run(cmd,cwd=b,stdout=out,stderr=subprocess.STDOUT,env=extra_env or env,
                             timeout=wall,preexec_fn=memory_limit if limit else None)
            result={'exit':r.returncode,'wall_timeout':False}
        except subprocess.TimeoutExpired:
            result={'exit':None,'wall_timeout':True}
    result.update(command=cmd,seconds=time.monotonic()-start)
    (b/'logs'/f'{name}-run.json').write_text(json.dumps(result,indent=2)+'\n')
    print(name,result,flush=True);return result
if __name__=='__main__':
    run('prepare',['python3',str(b/'prepare.py')])
    source={p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in b.iterdir()if p.suffix in ['.c','.h','.py']}
    records={}
    records['native_compile']=run('native-compile',['gcc','-std=c11','-O2','-Wall','-Wextra','-Werror','-ffp-contract=off',
       '-fno-builtin-fmaf','-fsanitize=address,undefined',str(b/'native_test.c'),'-lm','-o',str(b/'.build/native')])
    if records['native_compile']['exit']==0:
        records['native']=run('native',[str(b/'.build/native')],extra_env=dict(env,ASAN_OPTIONS='detect_leaks=0'))
    records['rvv_compile']=run('rvv-compile',['clang','--target=riscv64','-march=rv64gcv','-ffreestanding','-fsyntax-only',str(b/'.build/rvv_compile.c')])
    records['frontend']=run('frontend',[str(framac),'-machdep','gcc_x86_64','-print','-ocode',str(b/'.build/proof_ast.c'),str(b/'proof.c')],limit=True)
    functions=re.findall(r'static inline \w+ (\w+)\(', (b/'shim.h').read_text())+['test_neon','test_rvv']
    if records['frontend']['exit']==0:
        records['wp']=run('full-wp',[str(framac),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-model','Typed+float',
            '-inline-calls',','.join(functions),'-wp-fct','equivalent','-wp-par','2','-wp-prover','z3,cvc5,alt-ergo',
            '-wp-timeout','5','-wp-memlimit','1024','-wp-cache','none','-wp-report-json',str(b/'logs/full-wp.json'),str(b/'proof.c')],wall=180,limit=True)
    goals=json.loads((b/'logs/full-wp.json').read_text())if(b/'logs/full-wp.json').exists()else[]
    result={'records':records,'source_sha256':source,
      'source_unchanged_during_check':source=={p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in b.iterdir()if p.suffix in ['.c','.h','.py']},
      'raw_passed':sum(g['passed']for g in goals),'raw_total':len(goals),
      'pending':[g for g in goals if not g['passed']],
      'complete_original_c_equivalence_proved':False,'admitted_to_verified':False,
      'observation':'NaN-aware numerical output equality; native tests also compare canonical-qNaN model bits',
      'additional_library_tcb':'fmaf result NaN-aware-equal to the shared common_fma logic function; no checked libc bridge',
      'layout_scope':'contiguous row-major activations/output; NR8 packed weights; arbitrary supported positive dimensions and float values',
      'isa_to_c_shim_proved':False}
    (b/'results.json').write_text(json.dumps(result,indent=2)+'\n')
    print('raw proof obligations',result['raw_passed'],result['raw_total'])
