from pathlib import Path
import json,csv,math,statistics,sys,re
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
R=Path(__file__).resolve().parent
preview='--preview' in sys.argv
if preview:
 rows=[]
 for p in (R/'runs').glob('*/rtl.log'):
  vals=[{'n':int(n),'trial':int(t),'cycles':int(c)} for n,t,c in re.findall(r'CYCLE_COUNTER n(\d+)-t(\d+) (\d+)',p.read_text())]
  assert len(vals)==21
  rows.append({'name':p.parent.name,'passed':False,'status':'RTL final output check pending','samples':vals,'median_cycles':{str(n):statistics.median(x['cycles'] for x in vals if x['n']==n) for n in [16,64,256,1024,4096,16384,65536]}})
 (R/'timing-preview.json').write_text(json.dumps(rows,indent=2)+'\n')
else:
 rows=json.loads((R/'results.json').read_text());assert all(x['passed'] for x in rows)
names=['xnn-u4','xnn-u8','optimized','repaired'];data={x['name']:x for x in rows};ns=[16,64,256,1024,4096,16384,65536]
records=[]
for n in ns:
 c={k:data[k]['median_cycles'][str(n)] for k in names}
 records.append({'elements':n,**{k+'_cycles':c[k] for k in names},'optimized_speedup_vs_xnn_u8':c['xnn-u8']/c['optimized'],'repaired_speedup_vs_xnn_u8':c['xnn-u8']/c['repaired'],'repair_runtime_increase_pct':100*(c['repaired']/c['optimized']-1),'repair_throughput_loss_pct':100*(1-c['optimized']/c['repaired'])})
