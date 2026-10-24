#!/usr/bin/env python3
"""Only checked annotation insertion; retain current compatible executable tokens."""
from pathlib import Path
import argparse,json,re,hashlib,subprocess,tempfile,time
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\w\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def kernel_text(isa):
 raw=(C/'impl'/('testNEON.c'if isa=='neon'else'testRVV.c')).read_text();sp=(C/'spec.c').read_text();a=sp.index('void test_'+isa+'(');a=sp.index('/*@',a);contract=sp[a:sp.index('*/',a)+2];patches=[{'before':'\n{','text':contract}];where={}
 N='(batch@pre/4)';k='('+N+'-n)';end='('+k+'+vl)';a='input@pre';o='output@pre';off=lambda p,i,ty:f'pointer_offset({p},{i},{ty})';slice=lambda l,h:f'rvv_slice({l},{h},A)'
 if isa=='rvv':
  pure=f'batch == batch@pre && batch % 4 == 0 && params == params@pre && 0 < {N} && {N} <= 4611686018427387903 && 0 <= n && n <= {N} && rvv_length(A) == {N}+3 && input == {off(a,k,"float")} && o == {off(o,k,"unsigned short")} && output == output@pre'
  initial=f'/*@ Assert {pure} && n == {N} && FloatArray::full({a},{N}+3,A) * UShortArray::undef_full(o,{N}) */'
  heap=f'FloatArray::full({a},{N}+3,A) * UShortArray::seg({o},0,{k},f16_rvv_values({k},A)) * UShortArray::undef_seg({o},{k},{N})'
  patches.append({'before':'  while (n > 0)','text':initial+'\n/*@ Inv Assert '+pure+' && '+heap+' */'})
  chunks=[f'FloatArray::seg({a},0,{k},{slice("0",k)})',f'FloatArray::full(input,vl,{slice(k,end)})',f'FloatArray::seg({a},{end},{N}+3,{slice(end,N+"+3")})',f'UShortArray::seg({o},0,{k},f16_rvv_values({k},A))','UShortArray::undef_full(o,vl)',f'UShortArray::undef_seg({o},{end},{N})']
  patches.append({'before':'    vfloat32m8_t vx =','text':f'/*@ Assert {pure} && 0 < n && 0 < vl && vl <= 32 && vl <= n && vl == vadd_vl(n) && '+' * '.join(chunks)+' */'})
  vals={};assign=lambda pref,xs:','.join(f'{pref}{i}={x}'for i,x in enumerate(xs));chunk=slice(k,end);vals['vx']=[f'rvv_read_value({i},vl,{chunk})'for i in range(32)];where['__riscv_vle32_v_f32m8(input, vl)']='L='+chunk
  def arguments(text):
   result=[];depth=0;last=0
   for pos,ch in enumerate(text):
    depth+=(ch=='(')-(ch==')')
    if ch==','and depth==0:result.append(text[last:pos].strip());last=pos+1
   return result+[text[last:].strip()]
  def evaluate(expr):
   expr=expr.strip()
   if expr in vals:return vals[expr]
   if not expr.startswith('__riscv_'):return re.sub(r'UINT(?:32|16)_C\((0x[0-9A-Fa-f]+)\)',lambda m:str(int(m[1],16)),expr)
   mm=re.fullmatch(r'(__riscv_\w+)\((.*)\)',expr);assert mm,expr
   fn=mm[1];args=arguments(mm[2]);values=[evaluate(arg)for arg in args]
   if fn=='__riscv_vle32_v_f32m8':return vals['vx']
   vector_indices=[j for j,v in enumerate(values)if isinstance(v,list)];ghost=[]
   for j,pos in enumerate(vector_indices):
    formal='mask'if fn=='__riscv_vmerge_vxm_u16m4'and pos==2 else 'ab'[j]
    prefix='m'if formal=='mask'else 'xy'[j]
    named=args[pos]in vals;ghost.append(formal+'='+('&'+args[pos]if named else'0'))
    actual=[args[pos]+'.s'+str(i)for i in range(32)]if named else values[pos]
    ghost.append(assign(prefix,actual))
   where[expr]=','.join(ghost)
   if 'reinterpret_v_f32m8_u32m8' in fn:return[f'bits_of_fp32({x})'for x in values[0]]
   if 'reinterpret_v_u32m8_f32m8' in fn:return[f'fp32_of_bits({x})'for x in values[0]]
   actualfn='qcp_f16_rvv_shrn_'+args[1]if fn=='__riscv_vnsrl_wx_u16m4'else fn
   result=[]
   for i in range(32):
    op=[v[i]if isinstance(v,list)else v for v in values[:-1]]
    if fn=='__riscv_vnsrl_wx_u16m4':op=op[:1]
    if fn=='__riscv_vmerge_vxm_u16m4':op=[op[0],op[2],op[1]]
    result.append(f'f16_active_{actualfn}({i},vl,'+','.join(op)+')')
   return result
  for line in raw.splitlines():
   m=re.match(r'\s*(?:(?:v\w+_t)\s+)?(\w+)\s*=\s*(__riscv_\w+\([^;]+\));',line)
   if not m:continue
   out,expr=m.groups()
   if expr.startswith(('__riscv_vsetvl_','__riscv_vle32_')):continue
   vals[out]=evaluate(expr)
  where['__riscv_vse16_v_u16m4(o, vh, vl)']='a=&vh,L=f16_pack32('+','.join('vh.s'+str(i)for i in range(32))+'),'+assign('x',['vh.s'+str(i)for i in range(32)])

  # Only iteration-local vectors, and only after their final original C use.
  # Forget values while retaining all32 same-object field permissions.
  forget=[]
  for decl in re.finditer(r'^\s*(v\w+_t)\s+(\w+)\s*=',raw,re.M):
   ty,var=decl.groups();uses=list(re.finditer(r'\b'+re.escape(var)+r'\b',raw));last=uses[-1]
   line_start=raw.rfind('\n',0,last.start())+1;line_end=raw.find('\n',last.end());line_end=len(raw)if line_end<0 else line_end
   statement=raw[line_start:line_end];assert ';'in statement and '//'not in statement
   ct='float'if ty=='vfloat32m8_t'else 'unsigned int'if ty=='vuint32m8_t'else 'unsigned short'if ty=='vuint16m4_t'else 'int'
   assert ty in ['vfloat32m8_t','vuint32m8_t','vuint16m4_t','vbool4_t'],ty
   before=' * '.join(f'store(&({var}.s{i}),{ct},{var}.s{i})'for i in range(32))
   cut='/*@ '+before+f' which implies UndefStructPred{ty}(&{var}) */'
   patches.append({'after':statement,'text':cut})
   forget.append({'variable':var,'type':ty,'cell_type':ct,'permission_cells_retained':32,'last_original_identifier_offset':last.start(),'after_original_statement':statement})

 else:
  constants={'vexp_bias':('unsigned int',4,'125829120'),'vscale_to_inf':('float',4,'f16_scale_hi'),'vexpw_max':('unsigned int',4,'2139095040'),'vscale_to_zero':('float',4,'f16_scale_lo'),'vbias_min':('unsigned int',4,'1073741824'),'vexph_mask':('unsigned short',8,'31744'),'vmanth_mask':('unsigned short',8,'4095'),'vsignh_mask':('unsigned short',8,'32768'),'vnanh':('unsigned short',8,'32256')}
  constheap=' * '.join(f'store(&({n}.s{i}),{ty},{v})'for n,(ty,num,v)in constants.items()for i in range(num))
  inv='/*@ Inv Assert exists (k:Z), sizeof(float) == 4 && sizeof(unsigned short) == 2 && (batch == 0 || (batch == 4 && batch/4 == 1) || (batch == 8 && batch/4 == 2) || (batch == 12 && batch/4 == 3) || (batch == 16 && batch/4 == 4) || (batch == 20 && batch/4 == 5) || (batch == 24 && batch/4 == 6) || (batch == 28 && batch/4 == 7) || (32 <= batch && 8 <= batch/4)) && fp32_length(A) == batch@pre/4+3 && 0 <= k && k*4+batch == batch@pre && batch % 4 == 0 && 0 <= batch && batch <= batch@pre && k <= batch@pre/4 && params == params@pre && input == input@pre+k && output == output@pre && o == pointer_offset(output@pre,k,unsigned short) && input != 0 && o != 0 && FloatArray::full(input@pre,k,fp32_slice(0,k,A)) * FloatArray::full(input,batch/4+3,fp32_slice(k,batch@pre/4+3,A)) * UShortArray::full(output@pre,k,f16_values(k,A)) * UShortArray::undef_full(o,batch/4) * '+constheap+' */'
  cases9='(batch == 0 || (batch == 4 && batch/4 == 1) || (batch == 8 && batch/4 == 2) || (batch == 12 && batch/4 == 3) || (batch == 16 && batch/4 == 4) || (batch == 20 && batch/4 == 5) || (batch == 24 && batch/4 == 6) || (batch == 28 && batch/4 == 7) || (32 <= batch && 8 <= batch/4))'
  assert cases9 in inv
  inv8=inv.replace(cases9,'(batch < 32 || (32 <= batch && 8 <= batch/4))')
  inv4=inv.replace(cases9,'batch < 32 && (batch == 0 || (batch == 4 && batch/4 == 1) || (batch == 8 && batch/4 == 2) || (batch == 12 && batch/4 == 3) || (16 <= batch && 4 <= batch/4))')
  patches+=[{'before':'  for (; batch >= 8','text':inv8},{'before':'  for (; batch >= 4','text':inv4}]
  # Every by-value argument has one actual C evaluation. Anonymous result
  # addresses instantiate only the unused location ghost as zero.
  signatures={}
  for m in re.finditer(r'\w+\s+(\w+)\(([^;{}]*?)\)\s*/\*@', (C/'shim/vector_ops.h').read_text()):
   vs=[]
   for j,arg in enumerate(m[2].split(',')):
    mm=re.fullmatch(r'\s*(float32x4_t|uint32x4_t|uint16x[48]_t)\s+(\w+)\s*',arg)
    if mm:vs.append((j,mm[2],8 if mm[1]=='uint16x8_t'else 4))
   if vs:signatures[m[1]]=vs
  # Scan balanced calls, preserving nested call structure.
  for m in re.finditer(r'\b(\w+)\(',raw):
   fn=m[1];start=m.end();depth=1;j=start
   while depth:
    depth+=(raw[j]=='(')-(raw[j]==')');j+=1
   if fn not in signatures:continue
   call=raw[m.start():j];inside=raw[start:j-1];args=[];d=0;last=0
   for z,ch in enumerate(inside):
    d+=(ch=='(')-(ch==')')
    if ch==','and d==0:args.append(inside[last:z].strip());last=z+1
   args.append(inside[last:].strip());ann=[]
   for i,g,num in signatures[fn]:
    named=bool(re.fullmatch(r'\w+',args[i]));ann.append(g+'='+('&'+args[i]if named else'0'))
    if named:
     prefix={'a':'x','b':'y','m':'m'}[g];ann +=[prefix+str(j)+'='+args[i]+'.s'+str(j)for j in range(num)]
   where[call]=','.join(ann)
  # token-pasting intrinsics are macro aliases to checked concrete bodies.
  for m in re.finditer(r'vshrn_n_u32\(([^;\n]+?), (13|16)\)',raw):
   call=m[0];arg=m[1];where[call]='a='+('&'+arg if re.fullmatch(r'\w+',arg)else'0')
 text=raw
 for p in patches:
  anchor=p.get('before',p.get('after'));assert text.count(anchor)==1,anchor
  replacement=p['text']+'\n'+anchor if 'before'in p else anchor+'\n'+p['text']
  text=text.replace(anchor,replacement,1)
 # Insert annotations from the innermost closing-parenthesis position, so
 # nested annotations do not prevent a later outer exact-token match.
 spans=[]
 for call,ann in where.items():
  for match in re.finditer(re.escape(call),text):spans.append((match.end(),' /*@ where '+ann+' */'))
 for pos,ann in sorted(set(spans),reverse=True):text=text[:pos]+ann+text[pos:]
 assert tokens(text)==tokens(raw)
 return raw,text,{'patches':patches,'where':where,**({'dead_vector_forget':forget}if isa=='rvv'else{})}
