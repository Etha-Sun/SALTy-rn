> 监督者审核后收录（2026-11-05 11:50 UTC，用户休息期间，待用户审核）。原草稿：`build/e1-workers-20261104/w21-qu8rdsum-transpose/bugs/XNN-002-qu8-rdsum-rows.zh-CN.md`。A_fixed：`build/e1-workers-20261104/w21-qu8rdsum-transpose/repo/verification/qcp/candidates/e1-qu8-rdsum-pair/proof/neon/input/qu8-rdsum.fixed.c`。

# XNN-002：QU8 RDSUM 的 NEON 行计数截断

状态：原始 A ≠ Bopt 已真实复现；Bopt 原版与 v1.2 输出均在三个 VLEN 下得到参考结果。XNNPACK 默认 AArch64 u16 的同根因错误也已真实复现。监督者已授权采用 XNN-002 和 A_fixed 分支；impl 原件不变，A_fixed 仅存 proof/neon/input。

## 发现途径、固定版本

E1 W21 原始 NEON A ⇔ 最终优化 RVV Bopt。旧 `qu8-rdsum/proof/original-counterexamples.json` 提供 rows=2^31 的两侧同错线索；当前 Bopt 已换成 size_t r，不能继承旧“不等价/同错”结论。本次用真实 intrinsic 和 QEMU 重新执行，属于旧反例引导的差分复现，不是新 QCP 生成反例。

A：SALTy-rn `be16280c7812a7459c26c3ce82a47339a3d07718` 的 `qu8-rdsum.c`，SHA256 `513063b3667ea19323f67b1c8076e6aa34be3a475adaf7e22e9cd1c8701f6054`。
Bopt：`80feb4564cb470de301062109b6f89db672bdf9d` 的 `qu8-rdsum.c`，SHA256 `9228009b487eb961305375260f32e01bc42b6356146d58bd3f24f0675c2ff05a`。
XNNPACK：`867d5a344790802ee067be62f572c2e2722bf6fb`。原 A 函数体去注释/空白后与 `src/qu8-rdsum/gen/qu8-rdsum-7p7x-neon-u32.c` 完全一致；不是 SALTy 自行引入的类型错误。函数名不同及源文件前导声明不同，不宣称两整份文件逐字相同。

## 反例及内存

rows=2147483648，channels=32，input_stride=32；初始化输出32个 uint32 为0；所有输入字节为0，只有 input[0]=1；zero[64] 全0。参考结果只有 output[0]=1，其余0。这个稀疏值选择使精确数学累计仅为1，不依赖 uint32 回绕，也没有触及 operator 注释提及的有效31位累计限制。

输入分配 `(rows-1)*stride+channels+64=68719476800` 字节。Linux 匿名 mmap 未写页面共享零页，仅首字节写1；64GiB 是虚拟地址范围，未分配64GiB物理内存。每行 padding 可读，输入输出/zero 分离，指针/地址无回绕。所有进程在既有16GiB scope 下，不嵌套 scope。运行并发最多2。

A 真正执行主循环入口 `int r=rows`，在当前 AArch64/Clang 目标变为 INT32_MIN；`while(r>0)` 直接跳过，output[0]=0。rows=2^31 是首次有这种有符号截断的行数；channels32 是进入该 bulk 分支的最小通道数；非重叠布局的 stride 最小为32，非零数据仅1 bit。

真 intrinsic 结果与原/改写 RVV 结果在 `reproduction-sparse.log`、`runs/sparse-*/results.json`。不得使用首轮错误包装的 channels1 结果：初始 min 宏与真实 size_t min 类型不同，相关证据无效并保留；当前包装已改为与 XNNPACK 相同的 size_t 签名。

## L1：输入能否进入 XNNPACK

- API `include/xnnpack.h:4705-4727`，create 选择 QU8 sum/mean 在 `src/operators/reduce-nd.c:537-546`；QU8 用老 reduce 接口，`reduce2` 只针对 f16/f32 在 `:609-615`。
- 使用 input shape=[2^31,32]、axes=[0]。`xnn_normalize_reduction` (`src/normalization.c:284-375`) 合并连续轴，不移除这个维度；本次将原 normalization.c 与 `check_normalization.c` 编译运行，输出 `nd=2 axes=1 axis0=0 shape=2147483648,32`，见 `runs/normalization/`。
- reshape 的 `:153-222` 校验维数、轴数、轴有效性，没有对维度值设置 INT_MAX 上界。非最内层分支 `:283-290` 令 axis_dim=2^31，`:318` 把它原样作为 context.channels 保存；`:379-383` 得到 input_stride[4]=32、input_shape0=input_shape2=1。不会经过那两个 int shape 的大数截断，因为大值在维4。
- 初始化 `src/configs/reduce-config.c:628-630`、`src/microparams-init.c:1160-1169,1188-1194` 只处理 scale/zp，不限制 rows。可选合法量化值为输入/输出 scale=1、zp=0；QU8 对应输出转换虽然只使用 int32，但本例和仅为1，不溢出。
- `src/operator-run.c:1476-1501` 先清零输出，然后传 `context.channels` 作 rows、output2_block_size 作 channels、input_stride[4] 作 stride。这里不把 rows 分割成小于2^31的子调用。`reduce-nd.c:340-346` 以输出通道而非行数分 tile。
- 精确 dispatch 限定：A 是 NEON u32；`reduce-config.c:574-575` 的32位 ARM NEON 默认选它。AArch64 默认选 u16 (`:584-585`)，不宣称 A64 operator 默认选 u32。但 u16 有同样 `int r=rows` 问题，本次还将 XNNPACK 原始 u16 源文件与真实头文件直接编译后用 qemu-aarch64 执行，rows8 得1、rows2^31 得0，日志 `runs/xnn-default-20261105T090118/`。因此该根因也存在于64位实际默认路径，不只是人工挑选的 A64 u32 变体。