with (R/'per-size.csv').open('w') as f:w=csv.DictWriter(f,fieldnames=list(records[0]));w.writeheader();w.writerows(records)
gm=lambda xs:math.exp(statistics.mean(math.log(x) for x in xs))
summary={'rtl_validation_pending':preview,'geomean_speedup_vs_xnn_u8':{k:gm(data['xnn-u8']['median_cycles'][str(n)]/data[k]['median_cycles'][str(n)] for n in ns) for k in names},'geomean_repair_runtime_ratio':gm(x['repaired_cycles']/x['optimized_cycles'] for x in records),'per_size':records}
(R/'summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
# Adapted grouped-bar/hatched style from bundled bar_spice.py; source template retained.
plt.rcParams.update({'font.family':'serif','font.serif':['DejaVu Serif'],'font.size':9,'pdf.fonttype':42,'ps.fonttype':42,'hatch.linewidth':0.65})
fig,ax=plt.subplots(figsize=(7.2,3.15));fig.subplots_adjust(left=.10,right=.99,bottom=.18,top=.78)
labels=['XNNPACK u4v','XNNPACK u8v','Keagan optimized','NaN repair'];colors=['#bfc2c4','#777d83','#6c8ba4','#ad8164'];hatches=['','','','///'];x=np.arange(8);width=.19
for j,(k,label,col,hat) in enumerate(zip(names,labels,colors,hatches)):
 vals=[data['xnn-u8']['median_cycles'][str(n)]/data[k]['median_cycles'][str(n)] for n in ns]+[summary['geomean_speedup_vs_xnn_u8'][k]]
 ax.bar(x+(j-1.5)*width,vals,width=width,color=col,hatch=hat,edgecolor='white',linewidth=.5,label=label,zorder=3)
 ax.text(7+(j-1.5)*width,vals[-1]+.025,f'{vals[-1]:.2f}',ha='center',va='bottom',fontsize=7,rotation=90)
ax.axhline(1,color='#555555',linestyle='--',linewidth=.8,zorder=2)
ax.axvline(6.5,color='#dddddd',linewidth=.7)
ax.set_xticks(x,labels=['16','64','256','1,024','4,096','16,384','65,536','GM'])
ax.set_xlabel('Input elements');ax.set_ylabel('Speedup over XNNPACK u8v')
ax.set_ylim(0,1.3);ax.set_yticks([0,.25,.5,.75,1,1.25],labels=['0','0.25','0.50','0.75','1.00','1.25'])
ax.yaxis.grid(True,color='#eeeeee',linewidth=.6,zorder=0);ax.set_axisbelow(True)
ax.spines[['top','right']].set_visible(False);ax.tick_params(axis='x',length=0)
fig.legend(ncol=2,loc='upper center',bbox_to_anchor=(.54,.98),frameon=False,columnspacing=2)
for ext in ['png','pdf','svg']:fig.savefig(R/f'figures/vmax-performance.{ext}',dpi=300)
(R/'figures/caption.md').write_text('Measured vmax performance on the same Saturn RTL configuration (VLEN512, DLEN256). Each bar uses the median of three timed calls after one warm call; GM is the geometric mean across seven input lengths. Higher is faster; XNNPACK u8v is the fixed normalization baseline. Inputs are finite, and all measured outputs match on these inputs. The optimized and XNNPACK implementations do not propagate a single NaN like the NEON reference; their bars are performance references, not evidence of full-domain equivalence. The repaired implementation passed emulator regressions but has not received a complete formal proof. Raw samples are retained; no confidence intervals are claimed.\n')
(R/'figures/figure_catalog.json').write_text(json.dumps({'surface_class':'internal_review','data':'../timing-preview.json' if preview else '../results.json','script':'../summarize.py','exports':['vmax-performance.png','vmax-performance.pdf','vmax-performance.svg'],'comparison':'same-platform finite-input performance and NaN repair cost','review':'pending'},indent=2)+'\n')
g=summary['geomean_repair_runtime_ratio'];speeds=summary['geomean_speedup_vs_xnn_u8'];table='\n'.join(f"| {x['elements']:,} | {x['xnn-u4_cycles']:,} | {x['xnn-u8_cycles']:,} | {x['optimized_cycles']:,} | {x['repaired_cycles']:,} | {x['optimized_speedup_vs_xnn_u8']:.3f}× | {x['repair_runtime_increase_pct']:.1f}% |" for x in records)
report=f'''# vmax 的同平台性能测量

本次测的是 35 个最终输出中的 vmax，未测 vmin。四个实现使用相同的有限输入、编译器、Saturn RTL 配置与计时流程。

## 结论

- 相对 XNNPACK u8v，Keagan 最终优化版的七尺寸几何平均速度为 **{speeds['optimized']:.3f}×**，修复版为 **{speeds['repaired']:.3f}×**。本轮没有显示最终版有明显优势。
- 修复后周期相对优化版增加 **{(g-1)*100:.1f}%**（周期比的几何平均），等价于吞吐下降 **{(1-1/g)*100:.1f}%**。这两个百分比的分母不同，不能混用。
- 修复成本随尺寸变化，见下表。它保留原循环和 LMUL，只在两处 min/max 后分别增加 4 条 C 语句：两次 NaN 检测、一次 mask OR、一次 canonical NaN 选择。
- 当前不宜把 vmax 写成“优化显著快于 XNNPACK，且修复几乎无损”的主例。它已有很清楚的语义模型诊断证据，可以保留为正确性案例。

## 逐尺寸周期

每格取一次独立启动内预热一次后 3 次计时的中位数。不是 3 个独立进程或随机种子，也没有置信区间。

| 输入元素数 | XNN u4v | XNN u8v | Keagan 最终版 | NaN 修复版 | 最终版 / XNN u8v 速度 | 修复周期增加 |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: |
{table}

GM 对每种尺寸等权，不按真实应用频率加权。三次原始样本均保存在 [results.json](results.json)，包括较慢的首个计时样本，未只选最快样本。小幅差异不足以支持显著优越性的结论。

![Performance](figures/vmax-performance.png)

图：同一 Saturn RTL 配置中的有限输入性能。纵轴为 XNNPACK u8v 周期 / 当前实现周期，越高越快，GM 为七尺寸几何平均。原优化版和 XNNPACK 的单侧 NaN 行为均不同于 NEON，图中的速度不能作为其全域等价性证据。修复版已做回归检查，尚未完成正式证明。没有使用模拟数据。

## 平台与测量协议

- 本地 Verilator Saturn RTL，GENV512D256ShuttleConfig，VLEN512/DLEN256，DRAMSim2，seed1，日志报告 CPU 500 MHz、DRAM 666.7 MHz。直接报告目标 cycles，不是宿主运行时间或 QEMU 指令数。
- 四个 simulator 使用独立工作目录并行运行，避免 DRAM 输出文件相互覆盖。
- GCC 15.2.0，O3，RV64GCV，关闭 FP contraction，未开 fast-math。每个 kernel 单独编译，统一添加 noipa，tester 禁止自动向量化。完整命令、ELF、源码、模拟器和 DRAM 配置哈希均保留。
- 输入为相同的预生成有限数序列，直接放入 ELF，输出按 4096 字节对齐。数据生成和逐元素输出检查在计时区外。每个尺寸一次预热，随后三次 fence/rdcycle 计时，fence 成本包含在结果中。
- 各尺寸测量后检查全部有限输入输出以及输出区外哨兵。所有四个 RTL 运行均输出 PASS。
- 未测含 NaN 的输入分布性能；修复代码没有根据“测试没有 NaN”关闭检查。
- 这不是 Keagan 论文性能的精确复现。硬件 preset、编译器、输入与计时配置需要单独对齐；本次只建立四版本之间一致的本地对照。

## 来源与正确性边界

Keagan 源码来自 `optimized-rvv-kernels@80feb4564cb470de301062109b6f89db672bdf9d`。XNNPACK 来自 `867d5a344790802ee067be62f572c2e2722bf6fb` 的 u4v、u8v 文件，仅重命名入口为 test_rvv。保留原源码，不把适配副本冒充上游文件。

XNNPACK u4v/u8v 和 Keagan 原版在单侧 NaN 输入时都返回数值操作数。因而有限输入性能比较的计算任务相同，修复版承担了额外的 NEON NaN 传播语义。本轮不据此断言 XNNPACK 违反其自身 API 契约。

计时所用的同一个 GCC kernel 对象先在 QEMU VLEN128/256/512 检查。每版本 180 个调用覆盖单侧 NaN、双侧 NaN和有限输入；修复版另外与未改动的 ARM NEON 做混合 lane 比较，每个 VLEN 比较 1,762 个输出，含 qNaN、sNaN、Inf、正负零、subnormal 和伪随机位模式。按数值相等或双方 NaN 比较，全部通过。这些是新回归测试，不替代全输入形式证明或实际芯片测量。

## 工件

- [结构化汇总](summary.json)、[逐尺寸 CSV](per-size.csv)、[原始样本](results.json)、[环境](environment.json)。
- [修复 diff](repair.patch)、[修复源码](sources/repaired.c)、[最终原源码](sources/optimized.c)。
- [测量脚本](measure.py)、[混合输入检查](mixed-check/results.json)、[绘图与汇总脚本](summarize.py)。
- [PDF 图](figures/vmax-performance.pdf)、[SVG 图](figures/vmax-performance.svg)。

## 可解释范围

反汇编确认修复额外执行了 vmfne、vmor 和 vfmerge。性能变化与这组代码改动一起出现，但此次没有做硬件计数器或瓶颈消融，不能把全部增量归因于某条指令。最大尺寸上四个版本更接近，可能与访存成本占比有关，这只是解释候选。
'''
if preview:
 report=report.replace('(results.json)','(timing-preview.json)')
 report=report.replace('所有四个 RTL 运行均输出 PASS。','RTL 的最终全量输出检查仍在进行，不能据此声称 RTL PASS。')
 report='> 周期采集完成，RTL 最终输出检查待完成；以下为待验收稿。\n\n'+report
 (R/'figures/caption.md').write_text((R/'figures/caption.md').read_text()+'RTL final output validation is pending.\n')
(R/('REPORT.preview.zh-CN.md' if preview else 'REPORT.zh-CN.md')).write_text(report)
