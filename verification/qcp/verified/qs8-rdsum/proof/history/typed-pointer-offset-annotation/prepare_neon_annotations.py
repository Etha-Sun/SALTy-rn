from pathlib import Path
import json
c=Path(__file__).resolve().parent.parent;k='(channels@pre-channels)';start='(rows@pre-r)';t='(rd_min252(r)-current_batch)'
common=['rows==rows@pre','0<rows@pre','rows@pre<=18446744073709551615','0<channels@pre','channels@pre<=4611686018427387903','0<=channels','channels<=channels@pre','input_stride==input_stride@pre','0<=input_stride','input_stride<=18446744073709551615','zero==zero@pre','params==params@pre','input@pre>0','output@pre>0','input_increment==rd_u64(7*input_stride)','rd_inputs(M,input@pre,rows@pre,channels@pre,input_stride@pre)','rd_zero_condition(M,zero@pre,rows@pre,channels@pre)']
ptr=['input==input@pre+'+k,'output==output@pre+4*'+k]
heap=['rd_mem(M)',f'IntArray::full(output@pre,channels@pre,rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{k},Init))']
def wide(tail=False):
 return[f'store(&({reg}.s{i}),int,rd_acc32(M,input@pre,input_stride@pre,{k}+{off},{start},{i},4))'for reg,off in([('vacc0',0),('vacc1',4)]if tail else[('vacc0',0),('vacc4',4),('vacc8',8),('vacc12',12)])for i in range(4)]
def narrow(tail=False):
 return[f'store(&({reg}.s{i}),short,rd_acc16(M,input@pre,input_stride@pre,{k}+{off},{start},rd_done(r,current_batch),{i},8))'for reg,off in([('vacc16',0)]if tail else[('vacc16_0',0),('vacc16_8',8)])for i in range(8)]
def inv(pure,sp,ptrs=False):
 pre='exists '+' '.join(f'(ip{j}:Z)'for j in range(7))+', 'if ptrs else''
 return '/*@ Inv Assert '+pre+' && '.join(['('+x+')'for x in pure]+[' * '.join(sp)])+' */'
def row(tail=False):
 pure=common+ptr+['0<channels','channels<16'if tail else'16<=channels','0<=r','r<=rows@pre','rd_progress(rows@pre,r)']+[f'rd_ptr_gate(r,ip{j},rd_u64(input+({start}+{j})*input_stride))'for j in range(7)]+[f'i{j}==ip{j}'for j in range(7)]
 if tail:pure+=['0<=num_batches','num_batches==rd_ceil252(r)']
 return inv(pure,heap+wide(tail),True)
def inner(tail=False):
 pure=common+ptr+['0<channels','channels<16'if tail else'16<=channels','0<r','r<=rows@pre','rd_mod252(rows@pre-r)==0','-6<=current_batch','current_batch<=rd_min252(r)','(rd_min252(r)-current_batch)%7==0']+[f'rd_ptr_gate(current_batch,ip{j},rd_u64(input+({start}+{t}+{j})*input_stride))'for j in range(7)]+[f'i{j}==ip{j}'for j in range(7)]
 if tail:pure+=['0<num_batches','num_batches==rd_ceil252(r)']
 return inv(pure,heap+wide(tail)+narrow(tail),True)
where={}
for j in range(7):
 for call in [f'vld1_s8(&i{j}[0])',f'vld1_s8(&i{j}[8])']:where[call]='M=M'
for reg in ['vacc16_0','vacc16_8','vacc16']:
 vins=[('vin0'if reg=='vacc16_0'else'vin8')]if reg!='vacc16'else[f'vin{j}'for j in range(7)]
 for v in vins:where[f'vaddw_s8({reg}, {v})']=f'a=&{reg},b=&{v}'
for a,b,half in [('vacc0','vacc16_0','low'),('vacc4','vacc16_0','high'),('vacc8','vacc16_8','low'),('vacc12','vacc16_8','high'),('vacc0','vacc16','low'),('vacc1','vacc16','high')]:where[f'vaddw_s16({a}, vget_{half}_s16({b}))']=f'a=&{a},b=&{b}'
for a,b in [('vo0','vacc0'),('vo4','vacc4'),('vo8','vacc8'),('vo12','vacc12'),('vo1','vacc1'),('vo','vacc0')]:where[f'vaddq_s32({a}, {b})']=f'a=&{a},b=&{b}'
where['vadd_s32(vo, vget_low_s32(vacc0))']='a=&vo,b=&vacc0';where['vextq_s32(vacc0, vacc0, 2)']='a=&vacc0';where['vgetq_lane_s32(vacc0, 0)']='a=&vacc0'
# Repeated textual output calls need occurrence-specific bindings. The generator
# inserts by source byte offset, so bulk and tail contracts stay exact.
output_rows=[]
def bind(call,idx,done,a=None):
 w=f'base=output@pre,count=channels@pre,idx={idx},L=rd_partial(M,input@pre,rows@pre,channels@pre,input_stride@pre,{done},Init)'+(f',a=&{a}'if a else'');output_rows.append({'call':call,'where':w})
for off in[0,4,8,12]:bind('vld1q_s32(o)',f'{k}+{off}',k)
for reg,off in[('vacc0',0),('vacc4',4),('vacc8',8),('vacc12',12)]:bind(f'vst1q_s32(output, {reg})',f'{k}+{off}',f'{k}+{off}',reg)
bind('vld1q_s32(output)',k,k);bind('vld1q_s32(output + 4)',f'{k}+4',k)
bind('vst1q_s32(output, vo0)',k,k,'vo0');bind('vst1q_s32(output, vo1)',f'{k}+4',f'{k}+4','vo1')
bind('vld1q_s32(output)',k,k);bind('vst1q_s32(output, vo)',k,k,'vo')
bind('vld1_s32(output)',f'{k}+rd_bit4(channels)',f'{k}+rd_bit4(channels)');bind('vst1_s32(output, vo)',f'{k}+rd_bit4(channels)',f'{k}+rd_bit4(channels)','vo')
a={'contract':(c/'proof/kernel-contract.txt').read_text().strip(),'invariants':[{'anchor':'  for (; channels >= 16; channels -= 16) {','text':inv(common+ptr,heap)},{'anchor':'    while (r > 0) {','text':row()},{'anchor':'      for (int current_batch = rdsum_min252(r); current_batch > 0; current_batch -= 7) {','occurrence':0,'text':inner()},{'anchor':'    } while (channels != 0);','placement':'do_condition','text':inv(common+['channels<16',f'rd_ptr_gate(channels,input,input@pre+{k})',f'rd_ptr_gate(channels,output,output@pre+4*{k})'],heap)},{'anchor':'      for (; num_batches > 0; --num_batches) {','text':row(True)},{'anchor':'        for (int current_batch = rdsum_min252(r); current_batch > 0; current_batch -= 7) {','text':inner(True)}],'where':where,'ordered_where':output_rows}
(c/'proof/c/neon.annotations.json').write_text(json.dumps(a,indent=2)+'\n')
