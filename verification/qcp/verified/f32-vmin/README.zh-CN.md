# f32-vmin：原始 NEON 与修复版 RVV

完整 C-shim 门禁已通过：12 个实际 C 单元、47 个真实 C 函数、1188 个逐单元 VC 字段和 28 个策略字段。全部 140 个本地依赖/本案模块及 FinalCaseCheck 从源普通 Coq 编译通过，共 141 次；全部 1216 项 Print Assumptions 已归档。当前结果以 [proof/status.json](proof/status.json) 和 [完整验收记录](proof/evidence/full-run/status.json) 为准。字段数量按生成单元统计，不作为额外 kernel 或语义去重数量。

本案证明的是 **原始 NEON 与修复后的 RVV**，不宣称原始两侧等价。NEON 保持上游逐字内容；RVV 与此前 Frama-C 修复逐字一致。原始来源、原版/修复版哈希、精确补丁及原因分别见 [originals.json](proof/originals.json)、[repair.json](proof/repair.json) 和 [repair.patch](proof/repair.patch)。原始 NaN 反例与历史记录保留在 proof/history/，补丁按零 fuzz 实际应用并核对修复后字节。

修复原因是两种指令的 NaN 行为不同：Arm FMIN 传播 NaN，RVV minimumNumber 在仅一个输入为 NaN 时返回数值操作数。修复保持原 min 指令，分别检测两个输入的 NaN，用 RVV 加法得到 quiet NaN，再按两个 mask 合并。没有把两种架构的 min 原语改成相同函数；两种独立运算及修复序列的观察关系分别证明。

公开审查入口是 [spec.c](spec.c)、impl/、shim/ 和 proof/coq/。n 表示 float 元素数，需满足公开正数及机器容量约束；两个输入各有 n+3 个可读 float，两份输出各有 n 个可写 float，输入、输出、params 互相分离。输出初始只需 writable/undef；输入、padding 和 params 保持原样。NaN、Inf、正负零、subnormal 均未排除。观察为全部 n 个输出逐项数值相等或双方都是 NaN。

实际 C 闭包包含 bit/scalar/vector min/add/merge/self-compare、NEON/RVV 内存与 VL helper、两个 kernel、读取/NaN 比较及 equivalent caller。相同地址自比较使用两个实际地址参数与显式相等条件，只占一份向量资源。所有声明、契约、真实 body 与 public spec 精确匹配，callee 无遗漏；kernel 的原始/修复后 C 与加注释副本保持相同执行 token，目标全部重新生成并由全限定 VC_Correct 接口绑定。

配置固定 LP64、little-endian、binary32 RNE、gradual underflow；RVV 为 VLEN=128、SEW=32、LMUL=8、VLMAX=32、vl=min(AVL,32)、vstart=0。这是明确内存/类型/地址模型下的模块化部分正确性；ISA/shim 与 native-array/formal scalar-field 表示精化、任意硬件 VLEN、完整终止性均未证明。NaN payload/sign 与 FP flags/traps 不在公开输出观察中；额外加法可能改变异常标志。最终日志保留继承的 Coq/QCP/Flocq、经典/外延及 C 地址/类型假设。

独立 repaired native 回归 275 案无差异，含 ASan/UBSan、literal-bit oracle、sNaN/Inf/零、尾部、frame 和错误结果负控制。原始 121 案/44 反例及扩展原始回归分别保留，均不计作形式证明。proof/semantics.json 保留 runtime/reference 的原始阶段描述；它与 frozen-full-handoff.json 都不充当当前验收证书，当前完成状态读取 status/full-run 记录。

在已配置 QCP 2.1.4、Coq 8.20.1 且有独立 VADD fresh replay 的环境，从本案目录重放：

```sh
python3 proof/replay.py --variant repaired
python3 proof/check_full.py --config "$CONFIG" --dependency-dir "$VADD_COQ" --jobs 16
python3 proof/record_status.py
```

每进程 16 GiB，使用有限任务时限；不复制组件 .vo。历史失败、超时和名称解析错误保留 provenance，只有真实完整门禁通过才准入。搬迁/发布审计是代码和已编译源身份检查，不另称一次形式证明。