这是源代码调用路径审计与独立 normalization/default ukernel 执行，不是整份 XNNPACK operator 的端到端运行。该输入需要64GiB逻辑存储，可能受部署内存影响，但库校验和64位地址域不拒绝；当前复现用合法稀疏虚拟映射解决资源占用。

## L1：参考语义与偏离方

`test/rdsum.cc:94-108` 用 size_t 行循环逐列相加，然后加初始输出；无 QU8 容差，epsilon 为0。本例参考输出1。旧公开 `rd_results` 也是按列加法取模32，本例没有模回绕。测试参考、旧宏观 spec、当前 RVV 算法的数学结果一致，A 偏离。标量 QU8 kernel 自身也使用 int r，不能用它替代 tester 作为正确参考来否定反例。

## 修复计划（仅建议，未实施）

1. 保留原始 A/Bopt 及原始 A≠Bopt 结论。修复 A，而非给 spec 加 rows<=INT_MAX；库没有这样的校验，且本例没有数值溢出。
2. 最小方案为仅把 bulk 的 `int r` 改成 size_t；同时审阅尾部 `num_batches` 与 `r`，完整旧域要避免 rows+251 回绕和 batch int 截断。可参考旧 `proof/repair-neon.patch`，但需监督者逐项批准；保留 bounded inner current_batch 为 int，不能换成会减7下溢的 size_t。
3. 仅供审阅、未应用的最小补丁已写在本包 `proof/proposed-repair-neon.patch`（三处改动，原件不改），并对 XNNPACK neon.c.in 模板以及 u16/u32/u64 生成族分别检查。是否扩展范围由监督者决定。
4. 获准后新结果为 A_fixed ≡ Bopt（VLEN512/128/256），需 VEKTO-V 编号；不能把旧修复版证明直接算成新结果。若要先证明受限条件域也需独立授权和 VEKTO-C 编号。
5. Bopt 未改，RTL 性能未测；若后续决定修改 Bopt，必须真实测性能。本建议本身不宣称任何修复无性能影响。
6. 有向 XNNPACK 上游报告价值；本次只存 worker 草案，未写入 research/bugs，也未发消息、建issue或PR。对外报告需要用户授权。

## 实验结论

当前原始全域目标不能直接计为通过。整核 Coq 未启动，没有新公理、Admitted 或改 spec。修复/条件验证均待监督者决定；RVV 三种 VLEN 的最终逐命令记录已保存在候选 status.json 和本 worker REPORT。


## R2 逐字身份复核与授权执行

原始 A 与 XNNPACK neon_u32 从函数定义左花括号至文件末尾（包括注释、空白、末尾换行）的10623字节完全相同，不只是 token 相同。自动记录在 proof/r2-decision.json。大行数沿 reduce 路径可达，故按监督者决定执行 A_fixed 分支，不加 rows 上界；修复对象和规格用 VEKTO-V-TBD 标识。A_fixed 文件为候选 proof/neon/input/qu8-rdsum.fixed.c；仅三行变动，补丁仍在 proof/proposed-repair-neon.patch。修复后的整核证明与原始反例分开记录。


## R2 执行结果（2026-11-05）

监督者条件已满足，三处最小补丁已应用到 proof/neon/input/qu8-rdsum.fixed.c；impl 原件不改，spec 标 VEKTO-V-TBD，完整 rows 域保留。用真实 XNNPACK 头文件+NEON intrinsic 的 QEMU 回归：rows8与原始rows2^31/channels32/stride32稀疏反例都输出参考首列1。min/doz 的5条实际C body义务已从空目录编译完整VC_Correct实例并Print Assumptions。

整核A_fixed的QCP生成约942秒后SIGSEGV，没有整核Coq或配对结果；三种VLEN形式配对仍未完成，不能把上述回归/普通helper当整核通过。详见REPORT-R2及QCP-TBD草案。此前记录的“未实施/待批准”属于R1历史，当前以本节及r2-decision.json为准。未对外发送XNN-002。
