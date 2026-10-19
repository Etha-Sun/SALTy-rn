已验证程序目录

当前正式清单为15项（manifest.json），待证明22项，缺对应target 3项。
新增qs8-vcvt使用仅删除冲突公理的独立integer Bytes-v4，三轮完整复验均1220/1220；
原版RVV反例与此前修复target分开保留，spec/普通C冻结，每kernel仍只有一个proof.patch。
qs8-vlrelu在同一修正模型下三轮1547/1547全过，NEON/RVV原始C都逐字不变。
两个新包的实际source/preprocessed token/LLVM identity、函数/global/call闭包均审计；
旧同名目录在quarantined_programs中明确隔离，不计入当前结果。

此前基线包括4个整数、7个修复IEEE浮点及2个byte-to-float转换kernel。
旧Bytes全局pointer范围公理冲突与新模型审计见../experiments/codex-kernel-wave1/WAVE2-REVIEW.zh-CN.md；
旧新候选绿色日志被隔离，这个发现不能直接套到13个历史Typed收录项。
历史rsum的额外内部table分离假设及独立alias重验边界也在上述审计中保留。

以下为早期shim-c-v2基线和历史说明，数字不代表当前总量：
旧7项quarantined_programs和原目录保留，只作历史证据，superseded_by指向新目录。
本轮其余26项已补proof并完整尝试，但尚未整核通过；不能根据局部成功将其收录。
逐项状态见../experiments/shim-c-v2/REPORT.zh-CN.md；模型修复、禁用的Bytes+float
配置及TCB见同目录MODEL-AND-TCB.zh-CN.txt。新版本没有修改原C、公共spec或wrapper。

当前收录条目以manifest.json为准；最新共享支持扩展结果见
../docs/shared-shim/EXTENSION-RESULTS.zh-CN.txt，40项台账在
../experiments/shared-extension/results.json。子目录也保留显式标记的历史版本，
不能只凭目录存在就判断当前已验收。旧版说明与结果如下。
neon.c/rvv.c保留干净实现，spec.h单独放公共规格，proof.patch集中证明材料。
build.py将标准补丁应用到临时副本，再检查实现token和公共规格不变。
没有额外proof helper文件；普通C shim与调用wrapper单独保存。
原始源码、来源/模型范围、验收脚本、完整raw目标和运行日志一起保留。
manifest.json列出证明输入/结果的哈希；实际检查命令在各case日志中。

收录条件
1. 明确固定原程序、观察关系、ABI/硬件模型与合法输入域。
2. 实际原kernel体参与验证；不能用未证明的手写schedule模型代替。
3. wrapper、全部shim/helper函数体、中间断言和生成的安全/终止义务全部通过。
4. 验证前后输入哈希相同；目标/依赖完整；结果与历史失败记录分开。
5. 外部库假设、ISA→C shim缺口和不支持的模型检查必须显式保留。

这些条件支持“在声明的C模型和前提下已证”，不等于所有架构/二进制已证。
公共后置条件采用输出相等；内存安全、frame、termination仍需分别检查，
只证明两程序结果相同不代表两程序满足产品功能规格。

qs8-rsum
  文件划分、行数与复现说明见qs8-rsum/README.zh-CN.txt和metrics.json。
  唯一公开功能后置条件是输出相等，内部复用sum8/mod32不变量。
  新结构完整检查579/579，261.765秒，覆盖历史同一目标集合和33个函数；
  结果见logs/separated-summary.json。
  历史710行单文件版记录在logs/recorded*；没有固定循环展开界限。
  LP64、little-endian、固定ARM64分支、VLEN128、min VL32、15字节可读padding，
  不重叠/有效内存以及最终有符号加法无溢出等前提仍适用。

复现（仓库根目录）
  python3 verified/qs8-rsum/audit.py
  python3 verified/qs8-rsum/check.py --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin --name replay
需要Frama-C33 Arsenic及对应solver；tools/提供版本/安装说明。
新的replay名称保留已有separated和recorded日志。hash/计数审计不是SMT证明证书检查。

GEMM
  修复/测试/完整证明尝试在 experiments/gemm-repair/。
  尚未完整证明，不能根据2400次native回归或局部关系引理放入此目录。

历史共享路线记录（实现/规格冻结cb36fab，checker fe69a05；其中浮点旧数字不采纳）
qu8-rsum 567/567，249.602秒；s8-vclamp 688/688，320.514秒；
f32-vadd 431/431，201.823秒。均complete=true、unchanged=true。
三者原始C逐字保留；共享普通C库在shared/，每case一个proof.patch。
每case的spec/harness由tools/shim_c_generate.py三模板生成，interface.json三字段。
  python3 tools/shim_c_check.py qu8-rsum --name replay --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin
其他case同理。最终日志为qu8/s8的final02和f32的final01，LLVM比较证据在logs/。
合法域/浮点观察/固定VLEN和RTE限制必须一起阅读，不把全目标通过视作ISA桥接已证。
三case模型范围、手写行数、agent审阅和40项盘点见../docs/shared-shim/RESULTS.zh-CN.txt。
