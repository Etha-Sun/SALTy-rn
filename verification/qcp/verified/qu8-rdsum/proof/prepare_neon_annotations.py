from pathlib import Path
import json
c=Path(__file__).resolve().parent.parent;k='(channels@pre-channels)';start='(rows@pre-r)';t='(rd_min252(r)-current_batch)'
common=['rows==rows@pre','0<rows@pre','rows@pre<=18446744073709551615','0<channels@pre','channels@pre<=4611686018427387903','Zlength(Init)==channels@pre','rd_init_range(Init)','0<=channels','channels<=channels@pre','input_stride==input_stride@pre','0<=input_stride','input_stride<=18446744073709551615','zero==zero@pre','params==params@pre','input@pre>0','output@pre>0','input_increment==rd_u64(7*input_stride)','rd_inputs(M,input@pre,rows@pre,channels@pre,input_stride@pre)','rd_zero_condition(M,zero@pre,rows@pre,channels@pre)']
ptr=['input==input@pre+'+k,'output==output@pre+'+k]
heap=['rd_mem(M)',f'UIntArray::full(output@pre,channels@pre,rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init))']
def wide(tail=False):
 return[f'store(&({reg}.s{i}),unsigned int,rd_acc32(M,input@pre,input_stride@pre,{k}+{off},{start},{i},4))'for reg,off in([('vacc0',0),('vacc1',4)]if tail else[(f'vacc{j}',j)for j in range(0,32,4)])for i in range(4)]
def narrow(tail=False):
 return[f'store(&({reg}.s{i}),unsigned short,rd_acc16(M,input@pre,input_stride@pre,{k}+{off},{start},rd_done(r,current_batch),{i},8))'for reg,off in([('vacc16',0)]if tail else[('vacc16_4',0),('vacc16_12',8),('vacc16_20',16),('vacc16_28',24)])for i in range(8)]
def inv(pure,sp,ptrs=False):
 pre='exists '+' '.join(f'(ip{j}:Z)'for j in range(7))+', 'if ptrs else''
 return '/*@ Inv Assert '+pre+' && '.join(['('+x+')'for x in pure]+[' * '.join(sp)])+' */'
def row(tail=False):
 pure=common+ptr+['0<channels','channels<32'if tail else'32<=channels','0<=r','r<=rows@pre','rd_progress(rows@pre,r)']+[f'rd_ptr_gate(r,ip{j},rd_u64(input+({start}+{j})*input_stride))'for j in range(7)]+[f'i{j}==ip{j}'for j in range(7)]
 if tail:pure+=['0<=num_batches','num_batches==rd_ceil252(r)']
 return inv(pure,heap+wide(tail),True)
def inner(tail=False):
 pure=common+ptr+['0<channels','channels<32'if tail else'32<=channels','0<r','r<=rows@pre','rd_mod252(rows@pre-r)==0','-6<=current_batch','current_batch<=rd_min252(r)','(rd_min252(r)-current_batch)%7==0']+[f'rd_inner_gate(r,current_batch,ip{j},rd_u64(input+({start}+{t}+{j})*input_stride))'for j in range(7)]+[f'i{j}==ip{j}'for j in range(7)]
 if tail:pure+=['0<num_batches','num_batches==rd_ceil252(r)']
 return inv(pure,heap+wide(tail)+narrow(tail),True)
where={}
for j in range(7):
 where[f'vld1_u8(&i{j}[0])']='M=M'
 for off in [0,8,16,24]:where[f'vld1q_u8(&i{j}[{off}])']='M=M'
for off in [4,12,20,28]:where[f'vaddw_u8(vacc16_{off}, vget_low_u8(vin{off}))']=f'a=&vacc16_{off},b=&vin{off}'
for j in range(7):where[f'vaddw_u8(vacc16, vin{j})']=f'a=&vacc16,b=&vin{j}'
for off in range(0,32,8):
 for out,half in [(off,'low'),(off+4,'high')]:where[f'vaddw_u16(vacc{out}, vget_{half}_u16(vacc16_{off+4}))']=f'a=&vacc{out},b=&vacc16_{off+4}'
for out,half in [(0,'low'),(1,'high')]:where[f'vaddw_u16(vacc{out}, vget_{half}_u16(vacc16))']=f'a=&vacc{out},b=&vacc16'
for off in range(0,32,4):where[f'vaddq_u32(vo{off}, vacc{off})']=f'a=&vo{off},b=&vacc{off}'
for a,b in [('vo1','vacc1'),('vo','vacc0')]:where[f'vaddq_u32({a}, {b})']=f'a=&{a},b=&{b}'
where['vadd_u32(vo, vget_low_u32(vacc0))']='a=&vo,b=&vacc0';where['vextq_u32(vacc0, vacc0, 2)']='a=&vacc0';where['vgetq_lane_u32(vacc0, 0)']='a=&vacc0'
# Repeated textual output calls need occurrence-specific bindings. The generator
# inserts by source byte offset, so bulk and tail contracts stay exact.
output_rows=[]
def bind(call,idx,done,a=None):
 w=f'base=output@pre,count=channels@pre,idx={idx},L=rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{done},Init)'+('');output_rows.append({'call':call,'where':w})
for off in range(0,32,4):bind('vld1q_u32(o)',f'{k}+{off}',k)
for reg,off in[(f'vacc{j}',j)for j in range(0,32,4)]:bind(f'vst1q_u32(output, {reg})',f'{k}+{off}',f'{k}+{off}',reg)
bind('vld1q_u32(output)',k,k);bind('vld1q_u32(output + 4)',f'{k}+4',k)
bind('vst1q_u32(output, vo0)',k,k,'vo0');bind('vst1q_u32(output, vo1)',f'{k}+4',f'{k}+4','vo1')
bind('vld1q_u32(output)',k,k);bind('vst1q_u32(output, vo)',k,k,'vo')
bind('vld1_u32(output)',f'{k}+rd_bit4(channels)',f'{k}+rd_bit4(channels)');bind('vst1_u32(output, vo)',f'{k}+rd_bit4(channels)',f'{k}+rd_bit4(channels)','vo')
a={'contract':(c/'proof/kernel-contract.txt').read_text().strip(),'invariants':[{'anchor':'  for (; channels >= 32; channels -= 32) {','text':inv(common+ptr,heap)},{'anchor':'    while (r > 0) {','text':row()},{'anchor':'      for (int current_batch = rdsum_min252(r); current_batch > 0; current_batch -= 7) {','occurrence':0,'text':inner()},{'anchor':'    while (channels != 0) {','text':inv(common+['channels<32',f'rd_ptr_gate(channels,input,input@pre+{k})',f'rd_ptr_gate(channels,output,output@pre+{k})'],heap)},{'anchor':'      for (; num_batches > 0; --num_batches) {','text':row(True)},{'anchor':'        for (int current_batch = rdsum_min252(r); current_batch > 0; current_batch -= 7) {','text':inner(True)}],'where':where,'ordered_where':output_rows}
(c/'proof/c/neon.annotations.json').write_text(json.dumps(a,indent=2)+'\n')
