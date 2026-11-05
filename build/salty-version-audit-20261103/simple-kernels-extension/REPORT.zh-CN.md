# 简单 kernel 扩展实测

新增8类kernel：六类测1024/1031元素，VDIV/VSQRT测128/135元素。用户已撤销先前账户配额停止线；每项仍使用有限运行预算，所有性能任务串行。这里只报告本轮新测数据，没有重跑或覆盖旧实验。

状态：52/52 个预定物理程序运行通过；完整三版对照 16/16 组。—表示尚无有效RTL周期，不计加速比。

| Kernel | 元素数 | target A | 公开优化 C | XNNPACK u8v D | 冻结修复 E | A/C | D/C | E/A |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| f32-vadd | 1024 | 439 | 429 | 424 | 439 | 1.023× | 0.988× | 1.000× |
| f32-vadd | 1031 | 431 | 436 | 429 | 431 | 0.989× | 0.984× | 1.000× |
| f32-vsub | 1024 | 439 | 425 | 424 | 439 | 1.033× | 0.998× | 1.000× |
| f32-vsub | 1031 | 431 | 430 | 429 | 431 | 1.002× | 0.998× | 1.000× |
| f32-vmul | 1024 | 439 | 439 | 424 | 439 | 1.000× | 0.966× | 1.000× |
| f32-vmul | 1031 | 431 | 431 | 429 | 431 | 1.000× | 0.995× | 1.000× |
| f32-vdiv | 128 | 3,657 | 3,650 | 3,657 | 3,657 | 1.002× | 1.002× | 1.000× |
| f32-vdiv | 135 | 3,857 | 3,850 | 3,857 | 3,857 | 1.002× | 1.002× | 1.000× |
| f32-vmin | 1024 | 430 | 435 | 434 | 803 | 0.989× | 0.998× | 1.867× |
| f32-vmin | 1031 | 435 | 439 | 434 | 818 | 0.991× | 0.989× | 1.880× |
| f32-vmax | 1024 | 430 | 430 | 434 | 803 | 1.000× | 1.009× | 1.867× |
| f32-vmax | 1031 | 435 | 434 | 434 | 818 | 1.002× | 1.000× | 1.880× |
| f32-vsqrt | 128 | 3,502 | 3,502 | 3,502 | 3,502 | 1.000× | 1.000× | 1.000× |
| f32-vsqrt | 135 | 3,693 | 3,693 | 3,693 | 3,693 | 1.000× | 1.000× | 1.000× |
| f32-vlrelu | 1024 | 383 | 339 | 374 | 383 | 1.130× | 1.103× | 1.000× |
| f32-vlrelu | 1031 | 388 | 384 | 382 | 388 | 1.010× | 0.995× | 1.000× |

每组共用GCC15.2/O3/RV64GCV/lp64d/ffp-contract=off、同一Shuttle/Saturn VLEN512/DLEN256 RTL、输入、参数和计时窗口。独立TU，无LTO；VDIV/VSQRT候选预热一次，其余预热五次，均计时三次，每次逐位检查输出与两侧canary。表中取三次最小值，原始CSV保留所有采样，all-runs.json另列中位数。此协议是本地补充测量，不冒充论文出图协议。没有cache flush，ELF绝对地址未固定，不将几个百分点的差异解释为稳定收益或单因素效果。

输入覆盖正负有限值和符号零；除数严格为正，sqrt输入非负，LeakyReLU slope=0.125。只测共同有限输入域，不测试NaN传播合同；VMIN/VMAX的冻结修复仍实际执行NaN处理代码。离线oracle用精确Fraction核对float32最近偶数舍入边界，sqrt核对平方后的中点边界；未从任何候选输出生成gold。所有主输入、输出64字节对齐，byte batch=N*4，1031长度有7元素尾部。

实际kernel函数调用位于fence+rdcycle/rdinstret窗口中；AVL=0重置合法。准备、输出清零、正确性检查、打印均在窗口外。先用同一GNU kernel对象在QEMU功能预检，其周期一律丢弃；有效周期仅来自RTL。测试通过不构成新的形式证明。

target为本轮工作区冻结副本；C固定公开optimized仓库80feb456/597c1d2；D固定本地XNNPACK867d5a34的u8v候选（已查工作文件与提交blob一致），未搜索最佳变体，也未声称就是旧论文手写符号。E固定821969733：六个与A字节一致的源码复用A测量，VMIN/VMAX另行编译实测。全部来源、符号、源码hash、编译命令、对象、ELF、native/RTL日志、三次原始cycles保留。

证据：[sources.json](sources.json)、[protocol.json](protocol.json)、[comparison.csv](comparison.csv)、[raw-cycles.csv](raw-cycles.csv)、[all-runs.json](all-runs.json)、[CONTINUE.json](CONTINUE.json)。

VDIV旧warm5/120秒记录和未启动的旧槽位保留于[legacy-warm5-runs.json](legacy-warm5-runs.json)，不计入warm1主结果。候选的超时不等于源码错误。

VMUL身份对照：A与C的GNU kernel .text SHA256相同，1024/1031两个尺寸下三次周期序列也分别完全相同。公开优化文件在这一项没有编译后代码或实测周期变化，见[机器码对照](vmul-code-identity-control.json)。

最终核对：52/52个新协议程序运行、156次独立计时检查全部通过，16/16组三版对照完成。52份最终ELF的反汇编计时窗口均检查通过，见[timing-window-validation.json](timing-window-validation.json)。目标源码与冻结证明原稿的8份hash绑定一致，见[proof-baseline-bindings.json](proof-baseline-bindings.json)。

主尺寸柱图：[PNG](simple-kernels-main.png)、[PDF](simple-kernels-main.pdf)；含尾部尺寸柱图：[PNG](simple-kernels-tail.png)、[PDF](simple-kernels-tail.pdf)。每个面板N均显式标注；不混用不同长度、编译器或预热协议计算比值。
