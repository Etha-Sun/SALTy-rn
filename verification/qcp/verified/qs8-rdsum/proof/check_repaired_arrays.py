from pathlib import Path
import subprocess,tempfile,json,hashlib,re
c=Path(__file__).resolve().parent.parent;r=Path(tempfile.mkdtemp(prefix='repaired-array-',dir=c/'.build'));src=c/'proof/native/repaired_regression.c';records=[]
def execute(cmd,label,expected_zero):
 full=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
 with(r/(label+'.log')).open('w')as f:x=subprocess.run(full,stdout=f,stderr=f,cwd=r,timeout=180)
 text=(r/(label+'.log')).read_text();good=(x.returncode==0)if expected_zero else(x.returncode==2 and'expected='in text)
 records.append(dict(label=label,command=full,exit_code=x.returncode,expected_zero=expected_zero,accepted=good,log_sha256=hashlib.sha256(text.encode()).hexdigest()));print(label,x.returncode,flush=True)
 if not good:raise RuntimeError(text[-4000:])
s={'passed':False,'scope':'native-array diagnostics only','whole_kernel_verified':False,'run_directory':str(r),'records':records}
try:
 execute(['gcc','-std=c11','-O1','-g','-fsanitize=undefined','-fno-sanitize-recover=all',src,'-lm','-o',r/'test'],'compile',True)
 execute([r/'test'],'native',True);execute([r/'test','--negative-one'],'negative-one',False);execute([r/'test','--negative-both'],'negative-both',False)
 s.update(json.loads((r/'native.log').read_text()),passed=True)
except Exception as e:s['error']=str(e)
s['inputs']={str(p.relative_to(c)):hashlib.sha256(p.read_bytes()).hexdigest()for p in[src,c/'proof/native/control_native.h',c/'proof/native/shim.h',c/'proof/native/isa_arrays.c',c/'impl/testNEON.c',c/'impl/testRVV.c']}
for p in[r/'status.json',c/'proof/repaired-array-native-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
print(json.dumps(s));raise SystemExit(0 if s['passed']else 1)
