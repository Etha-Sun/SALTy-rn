# Argmax tail-v1 交接独立审核

本次仅审核，未启动新 proof/solver。maxpool/root42 不存在；不要与 dwconv/root42 混淆。

必须一起保留原版 root-review/argmax-tail-runtime01 的 inputs.json、main.c、result.json、四组 stdout/stderr：合法域 pixels=1、k=10、channels=1，float 行/输出含原规格允许的 +3 padding，index 仅一个 uint32。RVV exit0，NEON 和等价 wrapper 均由 ASAN 报 READ16 越过4字节对象，padded 对照 exit0。它是原版真实内存安全反例，不是数值输出反例。

新 target 为 stage3-target-fixes/f32-argmaxpool-tail-v1。target-inputs.json 保留原四文件 SHA 和新 SHA；独立复核仅 neon.c 变更，RVV/spec/harness 字节相同。原实现仍保留，禁止修改旧锁掩盖变化。完整 SHA 清单见 HANDOFF-AUDIT.json 及先前 review.json。

修复只在尾部构造四元素局部数组，读取 ib[0..c-1]，其余补零；c=1/2/3 仅存对应有效 lane。runtime-root01 的2100项 ASAN+UBSAN检查 exit0，覆盖3种像素数、14种通道数、10种k及5类数据，精确 index extent，并比较 NEON/RVV/标量参考。这是有限运行验证，不是全域证明。

fragment-root01 是真实尾部局部提取（赋值改为 return），带仅适用于片段的 1<=c<=3 和有效输入域，不是新 kernel 前提。raw 独立计数15/21，exit0，observer normal_exit=21，watch SHA 当前一致。三个 ib 读取 RTE 已通过；剩6项实际 verdict 全为 timeout：live/unused后置、assigns part5、memcpy dest/src/separation前提。不能以进程exit0或15个局部VC宣称片段/整核证明完成。

实际 WP 有 uint32*→sint8* 不兼容转换警告；memcpy约束位于Mchar，返回lane目标位于Mint/struct加载，Typed→char memcpy表达桥是当前明确缺口。timeout本身不构成修复target的新反例，也不能据此添加无body合同或换不健全模型。

下一步：先在独立版本审计并证明上述真实memcpy/返回结构体桥，保留全部6项；随后对新target补NEON真实循环的计数、精确assigns、终止和功能归纳。原NEON仍没有完整循环proof，root41的172/181只属callee集合，完整881库存还含695 wrapper与5 global，不能描述成接近整核。k为signed int，原域0<k<=INT_MAX，k-=9可从ghost初始K出发证明-8<=k<=K及模9关系，但尚未落新候选。

跨服务器必须恢复并核对冻结工具/solver/model的绝对路径与binary SHA，不能clone后安装官方Frama-C就声称复现。.build/guard01/plain是checker生成材料，runtime matrix/fragment含该绝对include；需在独立环境版本按freeze重建并核对plain源，保留旧命令与日志，不能直接编辑历史证据替换路径。没有已验证一键bootstrap。当前记录中的/tmp二进制不是Git交付物，其hash仅作来源证据。
