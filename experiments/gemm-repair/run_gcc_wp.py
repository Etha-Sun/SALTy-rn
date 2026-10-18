from pathlib import Path
import hashlib,json,re,runpy
b=Path(__file__).resolve().parent
context=runpy.run_path(str(b/'run.py'))
run=context['run']
framac=context['framac']
source={p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in b.iterdir()if p.suffix in ['.c','.h']}
functions=re.findall(r'static inline \w+ (\w+)\(', (b/'shim.h').read_text())+['test_neon','test_rvv']
frontend=run('frontend-gcc',[str(framac),'-machdep','gcc_x86_64','-print','-ocode',str(b/'.build/proof_gcc_ast.c'),str(b/'proof.c')],limit=True)
record=run('full-wp-gcc',[str(framac),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-model','Typed+float',
    '-inline-calls',','.join(functions),'-wp-fct','equivalent','-wp-par','2','-wp-prover','z3,cvc5,alt-ergo',
    '-wp-timeout','5','-wp-memlimit','1024','-wp-cache','none','-wp-report-json',str(b/'logs/full-wp-gcc.json'),str(b/'proof.c')],wall=180,limit=True)
goals=json.loads((b/'logs/full-wp-gcc.json').read_text())if(b/'logs/full-wp-gcc.json').exists()else[]
result={'frontend':frontend,'wp':record,'source_sha256':source,
 'source_unchanged_during_check':source=={p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in b.iterdir()if p.suffix in ['.c','.h']},
 'raw_passed':sum(g['passed']for g in goals),'raw_total':len(goals),'pending':[g for g in goals if not g['passed']],
 'complete_original_c_equivalence_proved':False,'admitted_to_verified':False,
 'builtin_model':'gcc_x86_64 recognizes __builtin_nanf type, but its numerical/NaN contract and canonical_nan memory bridge remain unproved; x86_64 exploratory attempt is not proof evidence',
 'additional_library_tcb':'fmaf NaN-aware result coupling to shared common_fma; libc body/ISA bridge unproved'}
(b/'gcc-wp-results.json').write_text(json.dumps(result,indent=2)+'\n')
print('raw gcc obligations',result['raw_passed'],result['raw_total'])
