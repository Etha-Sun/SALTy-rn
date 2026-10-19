"""Four small float interface templates; input domain never excludes NaN/Inf."""
import argparse,json,re
from pathlib import Path


def contract(clauses):
    return '/*@\n'+'\n'.join('  '+s+';' for s in clauses)+'\n*/\n'


def render(case):
    cfg=json.loads((case/'interface.json').read_text())
    family,padding=cfg['family'],cfg['padding']
    assert family in {'binary-f32','scalar-f32','unary-f32','lrelu-f32'}
    assert cfg['observation']=='number-or-both-nan' and padding==3
    binary=family=='binary-f32'; scalar=family=='scalar-f32'; lrelu=family=='lrelu-f32'
    names=['input_a','input_b'] if binary or scalar else ['input']
    spans={p:('0..0' if scalar and p=='input_b' else '0..batch/sizeof(float)+2') for p in names}
    spec='#ifndef GENERATED_SPEC_H\n#define GENERATED_SPEC_H\n#include "shim.h"\n\n'
    for side in ['neon','rvv']:
        src=(case/(side+'.c')).read_text()
        sig=re.search(r'void\s+test_'+side+r'\s*\([^{}]*?\)\s*(?:XNN_OOB_READS)?(?=\s*\{)',src).group().strip()
        params='unused_params' if 'unused_params' in sig else 'params'
        clauses=['requires 0 < batch <= SIZE_MAX-12','requires batch % sizeof(float) == 0']
        clauses += [f'requires \\valid_read({p}+({spans[p]}))' for p in names]
        clauses += ['requires \\valid(output+(0..batch/sizeof(float)-1))']
        clauses += [f'requires \\separated(output+(0..batch/sizeof(float)-1),{p}+({spans[p]}))' for p in names]
        if lrelu: clauses += [f'requires \\valid_read({params})',f'requires \\separated(output+(0..batch/sizeof(float)-1),{params})']
        else: clauses += [f'requires {params} != \\null']
        clauses += ['terminates \\true','assigns output[0..batch/sizeof(float)-1]']
        spec+=contract(clauses)+sig+';\n\n'
    inputs='const float *input_a,const float *input_b' if binary or scalar else 'const float *input'
    extra=',float slope' if lrelu else ''
    decl=f'int equivalent(size_t n,{inputs},float *left,float *right{extra})'
    public=['requires 0 < n <= SIZE_MAX/4-3']
    for p in names:
        span='0..0' if scalar and p=='input_b' else '0..n+2'
        public += [f'requires \\valid_read({p}+({span}))']
    public += ['requires \\valid(left+(0..n-1))','requires \\valid(right+(0..n-1))']
    for out in ['left','right']:
        for p in names:
            span='0..0' if scalar and p=='input_b' else '0..n+2'
            public += [f'requires \\separated({out}+(0..n-1),{p}+({span}))']
    public += ['requires \\separated(left+(0..n-1),right+(0..n-1))','terminates \\true','assigns left[0..n-1],right[0..n-1]','ensures equal: \\result == 1']
    spec+=contract(public)+decl+';\n#endif\n'
    init='struct xnn_f32_lrelu_params params={{slope}};' if lrelu else 'struct xnn_f32_default_params params={0};'
    args='input_a,input_b' if binary or scalar else 'input'
    body=f'  {init}\n  test_neon(n*sizeof(float),{args},left,&params);\n  test_rvv(n*sizeof(float),{args},right,&params);\n'
    body+='  for(size_t i=0;i<n;i++) {\n    if (!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i]))) return 0;\n  }\n  return 1;\n'
    return {'spec.h':spec,'harness.c':'#include "spec.h"\n\n'+decl+' {\n'+body+'}\n'}


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('case',type=Path);parser.add_argument('--write',action='store_true');args=parser.parse_args()
    for name,text in render(args.case).items():
        if args.write:(args.case/name).write_text(text)
        else:assert (args.case/name).read_text()==text,name