def kernel_header(isa):
 head='#include "'+str(C/'shim'/(isa+'_frontend.h'))+'"\n#include "'+str(C/'shim/program_model.h')+'"\n/*@ Extern Coq (f16_scale_hi : fp32) (f16_scale_lo : fp32) (fp32_of_real : real -> fp32) */\n'
 for name in ['float_array','neon_bridge','neon_tail','rvv_arrays','rvv_store','rvv_loop','f16_memory','f16_kernel']:head+='/*@ include strategies "'+name+'.strategies" */\n'
 if isa=='neon':head+='/*@ include strategies "f16_neon_load.strategies" */\n'
 return head

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--private-status',action='store_true');a=ap.parse_args();assert 0<a.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-kernel-',dir=C/'.build'));raw,text,annotations=kernel_text(a.isa);(H/'c'/(a.isa+'.annotations.json')).write_text(json.dumps(annotations,indent=2)+'\n');stem=a.isa+'_unit';records=[];s={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'implementation_variant':'compatible-exact-decimal-literals','original_tokens_unchanged':False,'strategy_application_limit':8192 if a.isa=='rvv'else 1024,'timeout_seconds':a.timeout}
 head=kernel_header(a.isa)
 def execute(cmd,label,timeout):
  cmd=list(map(str,cmd));log=run/(label+'.log');t=time.monotonic()
  try:
   with log.open('w')as out:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--']+cmd,cwd=run,stdout=out,stderr=out,timeout=timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 try:
  for n,body in [('raw',raw),(stem,text)]:
   (run/(n+'.raw.c')).write_text(head+body);assert execute(['gcc','-E','-P','-CC','-nostdinc',run/(n+'.raw.c'),'-o',run/(n+'.c')],n+'-cpp',60)==0
  assert tokens((run/'raw.c').read_text())==tokens((run/(stem+'.c')).read_text())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit='+str(8192 if a.isa=='rvv'else 1024),'--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(run),'--coq-logic-path=F32F16','-slp',C/'shim','F32F16','-slp',H/'c','F32F16']
  for d in sorted((B/'proof/c').iterdir()):
   if d.is_dir():cmd+=['-slp',d,d.name]
  assert execute(cmd,'qcp',a.timeout)==0,'actual QCP failed'
  goal=run/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;s.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(run/(stem+'.c')),compatible_impl_raw_tokens_preserved=True,same_frontend_cpp_tokens_preserved=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/(a.isa+'-generation-status.json')).write_text(json.dumps(s,indent=2)+'\n')if not a.private_status else None;print(run,flush=True);raise SystemExit(0 if s['generation_passed']else 1)
if __name__=='__main__':main()
