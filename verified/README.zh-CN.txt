已验证程序目录

当前收录旧qs8-rsum及共享shim路线qu8-rsum、s8-vclamp、f32-vadd。
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

共享路线新增案例（实现/规格冻结cb36fab，checker fe69a05）
qu8-rsum 567/567，249.602秒；s8-vclamp 688/688，320.514秒；
f32-vadd 431/431，201.823秒。均complete=true、unchanged=true。
三者原始C逐字保留；共享普通C库在shared/，每case一个proof.patch。
每case的spec/harness由tools/shim_c_generate.py三模板生成，interface.json三字段。
  python3 tools/shim_c_check.py qu8-rsum --name replay --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin
其他case同理。最终日志为qu8/s8的final02和f32的final01，LLVM比较证据在logs/。
合法域/浮点观察/固定VLEN和RTE限制必须一起阅读，不把全目标通过视作ISA桥接已证。
三case模型范围、手写行数、agent审阅和40项盘点见../docs/shared-shim/RESULTS.zh-CN.txt。
