from pathlib import Path
import re,json
b=Path(__file__).resolve().parent
for d in b.iterdir():
 if not (d/'neon.c').exists():continue
 n=d.name
 if 'rdsum' in n:continue
 src=(d/'neon.c').read_text();m=re.search(r'void test_neon\((.*?)\)\s*(?:XNN_OOB_READS)?\s*\{',src,re.S);args=' '.join(m.group(1).split());params=args[args.rfind(',')+1:].strip();pt=params[:params.rfind('params')].replace('restrict','').strip()
 binary='input_a' in args; inp='float' if n=='f32-f16-vcvt' else 'uint8_t' if n.startswith('qu') else 'int8_t';out='float' if '-f32-' in n else 'uint16_t' if n=='f32-f16-vcvt' else inp
 padding=3 if inp=='float' else 7;fam=('binary-' if binary else 'unary-')+inp+'-'+out
 config={'family':fam,'padding':padding,'observation':'number-or-both-nan' if out=='float' else 'integer-equality'};(d/'interface.json').write_text(json.dumps(config,indent=2)+'\n')
 sig=f'size_t n, const {inp} *'+('input_a, const '+inp+' *input_b' if binary else 'input')+f', {out} *left, {out} *right, {pt} params'
 ip=['input_a','input_b'] if binary else ['input'];allp=ip+['left','right','params']
 req=['requires n>0;',f'requires n<=SIZE_MAX/{max(1,4 if inp=="float" or out=="float" else 2 if out=="uint16_t" else 1)}-{padding};']
 for p in ip:req.append(f'requires \\valid_read({p}+(0..n+{padding}-1));')
 req+=['requires \\valid(left+(0..n-1));','requires \\valid(right+(0..n-1));']
 if pt!='const void*':req.append('requires \\valid_read(params);')
 req.append('requires \\separated(left+(0..n-1),right+(0..n-1));')
 for o in ['left','right']:
  for p in ip:req.append(f'requires \\separated({o}+(0..n-1),{p}+(0..n+{padding}-1));')
  if pt!='const void*':req.append(f'requires \\separated({o}+(0..n-1),params);')
 if n=='qs8-vcvt':req.append('requires params->scalar.multiplier != INT32_MIN;')
 if n=='qs8-vlrelu':req+=['requires params->scalar.positive_multiplier != INT32_MIN;','requires params->scalar.negative_multiplier != INT32_MIN;']
 if '-f32-' in n:req.append('requires params->scalar.zero_point != INT32_MIN;')
 if 'vadd' in n:req+=['requires params->scalar.shift != INT32_MIN;']
 # No additional clamp min<=max precondition: both implementations use same min/max ordering.
 req+=['terminates \\true;','assigns left[0..n-1],right[0..n-1];','ensures equal: \\result==1;']
 text='#ifndef INTEGER_CASE_SPEC_H\n#define INTEGER_CASE_SPEC_H\n#include "shim.h"\nvoid test_neon('+args+');\nvoid test_rvv('+args+');\n/*@\n  '+'\n  '.join(req)+'\n*/\nint equivalent('+sig+');\n#endif\n';(d/'spec.h').write_text(text)
 call=('n*sizeof(float)' if inp=='float' else 'n')+','+','.join(ip)
 obs='left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])' if out=='float' else 'left[i]==right[i]'
 (d/'harness.c').write_text('#include "spec.h"\nint equivalent('+sig+') {\n  test_neon('+call+',left,params);\n  test_rvv('+call+',right,params);\n  for(size_t i=0;i<n;i++) if(!('+obs+'))return 0;\n  return 1;\n}\n')

for n in ['qs8-rdsum','qu8-rdsum']:
 d=b/n;u=n.startswith('qu');it='uint8_t' if u else 'int8_t';ot='uint32_t' if u else 'int32_t';args=f'size_t rows,size_t channels,const {it} *input,size_t input_stride,const {it} *zero,{ot} *output,const struct xnn_qs8_rsum_params *params'
 sig=f'size_t rows,size_t channels,const {it} *input,size_t input_stride,const {it} *zero,const {ot} *initial,{ot} *left,{ot} *right,const struct xnn_qs8_rsum_params *params'
 req=['requires 0<rows<=INT_MAX;','requires 0<channels<=SIZE_MAX-15;','requires channels+15<=input_stride<=SIZE_MAX/7;','requires (rows-1)*input_stride<=SIZE_MAX-channels-15;','requires \\valid_read(input+(0..(rows-1)*input_stride+channels+15-1));','requires \\valid_read(zero+(0..31));','requires \\forall integer j;0<=j<32 ==> zero[j]==0;','requires \\valid_read(initial+(0..channels-1));','requires \\valid_read(params);','requires \\valid(left+(0..channels-1));','requires \\valid(right+(0..channels-1));','requires \\separated(left+(0..channels-1),right+(0..channels-1));']
 for o in ['left','right']:
  for inp,rng in [('input','(rows-1)*input_stride+channels+15-1'),('zero','31'),('initial','channels-1')]:req.append(f'requires \\separated({o}+(0..channels-1),{inp}+(0..{rng}));')
  req.append(f'requires \\separated({o}+(0..channels-1),params);')
 if not u:req+=['requires channels%2==0 || INT32_MIN <= initial[channels-1] + signed_low32(\\sum(0, rows-1, \\lambda integer r; (integer)input[r*input_stride+channels-1])) <= INT32_MAX;']
 req+=['terminates \\true;','assigns left[0..channels-1],right[0..channels-1];','ensures equal: \\result==1;']
 logic='' if u else '/*@ logic integer signed_low32(integer s) = (((s%4294967296)+4294967296)%4294967296 < 2147483648) ? ((s%4294967296)+4294967296)%4294967296 : ((s%4294967296)+4294967296)%4294967296-4294967296; */\n'
 (d/'spec.h').write_text('#ifndef INTEGER_CASE_SPEC_H\n#define INTEGER_CASE_SPEC_H\n#include "shim.h"\n'+logic+'void test_neon('+args+');\nvoid test_rvv('+args+');\n/*@\n  '+'\n  '.join(req)+'\n*/\nint equivalent('+sig+');\n#endif\n')
 (d/'harness.c').write_text('#include "spec.h"\nint equivalent('+sig+') {\n  for(size_t i=0;i<channels;i++)left[i]=right[i]=initial[i];\n  test_neon(rows,channels,input,input_stride,zero,left,params);\n  test_rvv(rows,channels,input,input_stride,zero,right,params);\n  for(size_t i=0;i<channels;i++)if(left[i]!=right[i])return 0;\n  return 1;\n}\n')
 (d/'interface.json').write_text(json.dumps({'family':'row-reduction-'+it,'padding':15,'observation':'integer-equality'},indent=2)+'\n')
