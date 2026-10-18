已验证程序目录

当前仅收录 qs8-rsum。
proof.c包含全部待验证实现、规格与证明注释，无本地proof helper文件。
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
  proof.c 710物理行，679非空行，其中448非空ACSL/ghost注释行。
  唯一公开功能后置条件是输出相等，内部复用sum8/mod32不变量。
  579/579 raw目标、33个函数完整覆盖，262.409秒；没有固定循环展开界限。
  LP64、little-endian、固定ARM64分支、VLEN128、min VL32、15字节可读padding，
  不重叠/有效内存以及最终有符号加法无溢出等前提仍适用。

复现（仓库根目录）
  python3 verified/qs8-rsum/audit.py
  python3 verified/qs8-rsum/check.py --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin --name replay
需要Frama-C33 Arsenic及对应solver；tools/提供版本/安装说明。
新的replay名称保留本次recorded日志。hash/计数审计不是SMT证明证书检查。

GEMM
  修复/测试/完整证明尝试在 experiments/gemm-repair/。
  尚未完整证明，不能根据2400次native回归或局部关系引理放入此目录。
