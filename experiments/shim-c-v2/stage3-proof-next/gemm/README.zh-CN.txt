GEMM续补，起点HEAD 7a2e0ae，旧候选 stage3-gemm/f32-gemm-minmax-r4。
范围仅 f32-gemm-minmax 及其真实调用依赖。固定旧实现/spec/wrapper/shim/模型/checker，未新增前提或公理；每candidate唯一proof.patch与独立manifest，原C/token/spec守卫按原checker.prepare执行。

候选01：新增双FMA递归展开lemma，以及NEON首行首半的input/weight load、中间累计和局部frame断言。实际解析失败：同comment内包含三条assert，原失败保留。
候选02：拆开code annotation后实际解析再次失败：Stage3Block早于局部k声明，\at中引用k作用域不合法。
候选03：label参数read(p,i)=p[i]定义使索引在当前点求值、内存于旧label观察，无假设。模型正反控制accepted=true；selected01同时选全部六条新增assert、新增two-step lemma、三个旧递归/FMA lemma与原NEON首行首半不变量建立/保持，共12 WPO。所有assert和lemma仍须自身证明，后继目标依赖未证assert时不算全链通过。

独立run.py只作诊断执行层：保存固定observer事件、raw、完整命令及源/annotated/proof/模型外部文件/observer/runner前后SHA；wp-par=2，每solver内存2048MB，常规solver timeout30。旧proof内checked策略自己的timeout仍10。未将1秒快筛当验收。
所有候选及失败保留；严格整核验收须完整body/global raw、全部VC通过、原守卫与正反控制接受，并由主agent独立检查。局部通过不等于整核通过。
