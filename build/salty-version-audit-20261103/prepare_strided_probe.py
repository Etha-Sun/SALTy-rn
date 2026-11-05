"""Instruction-level functional diagnostic, not a performance benchmark."""
import json
from pathlib import Path
import bench
D=bench.OUT/'diagnostics/strided-load';D.mkdir(parents=True,exist_ok=True)
proto='void probe_strided(const uint32_t*,uint32_t*,size_t);\n'
(D/'proto.h').write_text(proto)
k=bench.PREFIX+'void __attribute__((noipa)) probe_strided(const uint32_t* x,uint32_t* o,size_t stride){size_t vl=__riscv_vsetvl_e32m1(16);\n'
for c in range(8):k+=f'vuint32m1_t v{c}=__riscv_vlse32_v_u32m1(x+{c},stride,vl);\n'
for c in range(8):k+=f'__riscv_vse32_v_u32m1(o+{c*16},v{c},vl);\n'
k+='vuint32m1_t vc=__riscv_vle32_v_u32m1(x+1,vl);__riscv_vse32_v_u32m1(o+128,vc,vl);}\n';(D/'kernel.c').write_text(k)
main=bench.PREFIX+'#include <stdio.h>\n#include "'+str(D/'proto.h')+'"\nstatic const uint32_t x[2048] __attribute__((aligned(64)))={'+','.join(str(65536+i)+'u' for i in range(2048))+'};\nstatic uint32_t o[144] __attribute__((aligned(64)));\n'
main+='''int main(void){__asm__ volatile("vsetivli zero,0,e8,m1,ta,ma":::"memory");probe_strided(x,o,512);__asm__ volatile("fence rw,rw":::"memory");
unsigned long scalar=*(const volatile uint32_t*)(x+1);printf("SCALAR1 %lx expected=10001\\n",scalar);
int ok=scalar==65537;int reports=0;
for(size_t c=0;c<8;c++)for(size_t r=0;r<16;r++)if(o[c*16+r]!=x[r*128+c]){ok=0;if(reports++<8)printf("BAD col=%lu row=%lu got=%lx expected=%lx\\n",(unsigned long)c,(unsigned long)r,(unsigned long)o[c*16+r],(unsigned long)x[r*128+c]);}
for(size_t r=0;r<16;r++)if(o[128+r]!=x[1+r]){ok=0;printf("CONTIG_BAD %lu\\n",(unsigned long)r);}
printf(ok?"PASS\\n":"FAIL\\n");return ok?0:1;}
''';(D/'main.c').write_text(main)
t=json.loads((bench.R/'round2/hardware/benchmarks-scalar/direct/build.json').read_text());kc=t['kernel_command'];kc=kc[:kc.index('-c')]+['-c',str(D/'kernel.c'),'-o',str(D/'kernel.o')]
l=t['harness_link_command'];oldmain=l[l.index('-T')+2];oldobj=next(x for x in l if x.endswith('/kernel.o'));oldelf=l[-1]
l=[str(D/'main.c') if x==oldmain else str(D/'kernel.o') if x==oldobj else str(D/'test.elf') if x==oldelf else x for x in l]
a=bench.command(kc,D/'kernel-compile.log');b=bench.command(l,D/'link.log') if a==0 else None
bench.write(D/'build.json',dict(kernel_command=kc,link_command=l,kernel_rc=a,link_rc=b,helper_commands=[],metric='functional diagnostic only; no speed claim'))
assert a==b==0
print('Native control',bench.native_check(D))
