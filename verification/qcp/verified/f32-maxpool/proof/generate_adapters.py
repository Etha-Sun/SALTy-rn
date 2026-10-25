#!/usr/bin/env python3
"""Generate the actual five ordinary NaN adapter bodies; intrinsic specs only."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--timeout',type=int,default=21600);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='propagate-generation-',dir=C/'.build'));gen=r/'generated';gen.mkdir();records=[];files=['proof/generate_adapters.py','shim/formal_model.h','shim/formal_types.h','shim/rvv_arithmetic_specs.h','shim/propagate_specs.h','shim/propagate.h','shim/propagate.c','proof/coq/Bits.v','proof/coq/Model.v','proof/coq/Types.v','proof/coq/VectorModel.v'];inputs={s:sha(C/s)for s in files};status=dict(passed=False,qcp_generation_passed=False,whole_kernel_verified=False,actual_body_checked_c_vcs=0,run_directory=str(r),input_sha256=inputs,records=records)
 env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH']
 def run(label,cmd,memory):
  log=r/(label+'.log');t=time.monotonic();cmd=['prlimit','--as='+str(memory*1024**3)+':'+str(memory*1024**3),'--',*map(str,cmd)]
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=a.timeout)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,memory_limit_GiB=memory,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert p.returncode==0,log.read_text()[-3000:]
 try:
  source=(C/'shim/propagate.c').read_text();spec=(C/'shim/propagate_specs.h').read_text()
  positions={
   '__riscv_vreinterpret_v_f32m8_u32m8':[(0,'a')], '__riscv_vreinterpret_v_u32m8_f32m8':[(0,'a')],
   '__riscv_vand_vx_u32m8':[(0,'a')], '__riscv_vor_vx_u32m8':[(0,'a')],
   '__riscv_vmsgtu_vx_u32m8_b4':[(0,'a')], '__riscv_vmseq_vx_u32m8_b4':[(0,'a')],
   '__riscv_vmand_mm_b4':[(0,'a'),(1,'b')], '__riscv_vmerge_vvm_f32m8':[(0,'a'),(1,'b'),(2,'m')],
   '__riscv_vfmax_vv_f32m8':[(0,'a'),(1,'b')], '__riscv_vfmin_vv_f32m8':[(0,'a'),(1,'b')],
   'mp_propagate_nan':[(0,'a'),(1,'b'),(2,'numeric')], 'mp_max_vv':[(0,'a'),(1,'b')], 'mp_min_vv':[(0,'a'),(1,'b')]}
  call_annotations=[];lines=[]
  for line in source.splitlines(True):
   if line.startswith('  '):
    m=re.search(r'\b('+ '|'.join(positions)+r')\(',line)
    if m:
     depth=1;j=m.end();start=j;args=[]
     while depth:
      ch=line[j]
      if ch=='(':depth+=1
      elif ch==')':depth-=1
      if ch==','and depth==1:args.append(line[start:j].strip());start=j+1
      j+=1
     args.append(line[start:j-1].strip());bindings=[]
     for index,name in positions[m[1]]:
      assert re.fullmatch(r'[A-Za-z_]\w*',args[index]),args[index]
      bindings.append(name+'=&'+args[index])
     comment='/*@ where '+','.join(bindings)+' */'
     call_annotations.append(dict(call=line[m.start():j],comment=comment,meaning='bind actual named value-object address, never0/anonymous fabricated heap'))
     line=line[:j]+comment+line[j:]
   lines.append(line)
  source=''.join(lines);(r/'call-annotations.json').write_text(json.dumps(call_annotations,indent=2)+'\n')
  signatures=re.findall(r'(vfloat32m8_t\s+(mp_\w+)\([^;{]*\))\s*(/\*@.*?\*/);',spec,re.S)
  assert len(signatures)==5
  for signature,name,contract in signatures:
   pattern=r'(vfloat32m8_t\s+'+name+r'\([^{}]*\))\s*\{'
   matches=list(re.finditer(pattern,source));assert len(matches)==1,name
   m=matches[0];source=source[:m.start()]+m.group(1)+'\n'+contract+'\n{'+source[m.end():]
  (r/'annotated-propagate.c').write_text(source)
  (r/'input.c').write_text('#include "'+str(C/'shim/rvv_arithmetic_specs.h')+'"\n#define MP_PROPAGATE_H\n#include "'+str(r/'annotated-propagate.c')+'"\n')
  run('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C/'shim',r/'input.c','-o',r/'propagate.c'],16)
  run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/'propagate.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool'],32)
  goal=gen/'propagate_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;assert inputs=={s:sha(C/s)for s in inputs};status.update(passed=True,qcp_generation_passed=True,fields=fields,generated_c_vcs=len(fields),goal_sha256=sha(goal),cpp_sha256=sha(r/'propagate.c'),intrinsic_body_exception=True,ordinary_helpers_body_proof_pending=True)
 except Exception as e:status['error']=str(e)
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=C/'proof/adapter-generation-status.json'
 if dest.exists():(C/'proof/history'/('adapter-generation-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:status.get(k)for k in ['passed','run_directory','generated_c_vcs','error']}));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
