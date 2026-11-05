import json,math
from pathlib import Path
import collect
OUT=collect.OUT
read=lambda p:json.loads(p.read_text())
rows=read(OUT/'comparison.json');identity=read(OUT/'identity.json');state=read(OUT/'CONTINUE.json')
def v(n):return f'{n:,}' if n is not None else '—'
def ratio(n):return f'{n:.3f}×' if n is not None else '—'
def case(r):
 return 'n1024' if r['kernel']=='f32-vmulc' else read(OUT/'fixtures'/r['kernel']/'manifest.json')['shapes'][int(r['shape'].split('-')[0])]['tag']
lines=['# RVV target 来源审计与已有版本 RTL 实测','',f'日期：2026-11-03。状态：`{state["status"]}`。**近似论文协议：主表使用合法AVL=0重置和统一64字节对齐；未建立旧论文出图源码/完整硬件绑定。**','',
'当前工作区 HEAD 为 `978bc31b8d005122f8256605dc376bf3959e4d16`，分支 `feat/assembly-reduction-lean`。测量使用本次冻结副本，保留其他工作与历史实验。未调用外部模型、启动优化搜索或创建 agent。','',
'## 1. target 是哪个阶段','',
'当前37个target文件中，35个与作者首次公开、已取到的catalog原件字节相同；GEMM有本地未提交NaN/FMA修复；u8-vclamp为空文件，不计作有效kernel。此前36个一致的统计误含该空快照，现予更正，见source-identity-correction.json。此处当前37文件与冻结QCP证明包绑定的40份原件是不同清单。没有 target 与公开 optimized 仓库的对应文件逐字节相同。`f32-vmul` 的入口函数体在忽略注释/空白后同时与公开优化文件相同，不能仅凭该函数体区分阶段；五个重点案例则有实际实现差异。','',
'证据不限于目录名：已核对首次引入提交、完整源码 SHA256、入口函数体及差异。作者流水线 `optimize/bridge.py` 明确将 catalog target 作为 baseline，优化后写到 `target_optimized`，不覆盖原 baseline。该目录在已检查作者历史中没有可恢复的提交输出。','',
'**准确结论是“公开 catalog 的翻译 baseline”，不是“已确认的旧论文初始计时文件”；也没有任何一个被证实为旧论文优化柱的原文件。** PDF 元数据为 2026-06-16，四个重点 catalog 文件首次加入于 2026-06-24，公开 optimized 快照为 2026-07-13。日期是来源线索，不足以断定论文实际使用的未提交源码。','',
'| 案例 | A 当前 target / B catalog 初始 | C 可恢复的公开优化来源 | 主要实际差异 |',
'|---|---|---|---|',
'| Exp | A=B，`6f126ff`；degree-5、magic-bias、m4 动态 VL | 作者 XNNPACK `a5fdb3b` 引入、分支 HEAD `8b32b607`，p6-o-u2v/u4v | degree-6、整数转换改用 i32、提前加载下一块；公开 optimized-kernels 仓库没有 Exp 文件 |',
'| Transpose | A=B，`6f126ff`；m8 按输入行 load、跨步 store | optimized-kernels `597c1d2` 的 `x32transpose.c`；入口体与 XNNPACK `4b9b7b3` 分支的 8xv2 相同 | 按高度取 VL，8 列分段加载、连续输出 |',
'| VMULC | A=B=E，`f8f291c`；每轮动态 vsetvl | optimized-kernels `597c1d2` | VLMAX 外提，满向量循环加独立尾部 |',
'| FP32 GEMM | B=`6f126ff`，NR8；A 另加本地 FMA/NaN 处理 | optimized-kernels `597c1d2` 的 FP32 `f32-gemm-minmax.c` | 按 mr 分支，mr=1 专门路径、两块输出和 K 展开；不是 QD8/QC8W |',
'| DWConv CHW | A=B，`6f126ff`，三输出行、m2 | optimized-kernels `597c1d2` 的 `dwconv2d-chw.c` | 两输出行、m4，共享中间行 |','',
'D 是恢复的 XNNPACK 手写候选，作者 fork `master=9263081d`：VMULC u4v/u8v、Exp p6-u4v、Transpose 16x8、FP32 GEMM 1x4v（VLEN512 下 NR64）、DWConv 3x3p1 1x2v（与公开 Autocomp reference 入口体一致；3x2v 只另存源码）。没有证据将这些具体符号全部绑定到旧论文柱子。E 固定 `821969733d7953a212c51839194add416fd5799b`，只衡量该冻结修复的成本。','',
'另已单独冻结 Autocomp 的公开 reference：VMULC 与 catalog 相同（忽略 restrict）；Transpose 与手写 16x8 函数体相同；Exp 则是另一份 degree-6 实现。reference 身份不能自动解释为“初始生成版本”。','',
'全37项 A/B/C/E 主文件及 D 家族候选账本见 [catalog-ABCDE.json](catalog-ABCDE.json)（35份公开优化文件（缺Exp和SPMM）、37份821冻结主文件）；D候选未自动视作ABI/packing匹配或论文原件。逐文件提交、符号、SHA256：见 [sources.json](sources.json)、[identity.json](identity.json)、[identity.csv](identity.csv)。原始源码和 unified diff 在 [sources/](sources/)。','',
'此前比较须逐份判断：第五轮 GEMM/IGEMM baseline 与公开优化文件仅差 include 指令，确实使用了公开优化输出；第五轮 Exp 是 catalog 译文，第七轮最终 Keagan Exp 仍选择较快的 catalog target；第九轮四个起点也明确来自初始 target。不能把所有既往 Keagan 柱统一解释成论文优化版本，也不能一概说所有旧基线均取错。证据：[prior-comparison-bindings.json](evidence/prior-comparison-bindings.json)。','','## 2. 同环境实测 cycles','',
'以下主表只收录合法AVL=0重置、统一64字节对齐、ELF正常结束且输出检查通过的RTL数字。早期字面复用作者reset的执行记录含VLMAX变化时的保留用法，单独保存在all-runs.json中，execution_passed与protocol_defined分开，不混入主表。— 表示未完成，不使用超时或错误输出计算加速比。Exp 主列采用 u4v，u2v 作为补充保留；VMULC 主列手写采用 u8v，u4v 也已测。','',
'Exp/VMULC/GEMM 使用 GCC15.2；Transpose/DWConv 使用 Clang20.1.2 的独立兼容对照组，四个版本的 kernel/helper 均用该编译器，公共标量驱动仍固定 GCC15.2。同一行的所有候选共用编译器、输入、硬件和协议，**没有用 Clang 优化版除以 GCC target**。Transpose 下列三尺寸为全体未预热单调用的补充测量；更贴近公开预热协议的 128² 完整案例单列。','',
'| 案例/形状 | A target | C 公开优化 | D 手写 | E 冻结修复 | A/C | D/C |',
'|---|---:|---:|---:|---:|---:|---:|']
for r in rows:
 k=r['kernel'];s=r['shape'];tag=case(r)
 lines.append(f'| {collect.NAMES[k]} {tag} | {v(r["target_cycles"])} | {v(r["optimized_cycles"])} | {v(r["manual_cycles"])} | {v(r["frozen_cycles"])} | {ratio(r["target_over_optimized"])} | {ratio(r["manual_over_optimized"])} |')
