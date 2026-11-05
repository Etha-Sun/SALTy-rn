"""Functional NF=2/4/8 strided segment diagnostics with legal EMUL*NF<=8."""
import json
from pathlib import Path
import bench
old=bench.OUT/'diagnostics/strided-load';d=bench.OUT/'diagnostics/segmented-load';d.mkdir(parents=True,exist_ok=True)
(d/'proto.h').write_text('void probe_segmented(const uint32_t*,uint32_t*,size_t);\n')
k=bench.PREFIX+'void __attribute__((noipa)) probe_segmented(const uint32_t* x,uint32_t* o,size_t stride){\n'
start=0;cases=[]
for ix,(lm,nf) in enumerate([(1,8),(2,4),(4,2),(1,2)]):
 k+=f'size_t n{ix}=__riscv_vsetvl_e32m{lm}(16);vuint32m{lm}x{nf}_t t{ix}=__riscv_vlsseg{nf}e32_v_u32m{lm}x{nf}(x,stride,n{ix});\n'
 for c in range(nf):k+=f'__riscv_vse32_v_u32m{lm}(o+{start+c*16},__riscv_vget_v_u32m{lm}x{nf}_u32m{lm}(t{ix},{c}),n{ix});\n'
 cases.append((lm,nf,start));start+=nf*16
k+='}\n';(d/'kernel.c').write_text(k)
main=bench.PREFIX+'#include <stdio.h>\n#include "'+str(d/'proto.h')+'"\nstatic const uint32_t x[2048] __attribute__((aligned(64)))={'+','.join(str(65536+i)+'u' for i in range(2048))+'};\nstatic uint32_t o[256] __attribute__((aligned(64)));\nint main(void){__asm__ volatile("vsetivli zero,0,e8,m1,ta,ma":::"memory");probe_segmented(x,o,512);__asm__ volatile("fence rw,rw":::"memory");int ok=1;\n'
for lm,nf,offset in cases:
 main+=f'''for(size_t c=0;c<{nf};c++){{int reported=0;for(size_t r=0;r<16;r++)if(o[{offset}+c*16+r]!=x[r*128+c]){{ok=0;if(!reported){{printf("BAD m{lm} nf{nf} col=%lu row=%lu got=%lx expected=%lx\\n",(unsigned long)c,(unsigned long)r,(unsigned long)o[{offset}+c*16+r],(unsigned long)x[r*128+c]);reported=1;}}}}}}\n'''
main+='printf(ok?"PASS\\n":"FAIL\\n");return ok?0:1;}\n';(d/'main.c').write_text(main)
t=json.loads((old/'build.json').read_text());kc=[x.replace(str(old),str(d)) for x in t['kernel_command']];link=[x.replace(str(old),str(d)) for x in t['link_command']]
a=bench.command(kc,d/'kernel-compile.log');b=bench.command(link,d/'link.log') if a==0 else None
bench.write(d/'build.json',dict(kernel_command=kc,link_command=link,kernel_rc=a,link_rc=b,helper_commands=[],metric='functional segmented-load diagnostic only'))
assert a==b==0
print('Native',bench.native_check(d))
