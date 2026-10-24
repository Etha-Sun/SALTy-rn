from pathlib import Path
import json
c=Path(__file__).resolve().parent.parent
k='(channels@pre-channels)';start='(rows@pre-r)';t='(rd_min252(r)-current_batch)'
common=['rows==rows@pre','0<rows@pre','rows@pre<=18446744073709551615','0<channels@pre','channels@pre<=4611686018427387903','0<=channels','channels<=channels@pre','input_stride==input_stride@pre','0<=input_stride','input_stride<=18446744073709551615','zero==zero@pre','params==params@pre','input@pre>0','output@pre>0','input==input@pre+'+k,'output==output@pre+4*'+k,'input_increment==rd_u64(7*input_stride)','rd_inputs(M,input@pre,rows@pre,channels@pre,input_stride@pre)','rd_zero_condition(M,zero@pre,rows@pre,channels@pre)']
heap=['rd_mem(M)',f'IntArray::full(output@pre,channels@pre,rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init))']
wide=[f'store(&(vacc.s{i}),int,rd_acc32(M,input@pre,input_stride@pre,{k},{start},{i},vl))'for i in range(32)]
narrow=[f'store(&(vacc16.s{i}),short,rd_acc16(M,input@pre,input_stride@pre,{k},{start},rd_done(r,current_batch),{i},vl))'for i in range(32)]
def inv(pure,sp,ptrs=False):
 pre='exists '+' '.join(f'(ip{j}:Z)'for j in range(7))+', 'if ptrs else''
 return '/*@ Inv Assert '+pre+' && '.join(['('+x+')'for x in pure]+[' * '.join(sp)])+' */'
row=common+['0<channels','vl==rd_vl(channels)','0<vl','vl<=32','vl<=channels','0<=r','r<=rows@pre','rd_progress(rows@pre,r)']+[f'rd_ptr_gate(r,ip{j},rd_u64(input+({start}+{j})*input_stride))'for j in range(7)]
inner=common+['0<channels','vl==rd_vl(channels)','0<vl','vl<=32','vl<=channels','0<r','r<=rows@pre','rd_mod252(rows@pre-r)==0','-6<=current_batch','current_batch<=rd_min252(r)','(rd_min252(r)-current_batch)%7==0']+[f'rd_ptr_gate(current_batch,ip{j},rd_u64(input+({start}+{t}+{j})*input_stride))'for j in range(7)]
where={}
for j in range(7):where[f'__riscv_vle8_v_i8m2(i{j}, vl)']='M=M'
for j in range(7):where[f'__riscv_vwadd_wv_i16m4(vacc16, vin{j}, vl)']=f'a=&vacc16,b=&vin{j}'
where['__riscv_vwadd_wv_i32m8(vacc, vacc16, vl)']='a=&vacc,b=&vacc16';where['__riscv_vadd_vv_i32m8(vo, vacc, vl)']='a=&vo,b=&vacc'
where['__riscv_vle32_v_i32m8(output, vl)']=f'base=output@pre,count=channels@pre,idx={k},L=rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init)'
where['__riscv_vse32_v_i32m8(output, vo, vl)']=f'base=output@pre,count=channels@pre,idx={k},L=rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init),a=&vo'
row += [f'i{j}==ip{j}'for j in range(7)]
inner += [f'i{j}==ip{j}'for j in range(7)]
a={'contract':(c/'proof/kernel-contract.txt').read_text().strip(),'invariants':[{'anchor':'  while (channels > 0) {','text':inv(common,heap)},{'anchor':'    while (r > 0) {','text':inv(row,heap+wide,True)},{'anchor':'      for (int current_batch = rdsum_min252(r); current_batch > 0; current_batch -= 7) {','text':inv(inner,heap+wide+narrow,True)}],'where':where}
(c/'proof/c/rvv.annotations.json').write_text(json.dumps(a,indent=2)+'\n')
