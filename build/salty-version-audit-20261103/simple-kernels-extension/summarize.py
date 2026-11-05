"""Validate completed source/ELF bindings and summarize every sample, including failures."""
import csv,json,statistics,hashlib
from pathlib import Path
from bench_simple import HERE,KERNELS,SIZES,ROLES,HEAVY,sizes_for,run_dir,sha,write

protocol=json.loads((HERE/'protocol.json').read_text())
source=json.loads((HERE/'sources.json').read_text())
for s in source:assert sha(Path(s['snapshot']))==s['sha256']
all_runs=[];raw=[];comparison=[]
for k in KERNELS:
 f=HERE/'fixtures'/k;assert sha(f/'data.h')==json.loads((f/'manifest.json').read_text())['header_sha256']
 for n in sizes_for(k):
  roles={}
  for role in ROLES+(['E-frozen'] if k in ['f32-vmin','f32-vmax'] else []):
   d=run_dir(k,role,n);p=d/'result.json'
   j=json.loads(p.read_text()) if p.exists() else dict(valid=False,stage='not_started')
   r=dict(kernel=k,n=n,role=role,valid=j['valid'],result=str(p),stage=j.get('stage'),returncode=j.get('returncode'),error=j.get('error'),cycles=j.get('min_cycles'))
   if j['valid']:
    b=json.loads((d/'build.json').read_text());assert json.loads((d/'native.json').read_text())['valid']
    assert j['binary_sha256']==sha(d/'test.elf') and j['simulator_sha256']==protocol['simulator_sha256']
    assert b['source_sha256']==sha(Path(b['source'])) and b['compiled_source_sha256']==sha(d/'kernel.c') and b['harness_sha256']==sha(d/'main.c')
    assert b['compiler_sha256']==sha(Path(b['kernel_command'][0]))
    assert len(j['samples'])==3 and all(s['correct'] for s in j['samples'])
    r.update(compiler_sha256=b['compiler_sha256'],binary_sha256=j['binary_sha256'],warm_calls=b['warm_calls'],median_cycles=statistics.median(s['cycles'] for s in j['samples']),all_cycles=[s['cycles'] for s in j['samples']])
   for s in j.get('samples',[]):raw.append(dict(kernel=k,n=n,role=role,run_valid=j['valid'],repeat=s['repeat'],cycles=s['cycles'],instret=s['instret'],correct=s['correct'],independently_checked=True,result=str(p)))
   all_runs.append(r);roles[role]=r
  if k not in ['f32-vmin','f32-vmax']:
   a=HERE/'sources'/k/'A-target.c';e=HERE/'sources'/k/'E-frozen.c'
   roles['E-frozen']={**roles['A-target'],'alias_of':'A-target: byte-identical frozen source; same measured ELF reused'} if sha(a)==sha(e) else dict(valid=False,stage='not_started')
  def cyc(role):return roles[role].get('cycles') if roles[role]['valid'] else None
  a,c,d,e=[cyc(role) for role in ROLES+['E-frozen']]
  compilers={v['compiler_sha256'] for v in roles.values() if v['valid']};assert len(compilers)<=1
  comparison.append(dict(kernel=k,n=n,target_cycles=a,optimized_cycles=c,xnnpack_cycles=d,frozen_cycles=e,target_over_optimized=a/c if a and c else None,xnnpack_over_optimized=d/c if d and c else None,frozen_over_target=e/a if a and e else None,roles=roles))
write(HERE/'all-runs.json',all_runs);write(HERE/'comparison.json',comparison)
legacy=[]
for k in HEAVY:
 for p in (HERE/'runs'/k).glob('*/n*/result.json'):
  if p.parent.name.endswith('-warm1'):continue
  legacy.append(dict(evidence=str(p),result=json.loads(p.read_text()),excluded_reason='legacy warm5 profile; never mixed with warm1 primary comparison'))
write(HERE/'legacy-warm5-runs.json',legacy)
for name,rows,keys in [('raw-cycles.csv',raw,list(raw[0]) if raw else []),('comparison.csv',comparison,[k for k in comparison[0] if k!='roles'])]:
 with (HERE/name).open('w') as f:
  w=csv.DictWriter(f,fieldnames=keys);w.writeheader();w.writerows({k:r[k] for k in keys} for r in rows)
