qs8-vlrelu：integer Bytes-v4下完整1547/1547，候选全量、root独立、打包canonical三次通过。
neon.c/rvv.c为冻结原实现，spec.h是公开规格，harness.c为调用wrapper；proof.patch是唯一证明文件，ghost helper均在其中。
两侧原始kernel逐字不变。实际canonical的预处理token与host LLVM IR相同。覆盖57个实际/ghost函数、5个global lemma及全部生成义务，见audit/final-review.json。
公开符号长度/内存/params域见spec.h，没有循环展开长度上界；固定LP64小端、VLEN128、容量32、VL=min(remaining,32)，观察最终int8值。
旧Bytes全局pointer uint64范围公理与逆映射冲突，新模型只删除该公理，无新假设；旧verified/qs8-vlrelu及失败候选保留隔离。
libc memcpy内容/终止/退出合同、其余内存/整数模型公理、ABI、Frama-C/WP/Qed/策略、Why3/driver、SMT与验收脚本仍是TCB；ISA到shim对应未证，不是全部ISO C UB或二进制证明。
重放见canonical01-command.json，使用新--name保留原日志。外部构建缓存不入Git；fresh clone不是已配置环境，新机器须恢复环境并独立冻结复验。
