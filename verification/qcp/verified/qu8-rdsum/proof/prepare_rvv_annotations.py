from pathlib import Path
import json
c=Path(__file__).resolve().parent.parent;k='(channels@pre-channels)';start='(rows@pre-orig_r)';t='(rd_min252(orig_r)-current_batch)'
common=['rows==rows@pre','0<rows@pre','rows@pre<=18446744073709551615','0<channels@pre','channels@pre<=4611686018427387903','Zlength(Init)==channels@pre','rd_init_range(Init)','0<=channels','channels<=channels@pre','input_stride==input_stride@pre','0<=input_stride','input_stride<=18446744073709551615','zero==zero@pre','params==params@pre','input@pre>0','output@pre>0','input==input@pre+'+k,'output==output@pre+'+k,'input_increment==rd_u64(7*input_stride)','rd_inputs(M,input@pre,rows@pre,channels@pre,input_stride@pre)','rd_zero_condition(M,zero@pre,rows@pre,channels@pre)']
heap=['rd_mem(M)',f'UIntArray::full(output@pre,channels@pre,rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init))']
def wide(rows):return [f'store(&(vacc32.s{i}),unsigned int,rd_acc32(M,input@pre,input_stride@pre,{k},{rows},{i},vl))'for i in range(32)]
narrow=[f'store(&(vacc16.s{i}),unsigned short,rd_acc16(M,input@pre,input_stride@pre,{k},{start},rd_done(orig_r,current_batch),{i},vl))'for i in range(32)]
def inv(pure,sp,ghosts=''):
 return '/*@ Inv Assert '+('exists '+ghosts+', 'if ghosts else'')+' && '.join(['('+x+')'for x in pure]+[' * '.join(sp)])+' */'
vlpure=['0<channels','vl==rd_vl(channels)','0<vl','vl<=32','vl<=channels']
row=common+vlpure+['0<=r','r<=rows@pre','rd_progress(rows@pre,r)']+[f'rd_ptr_gate(r,ip{j},rd_u64(input+((rows@pre-r)+{j})*input_stride))'for j in range(7)]+[f'i{j}==ip{j}'for j in range(7)]
innerbase=common+vlpure+['0<=r','r<rows@pre','0<orig_r','orig_r<=rows@pre','r==orig_r-rd_min252(orig_r)','rd_mod252(rows@pre-orig_r)==0']
inner=innerbase+['-6<=current_batch','current_batch<=rd_min252(orig_r)','(rd_min252(orig_r)-current_batch)%7==0']+[f'rd_inner_gate(orig_r,current_batch,ip{j},rd_u64(input+({start}+{t}+{j})*input_stride))'for j in range(7)]+[f'i{j}==ip{j}'for j in range(7)]
where={f'__riscv_vle8_v_u8m2(i{j}, vl)':'M=M'for j in range(7)}
for j in range(7):where[f'__riscv_vwaddu_wv_u16m4(vacc16, vin{j}, vl)']=f'a=&vacc16,b=&vin{j}'
where['__riscv_vwaddu_wv_u32m8(vacc32, vacc16, vl)']='a=&vacc32,b=&vacc16';where['__riscv_vadd_vv_u32m8(vo, vacc32, vl)']='a=&vo,b=&vacc32'
for call in ['__riscv_vle32_v_u32m8(output, vl)','__riscv_vse32_v_u32m8(output, vo, vl)']:where[call]=f'base=output@pre,count=channels@pre,idx={k},L=rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init)'
a={'contract':(c/'proof/kernel-contract.txt').read_text().strip(),'invariants':[{'anchor':'  while (channels > 0) {','text':inv(common,heap)},{'anchor':'    while (r > 0) {','text':inv(row,heap+wide('(rows@pre-r)'),' '.join(f'(ip{j}:Z)'for j in range(7)))},{'anchor':'      for (; current_batch > 0; current_batch -= 7) {','text':inv(inner,heap+wide(start)+narrow,'(orig_r:Z) '+' '.join(f'(ip{j}:Z)'for j in range(7)))}],'where':where,'additional_frontend_headers':['join_model.h','store_model.h','initial_range.h','progress_model.h'],'assertions':[]}
raw=(c/'impl/testRVV.c').read_text()
for step,condition in [(1,'< 2'),(2,'<= 2'),(3,'< 4'),(4,'<= 4'),(5,'< 6'),(6,'<= 6')]:
 pure=innerbase+['0<current_batch','current_batch<=rd_min252(orig_r)','(rd_min252(orig_r)-current_batch)%7==0']
 for j in range(7):
  normal=f'rd_u64(input+({start}+{t}+{j})*input_stride)';v=f'rd_select_ptr(current_batch,{j},{normal},zero)'if 1<=j<=step else normal;pure.append(f'i{j}=={v}')
 text='/*@ Assert exists (orig_r:Z), '+' && '.join(['('+x+')'for x in pure]+[' * '.join(heap+wide(start)+narrow)])+' */';anchor=f'        if XNN_UNPREDICTABLE(current_batch {condition}) {{\n          i{step} = zero;\n        }}';assert anchor in raw;a['assertions'].append({'after':anchor,'text':text})
pure=common+vlpure+['r==0']+[f'i{j}==ip{j}'for j in range(7)]
newheap=['rd_mem(M)',f'UIntArray::full(output@pre,channels@pre,rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k}+vl,Init))']
vo=[f'store(&(vo.s{i}),unsigned int,rd_splat(rd_result_lane(M,input@pre,rows@pre,input_stride@pre,{k}+{i},Init),{i},vl))'for i in range(32)]
text='/*@ Assert exists '+' '.join(f'(ip{j}:Z)'for j in range(7))+', '+' && '.join(['('+x+')'for x in pure]+[' * '.join(newheap+wide('rows@pre')+vo)])+' */';a['assertions'].append({'after':'    __riscv_vse32_v_u32m8(output, vo, vl);','text':text})
(c/'proof/c').mkdir(exist_ok=True);(c/'proof/c/rvv.annotations.json').write_text(json.dumps(a,indent=2)+'\n')