warm=[r for r in read(OUT/'all-runs.json') if r['kernel']=='x32-transposec' and r['shape']=='0-warm5-avl0-aligned64-clang-diagnostic']
lines+=['','Transpose 128²，Clang 同编译器、每个候选预热5次后计时1次（全部实际调用，不是未预热数字）：','','| A target | C 公开优化 | D 手写16x8 | E 冻结修复 |','|---:|---:|---:|---:|']
wc={r['role']:r['cycles'] if r['valid'] else None for r in warm}
lines.append('| '+' | '.join(v(wc.get(role)) for role in ['A-target','C-public','D-manual-16x8','E-frozen'])+' |')
if all(wc.get(role) for role in ['A-target','C-public','D-manual-16x8']):
 lines+=['',f'该预热案例 A/C={ratio(wc["A-target"]/wc["C-public"])}，D/C={ratio(wc["D-manual-16x8"]/wc["C-public"])}；论文对应类别图14为1.44×/1.44×，但其具体尺寸间汇总及源码绑定尚缺，不能将一个尺寸直接视为完整复现。']
gemm=next(r for r in rows if r['kernel']=='f32-gemm-minmax')
lines+=['',f"FP32 GEMM 的 B 公开初始版为 **{v(gemm['initial_cycles'])} cycles**，B/C={ratio(gemm['initial_over_optimized'])}；E/B={ratio(gemm['frozen_over_initial'])}。A 的本地修复与 B 不同，分别报告。",'', 'VMULC 的 B/E 与 A 字节相同，复用同一已测 ELF；不是另外声称执行过两个不同程序。VMULC 按作者通用协议三次计时后检查末次输出，保留全部三次 cycles；CSV 明确标注哪些调用未独立检查输出。','',
'## 3. 与论文图 14 的差距','',
'图 14 的比值由所供原图读取，属于 digitized 数据，论文没有提供可直接比较的逐点原始 cycles。下面采用公开 harness 可核实的汇总方式；不把我们的汇总自动宣称为原论文绘图脚本。','',
'| 案例 | 本次 catalog初始/C | 论文 初始/优化 | 本次 D/C | 论文 手写/优化 | 汇总与边界 |',
'|---|---:|---:|---:|---:|---|']
summary=[]
for k in collect.NAMES:
 rr=[r for r in rows if r['kernel']==k]
 def aggregate(col):
  x=[r[col] for r in rr]
  if any(z is None for z in x):return None
  if k=='x32-transposec':
   ss=read(OUT/'fixtures'/k/'manifest.json')['shapes'];return sum((c*1000)//(s['height']*s['width']) for c,s in zip(x,ss))
  return sum(x)
 a,b,c,d=aggregate('target_cycles'),aggregate('initial_cycles'),aggregate('optimized_cycles'),aggregate('manual_cycles');paper=read(OUT/'evidence/paper-figure14.json')['values'][k]
 ac=b/c if b and c else None;dc=d/c if d and c else None
 bound='公开 Exp harness 的两尺寸 cycles 求和' if 'radd' in k else '未预热补充，score=sum(floor(cycles*1000/elements))；不等同公开warm5协议' if 'transpose' in k else '单一论文尺寸' if k in ['f32-vmulc','f32-gemm-minmax'] else '逐形状为主；完整 tester 的计时汇总实现未恢复'
 if k=='f32-dwconv2d-chw':ac=dc=None
 lines.append(f'| {collect.NAMES[k]} | {ratio(ac)} | {paper["initial_over_optimized"]:.2f}× | {ratio(dc)} | {paper["manual_over_optimized"]:.2f}× | {bound} |')
 summary.append(dict(kernel=k,aggregate_target=a,aggregate_initial=b,aggregate_optimized=c,aggregate_manual=d,target_over_optimized=a/c if a and c else None,initial_over_optimized=ac,manual_over_optimized=dc,paper=paper,relative_gap_initial_gain_percent=(ac/paper['initial_over_optimized']-1)*100 if ac else None,relative_gap_manual_gain_percent=(dc/paper['manual_over_optimized']-1)*100 if dc else None))
write=collect.write;write(OUT/'paper-comparison.json',summary)
lines+=['','## 4. 实际完成与缺失','','主表列出论文要求的12组形状，其中11组至少有一个版本完成有效RTL测试，并非每个版本都已测成。每项是否完成由RTL正常退出和正确性检查共同决定；源代码存在、native预检通过、已经启动均不算性能测试完成。以下列出主表尚无有效结果的版本：','','| 案例/形状 | 版本 | 状态 | 证据 |','|---|---|---|---|']
missing=[]
for r in rows:
 roles=['A-target',collect.C[r['kernel']],collect.D[r['kernel']],'E-frozen']
 if r['kernel']=='f32-gemm-minmax':roles.insert(1,'B-initial')
 for role in roles:
  run=r['roles'][role]
  if run['valid']:continue
  reason=run.get('reason') or run.get('returncode') or run.get('stage') or 'not_started'
  missing.append(dict(kernel=r['kernel'],shape=r['shape'],role=role,status=reason,evidence=run.get('evidence')))
  lines.append(f'| {collect.NAMES[r["kernel"]]} {case(r)} | {role} | {reason} | {run.get("evidence", "尚无result.json")} |')
write(OUT/'incomplete-measurements.json',missing)
lines+=['','论文出图版本的精确源码/符号绑定、完整FireSim配置和缺失的kernel_cycles()实现仍未恢复，不能标为“已复现”。GCC失败实验、旧reset协议和不匹配论文尺寸的历史数据均保留在独立记录中。','']
lines+=['',
'已确认的差异：catalog/公开优化/本地修复源码不同；Exp 算法族不同；GEMM 原生 NR8/NR64 packing 不同；当前 RTL 内存时钟比、主频及测试驱动与旧论文尚未绑定。本地目标 CPU=500MHz、DRAM=666.7MHz，论文表I标注 Saturn@1GHz、平台描述为 U250 FireSim；图14的完整preset未恢复。宿主 CPU/FPGA 快慢本身不能解释目标 cycles 比值。','',
'仍未知：旧论文每根柱子的实际源码/符号、完整硬件 revision/preset、缓存内存参数、编译器与 flags、输入 seed/分布、kernel_cycles() 补丁和最终出图汇总。不能将大幅差距全部归为某一个因素，也不能反推某份源码就是论文版本。','',
'## 5. 协议、正确性和失败边界','',
'- 同一案例各版本统一 O3/RV64GCV/lp64d/ffp-contract=off、编译器、simulator SHA、输入和计时窗口。GCC15.2 主组与 Clang20.1.2 兼容组分开。独立 TU、无 LTO；实际普通 helper 分别编译并在 kernel 计时内被调用。','- 计时窗口围住真实函数调用，保留公开MEASURE的fence和rdcycle/rdinstret顺序，将reset修正为vsetivli x0,0,e8,m1。原vsetvli x0,x0在改变VLMAX时是规范保留用法；详见[reset审计](evidence/measurement-reset-audit.json)及[RISC-V规范](https://docs.riscv.org/reference/isa/unpriv/v-st-ext)。旧字面协议不作为主结论。准备输入、输出清零、oracle、打印在窗口外。“未预热”仅指不预跑候选kernel，没有执行cache flush；输出清零及驱动仍会影响缓存状态。','- VMULC：初始 RVV reference 预跑3次，候选3次取最小。输入由已冻结 fixture 提供，未重放作者 srand/rand；只检查末次输出，符合其公开通用模板的这一点。','- Exp：每个形状候选预跑5次，再计时1次；公开 Exp tester 是3840/32640元素，本次依论文Table II改为960/8160元素，传给kernel的batch分别是3840/32640 bytes；作者代码是5轮多形状 sweep。本次每形状独立 ELF，未重放 sweep 的跨形状缓存状态，也没有伪造缺失的 patched tester。','- Transpose：Clang 128² 完整warm5案例单列；三尺寸未预热结果为统一补充协议。GCC15 编译的公开优化/手写版本在 QEMU 检查通过而本地 RTL 输出失败。单独分段加载复现：GCC 使用 e8,mf4 配合 vlsseg8e32，合法EMUL=1；本地PipelinedFaultCheck先将负LMUL截成0再加EEW/SEW，算出EMUL4，与观察到的寄存器间隔相符。Clang 对同一C代码使用e32,m1，指令控制和完整128²案例均通过。未修改RTL或kernel算法，也未声称论文硬件有同一问题。见 [EMUL兼容审计](evidence/emul-compatibility-audit.json)。','- FP32 GEMM：M=1,K=512,N=512，统一未预热单调用、计时1次，是本地补充协议（原先 warm1 尝试另存，不混用）；没有使用量化 test3.c 冒充 FP32 harness。NR8→NR64 的逻辑 bias/weight 位模式已逐项核对，使用各自 cn_stride，packing 不计时。见 [packing-check.json](fixtures/f32-gemm-minmax/packing-check.json)。','- DWConv：3x3、stride1、pad1，宽度以 bytes 传入，五组 H/W 与论文一致；无额外候选预热，计时1次。手写符号采用 3x3p1；未按文件名将 stride2 kernel 直接换入。最小形状失败的版本停止更大形状测试，较大形状明确标为未启动，不推断其行为。A在7×7的超时和C在14×14的超时尚未定位，不能自动归为Transpose的EMUL问题或源程序错误。E的256×256仅为补充项，依据有限资源原则未启动；E四个小尺寸保留。','- 输出检查：VMULC/Transpose/GEMM 为原有精确结果；Exp 使用 double oracle 的1e-6相对误差并检查 sum；DWConv 使用 max(1e-5*abs(ref),1e-6)。Exp 固定输入的 float32 接受边界逐个验证，未降低容差；见 [bounds-check.json](fixtures/f32-raddstoreexpminusmax/bounds-check.json)。其余大尺寸准备/检查使用显式向量代码，均在计时外。','- Exp8160 具有32元素的 m4 尾部；DWConv 小宽度和非整块高度涉及尾部；Transpose/GEMM 的论文尺寸是整块。非 VMULC 输出有相邻 canary；均使用真实参数、stride 和初始化。','- 计时前，以实际 kernel/helper 对象链接 Linux harness，在 QEMU 做功能预检；QEMU 的 cycles 全部丢弃。RTL 输出失败、断言或超时的运行不生成有效加速比。','- 初期标量参考预热/逐次检查的 VMULC pilot、Exp double-oracle 慢检查尝试、编译驱动修正和中断记录均保留，但不混入主结果。完整 scalar double-oracle 180秒超时并不证明 kernel 耗时180秒或挂死。','- 主性能候选串行，每个simulator约1.3GiB；仅短暂增加一个≤120秒、约1.3GiB的独立指令功能诊断，未用于性能加速比；每项有限时间/目标周期预算，最大 target cycles 为20000000。每次新任务先查账户配额；≤27%或查询失败保存 CONTINUE.json 并停止新批次。未消耗充值/重置额度。','- 性能测试通过不等于形式证明；本次没有重跑形式验证。主表输入/输出统一64字节对齐；不同ELF绝对地址仍会随链接布局改变，未控制为相同物理地址，几个百分点的差异不宜作显著性或单因素归因。','',
'完整有效/失败/未启动状态：[all-runs.json](all-runs.json)。主比较：[comparison.csv](comparison.csv)；逐次原始周期：[raw-cycles.csv](raw-cycles.csv)；每个 runs 目录保存实际源码、命令、kernel/helper 对象、ELF、native 预检、RTL 日志和退出状态。环境：[environment/manifest.json](environment/manifest.json)；继续入口：[CONTINUE.json](CONTINUE.json)。','',
'继续入口见 CONTINUE.json；兼容组脚本为 `compat_campaign.py`，所有已有result.json（含失败记录）都会跳过；重试必须使用新目录，详见CONTINUE.json中的单项继续示例。须在账户配额高于停止线且查询成功时继续。不要重跑 audit_sources.py 覆盖冻结身份，也不要将失败任务改成有效结果。']
if (OUT/'simple-kernels-extension/REPORT.zh-CN.md').exists():
 lines+=['','新增8类简单kernel的独立补充协议实测见 [simple-kernels-extension/REPORT.zh-CN.md](simple-kernels-extension/REPORT.zh-CN.md)。不合并进原论文五例汇总。']
(OUT/'REPORT.zh-CN.md').write_text('\n'.join(lines)+'\n')
print(OUT/'REPORT.zh-CN.md')
