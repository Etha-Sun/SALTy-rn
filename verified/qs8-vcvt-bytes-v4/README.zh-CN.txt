qs8-vcvt：integer Bytes-v4 下完整通过1220/1220，候选全量、root独立、打包canonical三次通过。
干净实现为neon.c和rvv.c，公开规格spec.h，调用harness.c；唯一证明材料proof.patch，ghost helper均在其中。
普通C/public spec冻结，实际canonical的预处理token与host LLVM IR均相同。覆盖43个实际/ghost函数、5个global lemma及全部生成义务，详见audit/final-review.json。
NEON原版逐字不变；RVV为此前已冻结的vnclip15修复版，original/与repair-witness-results.json保留原版及127对-128反例。不得称原始RVV已验证。
公开域见spec.h：符号n>0且n<=SIZE_MAX-7、n+7可读输入、n个有效输出、params有效、公开分离关系、multiplier!=INT32_MIN。没有循环展开长度上界。
固定LP64小端、VLEN128、e8m2/e32m8容量32，VL=min(remaining,32)。只比较最终int8值；ISA到C shim对应未证。
旧Bytes全局pointer uint64范围公理与逆映射冲突，新模型只删该公理，无新假设；旧verified/qs8-vcvt记录隔离保留。
libc memcpy内容/终止/退出合同、其余内存/整数模型公理、ABI、Frama-C/WP/Qed/策略、Why3/driver、SMT和验收脚本仍属TCB。不代表全部ISO C UB或二进制级证明。
重放见canonical01-command.json，务必使用新的--name以保留旧记录。外部构建缓存不入Git，fresh clone不是已配置环境；同服务器原锁核对或另建环境再冻结复验。
