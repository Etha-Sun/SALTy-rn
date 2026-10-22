# 保留原调用形式的 VADD

用户授权：优先复用旧程序；实时 quota <=60% 时保存并暂停，不启用旧的 70% 等待规则。

本次只改 shim 和证明标注，C 调用、赋值、循环保持原形式。原 kernel 文件只读。
旧 pointer/out 证明作为参考，不把其结论自动算作当前结果。

1. 完成按值 load/add/store/get/lane shim：26 个实际 C VC 已通过。
2. 从原 NEON 源码插入合同、原有循环不变量、where 注释，检查 C token 一致。
3. 重新生成整核 VC；优先复用旧 Coq 引理/证明，逐个检查目标对应。
4. NEON 跑通后接 RVV，保留原调用和动态 VL，在固定 VLEN 参数下验证。
5. 再接已有 equivalent wrapper/比较器，独立列出依赖闭合状态。

最大结论需要两边实际 kernel、shim、比较器和 wrapper 均完成检查；
VC 生成、局部 shim 成功和旧证明记录均不替代该结论。
