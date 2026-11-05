"""Check linked machine code, rather than assuming the C timing window survived compilation."""
import json,re,subprocess
from pathlib import Path
from bench_simple import HERE,write

checked=[]
for r in json.loads((HERE/'all-runs.json').read_text()):
 if not r['valid']:continue
 d=Path(r['result']).parent;b=json.loads((d/'build.json').read_text())
 objdump=Path(b['kernel_command'][0]).with_name('riscv-none-elf-objdump')
 cmd=[str(objdump),'-d','--disassemble=main',str(d/'test.elf')]
 text=subprocess.check_output(cmd).decode();(d/'main.disasm').write_text(text)
 stamps=list(re.finditer(r'\brdcycle\b',text));assert len(stamps)==2,(str(d),len(stamps))
 window=text[stamps[0].start():stamps[1].end()]
 calls=[x.strip() for x in window.splitlines() if re.search(r'\bjalr?\b',x)]
 assert len(calls)==1 and '<test_rvv>' in calls[0],(str(d),calls)
 vector=[x.strip() for x in window.splitlines() if re.search(r'\s(v\w+)\s',x) and not re.search(r'\bvsetivli\b',x)]
 assert not vector,(str(d),vector)
 assert window.count('rdinstret')==2,(str(d),'counter ordering')
 checked.append(dict(directory=str(d),command=cmd,kernel_call=calls[0],non_reset_vector_instructions_in_window=vector))
write(HERE/'timing-window-validation.json',dict(status='passed',checked=len(checked),claim='Each linked main timing window contains exactly one real test_rvv call, no other call, and no preparation/checking vector instruction; two instret reads preserved. Kernel instructions execute in the called function.',records=checked))
print('Linked timing windows checked:',len(checked))
