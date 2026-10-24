#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,tempfile,json,hashlib,re,time,threading
c=Path(__file__).resolve().parent.parent;r=Path(tempfile.mkdtemp(prefix='formal-native-',dir=c/'.build'));records=[];lock=threading.Lock();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();inputs={}
def execute(cmd,label,expected=0,timeout=600):
 cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];wd=r/'jobs'/label;wd.mkdir(parents=True);t=time.monotonic();log=r/(label+'.log')
 with log.open('w')as f:code=subprocess.run(cmd,cwd=wd,stdout=f,stderr=f,timeout=timeout).returncode
 with lock:records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-t,expected_exit=expected,log_sha256=sha(log)))
 if code!=expected:raise RuntimeError(label+': '+log.read_text()[-3000:])
 return log
status={'passed':False,'scope':'current actual scalar-field C helper closure + repaired kernels + public wrapper; finite native oracle only','whole_kernel_verified':False,'run_directory':str(r),'records':records}
try:
 api='#ifndef RDSUM_NATIVE_FORMAL_API_H\n#define RDSUM_NATIVE_FORMAL_API_H\n#include <stdint.h>\n'
 api+='\n'.join(re.findall(r'typedef struct \w+\s*\{[^}]+\}\s*\w+;', (c/'shim/formal_types.h').read_text()))+'\nstruct xnn_qs8_rsum_params {char _;};\n'
 for f in ['scalar_primitives.h','vector_primitives.h']:
  text=re.sub(r'/\*.*?\*/','',(c/'shim'/f).read_text(),flags=re.S);text=re.sub(r'^#.*$','',text,flags=re.M)
  text=re.sub(r'\bsize_t\b','unsigned long long',text);text=re.sub(r'\buint64_t\b','unsigned long long',text);text=re.sub(r'\bint64_t\b','long long',text);api+=text+'\n'
 args='unsigned long long rows,unsigned long long channels,const int8_t *input,unsigned long long input_stride,const int8_t *zero,'
 for n in ['test_neon','test_rvv']:api+='void '+n+'('+args+'int32_t *output,const struct xnn_qs8_rsum_params *params);\n'
 api+='int equivalent('+args+'int32_t *left,int32_t *right,const struct xnn_qs8_rsum_params *params);\nint rdsum_equal_i32(unsigned long long,const int32_t*,const int32_t*);\n#endif\n';(r/'formal_api.h').write_text(api)
 s=(c/'proof/native/repaired_regression.c').read_text();s=s[s.index('static uint64_t cases'):];s='#include <stddef.h>\n#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n#include <limits.h>\n#include "formal_api.h"\n'+s
 s=s.replace('if(negative){','if(negative){').replace('if((uint32_t)left[c]!=want[c]||(uint32_t)right[c]!=want[c]){fprintf', 'if((uint32_t)left[c]!=want[c]||(uint32_t)right[c]!=want[c]){if(negative)fprintf(stderr,"negative comparator=%d\\n",rdsum_equal_i32(channels,left,right));fprintf')
 marker=' if(memcmp(copy,in,len)';pos=s.index(marker);s=s[:pos]+''' if(!negative){for(size_t c=0;c<channels;c++){memcpy(left+c,&init,4);memcpy(right+c,&init,4);}if(equivalent(rows,channels,in,stride,zero,left,right,NULL)!=1)abort();for(size_t c=0;c<channels;c++)if((uint32_t)left[c]!=want[c]||(uint32_t)right[c]!=want[c])abort();}
'''+s[pos:];s=s.replace('finite repaired native array diagnostic; not formal scalar-field closure','finite actual scalar-field helper+kernel+public wrapper oracle');s=s.replace('static uint64_t cases', '#include \"'+str(c/'proof/native/helper_oracles.c.inc')+'\"\nstatic uint64_t cases');s=s.replace(' const size_t rows[]=', ' helper_oracles();\n const size_t rows[]=');(r/'harness.c').write_text(s)
 units=[(p,[])for p in sorted((c/'shim').glob('*.c'))]+[(c/'impl/testNEON.c',['-include',str(c/'shim/neon_frontend.h')]),(c/'impl/testRVV.c',['-include',str(c/'shim/rvv_frontend.h')]),(c/'spec.c',[])]
 def compile(item):
  src,extra=item;label=src.stem;obj=r/(label+'.o');log=execute(['gcc','-std=c11','-O2','-g','-fsanitize=undefined','-fno-sanitize-recover=all',*extra,'-c',src,'-o',obj],label)
  dep=execute(['gcc','-std=c11','-MM',*extra,src],label+'-dependencies').read_text().replace('\\\n',' ');deps=[src,*[Path(x)for x in dep.split(':',1)[1].split()]]
  with lock:
   for p in deps:inputs[str(p.relative_to(c))]=sha(p)
  return obj
 with ThreadPoolExecutor(max_workers=16)as pool:objects=list(pool.map(compile,units))
 execute(['gcc','-std=c11','-O2','-g','-fsanitize=undefined','-fno-sanitize-recover=all',r/'harness.c',*objects,'-o',r/'test'],'link')
 log=execute([r/'test'],'native',timeout=600);counts=json.loads(log.read_text().splitlines()[-1]);m=re.search(r'primitive_oracle cases=(\d+) lanes=(\d+) failures=0',log.read_text());assert m;counts.update(primitive_oracle_cases=int(m[1]),primitive_oracle_lanes=int(m[2]));execute([r/'test','--negative-one'],'negative-one',expected=2);execute([r/'test','--negative-both'],'negative-both',expected=2)
 assert 'negative comparator=1' in(r/'negative-both.log').read_text();status.update(counts,passed=True,actual_c_units=len(units),recursive_input_count=len(inputs))
except Exception as e:status['error']=str(e);print(e,flush=True)
for p in[c/'proof/native/repaired_regression.c',c/'proof/native/helper_oracles.c.inc',Path(__file__).resolve()]:inputs[str(p.relative_to(c))]=sha(p)
status['recursive_c_input_count']=status.get('recursive_input_count');status['input_inventory_count']=len(inputs)
status['input_sha256']=inputs;status['generated_harness_sha256']={p.name:sha(p)for p in[r/'harness.c',r/'formal_api.h']if p.exists()}
for p in[r/'status.json',c/'proof/formal-native-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in['passed','actual_c_units','recursive_input_count','cases','lanes_per_side','run_directory','error']}),flush=True);raise SystemExit(0 if status['passed']else 1)