v=lambda x:f'{x:,}' if x is not None else '—'
rat=lambda x:f'{x:.3f}×' if x is not None else '—'
passed=sum(r['valid'] for r in all_runs)
lines=['# 简单 kernel 扩展实测','','新增8类kernel：六类测1024/1031元素，VDIV/VSQRT测128/135元素。用户已撤销先前账户配额停止线；每项仍使用有限运行预算，所有性能任务串行。这里只报告本轮新测数据，没有重跑或覆盖旧实验。','',f'状态：{passed}/52 个预定物理程序运行通过；完整三版对照 {sum(all(r[x] for x in ["target_cycles","optimized_cycles","xnnpack_cycles"]) for r in comparison)}/16 组。—表示尚无有效RTL周期，不计加速比。','','| Kernel | 元素数 | target A | 公开优化 C | XNNPACK u8v D | 冻结修复 E | A/C | D/C | E/A |','|---|---:|---:|---:|---:|---:|---:|---:|---:|']
for r in comparison:lines.append('| '+r['kernel']+' | '+str(r['n'])+' | '+' | '.join(v(r[k]) for k in ['target_cycles','optimized_cycles','xnnpack_cycles','frozen_cycles'])+' | '+' | '.join(rat(r[k]) for k in ['target_over_optimized','xnnpack_over_optimized','frozen_over_target'])+' |')
lines+=['','每组共用GCC15.2/O3/RV64GCV/lp64d/ffp-contract=off、同一Shuttle/Saturn VLEN512/DLEN256 RTL、输入、参数和计时窗口。独立TU，无LTO；VDIV/VSQRT候选预热一次，其余预热五次，均计时三次，每次逐位检查输出与两侧canary。表中取三次最小值，原始CSV保留所有采样，all-runs.json另列中位数。此协议是本地补充测量，不冒充论文出图协议。没有cache flush，ELF绝对地址未固定，不将几个百分点的差异解释为稳定收益或单因素效果。','',
'输入覆盖正负有限值和符号零；除数严格为正，sqrt输入非负，LeakyReLU slope=0.125。只测共同有限输入域，不测试NaN传播合同；VMIN/VMAX的冻结修复仍实际执行NaN处理代码。离线oracle用精确Fraction核对float32最近偶数舍入边界，sqrt核对平方后的中点边界；未从任何候选输出生成gold。所有主输入、输出64字节对齐，byte batch=N*4，1031长度有7元素尾部。','',
'实际kernel函数调用位于fence+rdcycle/rdinstret窗口中；AVL=0重置合法。准备、输出清零、正确性检查、打印均在窗口外。先用同一GNU kernel对象在QEMU功能预检，其周期一律丢弃；有效周期仅来自RTL。测试通过不构成新的形式证明。','',
'target为本轮工作区冻结副本；C固定公开optimized仓库80feb456/597c1d2；D固定本地XNNPACK867d5a34的u8v候选（已查工作文件与提交blob一致），未搜索最佳变体，也未声称就是旧论文手写符号。E固定821969733：六个与A字节一致的源码复用A测量，VMIN/VMAX另行编译实测。全部来源、符号、源码hash、编译命令、对象、ELF、native/RTL日志、三次原始cycles保留。','',
'证据：[sources.json](sources.json)、[protocol.json](protocol.json)、[comparison.csv](comparison.csv)、[raw-cycles.csv](raw-cycles.csv)、[all-runs.json](all-runs.json)、[CONTINUE.json](CONTINUE.json)。']
bad=[r for r in all_runs if not r['valid'] and r.get('stage')!='not_started']
if bad:
 lines+=['','未完成/失败记录：']
 for r in bad:lines.append(f'- {r["kernel"]} N={r["n"]} {r["role"]}: {r["stage"] or r["returncode"]}; {r["result"]}')
lines+=['','VDIV旧warm5/120秒记录和未启动的旧槽位保留于[legacy-warm5-runs.json](legacy-warm5-runs.json)，不计入warm1主结果。候选的超时不等于源码错误。']
if (HERE/'vmul-code-identity-control.json').exists():
 lines+=['','VMUL身份对照：A与C的GNU kernel .text SHA256相同，1024/1031两个尺寸下三次周期序列也分别完全相同。公开优化文件在这一项没有编译后代码或实测周期变化，见[机器码对照](vmul-code-identity-control.json)。']
if (HERE/'timing-window-validation.json').exists():
 lines+=['','最终ELF计时窗口核对见 [timing-window-validation.json](timing-window-validation.json)。主尺寸柱图：[PNG](simple-kernels-main.png)、[PDF](simple-kernels-main.pdf)；含尾部柱图：[PNG](simple-kernels-tail.png)、[PDF](simple-kernels-tail.pdf)。']
(HERE/'REPORT.zh-CN.md').write_text('\n'.join(lines)+'\n')
write(HERE/'artifact-validation.json',dict(validated_passed_runs=passed,planned_runs=52,source_snapshots_verified=len(source),complete_three_version_points=sum(all(r[x] for x in ['target_cycles','optimized_cycles','xnnpack_cycles']) for r in comparison),claim_scope='current RTL finite test inputs only; no new proof',failures=bad))
print('PASS',passed,'/52; complete three-version points',sum(all(r[x] for x in ['target_cycles','optimized_cycles','xnnpack_cycles']) for r in comparison),'/16')
for r in comparison:print(r['kernel'],r['n'],r['target_cycles'],r['optimized_cycles'],r['xnnpack_cycles'],r['frozen_cycles'])
