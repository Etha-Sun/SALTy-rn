# HWC 整合实现的修复与兼容调整

本说明对应 `repaired-neon219-rvv162-ordinary-pixel-helpers`：NEON 主函数 219 行、RVV 主函数 162 行，另有 10 个普通 helper C 翻译单元、16 个函数。这里记录源码、精确补丁及已有证据的身份；完整整案 C/Coq 门禁仍待执行/验收，不声明原始 RVV 已经正确，也不把有限 native 或 SDK 编译称为形式证明。

原件是 catalog 中的 `kernels/source/f32-conv-hwc2chw.c`（87a57d56…）与 `kernels/target/f32-conv-hwc2chw.c`（dc4b0364…），逐字保存在 `proof/original/`。当前实现分别为 b8ceabb9… 与 fbe1d3bd…。完整 SHA 见拟合并 `repair.json`。原 catalog 总文件的旧 SHA 作为历史保留；当前 catalog 的本 kernel 原件条目及仓库原件与保存原件三方完全一致，不将别的 kernel 元数据更新误作本原件变化。

`repair-neon.patch`、`repair-rvv.patch`、两者合并 `repair.patch` 直接从这两份原件生成；`repair-bundle.patch` 还显式加入全部当前 shim C/header 文件。GNU diff 保留无末尾换行标记，新增文件用 `/dev/null` 旧文件头。私有目录已对两主函数补丁及完整 helper bundle 做 `patch --fuzz=0` 正向和反向重放，前后完整文件清单及每个字节 SHA 均相同。`compatibility-{neon,rvv}.patch` 单独显示此前公开修复版本到本次主函数重构的变化，不能代替原版→最终补丁。旧 repair、补丁、草案及早期收据保存在 `history/before-whole-cached-main/`，不能覆盖其历史身份。

原 RVV 的语义修复包括：使用真正 masked strided load，避免读 masked-off 无效横向地址；为第二输出行补上上界 clamp；通过实际普通 `hc_min_f32m1`/`hc_max_f32m1` 实现 NaN 传播；奇数宽度的缺失右 tap 使用 accumulator-preserving `_mu` FMA 跳过整次运算；全局维度/索引/地址保留 uint64，32 位比较仅处理局部 lane0..3；最后写 row0，避免裁剪末行时 row1 覆盖有效 row0。这些都是修复后的实现行为，不声称与有反例的原 RVV 等价。

左、右及纵向 padding 必须分别解释。左侧缺列以正零作为输入，仍按原次序计算 FMA，所以 `+0 * Inf` 等情况仍能产生 NaN；右侧缺列在 tap 模型为 `None`，整次 FMA 不执行，不能替成零输入 FMA。纵向缺行使用调用者提供的 zero-row 数据，该行允许任意 binary32，不能假定全零。当前 NEON helper 的三个左组保留 FMA、三个右组按条件跳过；RVV rows helper 保留左侧零填充后无 mask FMA，右侧通过 `_mu` 保持原 accumulator。`_m` 的 agnostic accumulator 策略不足以表达 skip，既有原始指令策略审阅保留。

每个输出累加器的顺序保持 bias→dx0..2→ci0..2→ky0..2，共 27 次有条件 FMA。packed weights 每四通道一块 112 float：bias 为 block+lane，tap 为 block+4+(dx*9+ci*3+ky)*4+lane。NEON 当前调用普通 `hc_neon_rows_pixel27`，其九组各调用真实三 FMA 普通 helper；RVV 当前八次调用普通 `hc_rvv_pixel9_raw`，每次九次调用真实 `hc_rvv_rows_fma3`。这些算法 helper 均须完整实际 C body/caller 证明，不属于原生 intrinsic 豁免。重复 readonly load 数量及独立累加器之间的全局指令交错已改变，不声明指令轨迹、FP flags/traps、volatile 或读取次数与原始代码一致；观察边界为公开输出/帧。

输出先 max 下界再 min 上界，第二行也完整执行两次 clamp。真实写序均为 row1/lane0,1,2,3 后 row0/lane0,1,2,3，NEON 两像素批和一像素尾部均如此。末行 row1/row0 裁剪别名由 row0 最后胜出；剩余通道 1/2/3 的指针按原条件逐级别名，最后 lane3 可覆盖最后真实通道。模型明确使用该实际 lane3 结果，不添加 padding 权重重复、输出 padding 初始化或任意初态缺省值的假设。

公开输入域保留正 H/N/channels、top0..1、0<=start<end 与中心行有效条件。完整 input 区域额外三个可读 float、给定 zero 行的 3*N+3 float、全部 112*ceil(channels/4) 权重及 params 均须满足显式已初始化 window/非回绕 footprint。维度受这些原有内存条件限制，未增加任意 INT32/有限浮点界。input/zero/weights/params 可以完全或部分重叠，共享单一 readonly map；readonly 与输出所有权仍分离。输出是非重叠逻辑 CHW 窗口、允许 stride gaps，保留内部裁剪别名；不宣称任意重叠 CHW 布局。输出初态及未写位置允许 `Some`/`None`，未写帧按 option 原值保留。两个公开 kernel Require 已逐 token 对照本次真实 QCP 输入合同一致；领域/算术/进度/内存的既有模型 SHA 未因重构改变。

浮点输入包含所有 binary32：q/sNaN、任意 payload、±0、Inf、次正规及无序上下界。当前 RNE 模型不观察 flags/traps，不采用 flush/default-NaN 模式。ordinary helper 的 bit-structural 合同不能用 NaN 的 IEEE 自反等式替代。跨 ISA 的 `dw_rel` 允许两侧 NaN payload 不同；公开 `dw_observe` 是数值 `fp32_eq` 或双方 NaN，因此不要求 NaN payload 或正负零的位串相等。min/max 的 signed-zero 选择在模型中显式给定；不能把该公开观察结果扩称所有 NaN payload 的逐位物理 ISA 等价。原生 intrinsic 合同/模型及 SDK 仅为明确的原始指令规格边界，最终人工审阅及物理 record ABI/ISA 精化仍未证明。

保留两类注释修复。旧缓存输入指针注释把 `float* +12*(N-iw)` 又按 sizeof 乘4，实际每轮 `i+=12` 是48字节，旧注释却要求192；改成纯逻辑 byte 地址，没有改 C 或公开域。旧 width 输出游标不变量在末次 one-past=2^64 时错误先取模为0；现允许裸逻辑 Z 游标等于2^64，后续显式 uint64 运算仍按模语义处理。公开 footprint 原本允许最大输出末端等于2^64，没有通过增加 `<2^64` 排除该点。两份旧目标/反例/Coq 数学日志均保留为 annotation-only 证据，不能当 C 算法反例，也不能声称 native 已执行这一极端地址。

已只读核对 K 当前 UBSan、ASan 与两目标真实 SDK 四份收据：均绑定新两主函数和实际 helper/spec 输入；native 各307800案例、每侧14040000输出，每案例调用 mode0 与 UINT32_MAX 两个普通公开分支，单侧/双侧共同错误负控均被独立 oracle 拒绝；ASan 实际16GiB、swap0。run/status 与公开收据逐字相同，source/log/object 链已核。它们是有限仿真/编译证据，不给 C/Coq 或真实 ISA 运行信用。最终仍须完整 sourcefresh 证明所有 main/helper/public caller、完整类型及假设报告并签发整案；该修复审计不改变 verified 计数。
