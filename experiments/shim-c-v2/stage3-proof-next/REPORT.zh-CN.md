# 第三阶段九项：后续 proof 与独立审核

基于本地 `feat/shim-c` 的 `7a2e0ae`，只处理原第三阶段九项及其真实依赖。原 C/shim、公共 spec/wrapper、当前模型/锁与旧 checker 均保持冻结。未经用户再次授权不 push。本报告是阶段检查点，工作继续，**新增整核通过仍为 0/9**。

## 已完成的本轮完整尝试

完整清单与完整证明分开记录；下表“通过”来自该次全量尝试的流式事件，包含单列的全局 lemma，不合并定点运行的绿色结果。三个完整尝试均到达 1200 秒预算，没有完整 body raw 与正常结束标记，不能据此验收。

| Kernel / 候选 | 完整逻辑分母 | 本次流式通过 | 已尝试未证 | 无完成结果 | 严格整核验收 |
|---|---:|---:|---:|---:|---|
| f32-gemm-minmax / candidate05 | 1199 | 359 | 23 | 817 | 否 |
| f32-dwconv-minmax / r4 | 827 | 431 | 32 | 364 | 否 |
| f32-spmm-minmax / cuts-v4 | 764 | 427 | 34 | 303 | 否 |

CFG 自动项分别为 30、36、34，单列不混入通常 raw 分母。旧版 GEMM 1184 等数字不能用于新 proof。逐项事件及清单见 `gemm/candidate05/INVENTORY.json`、`FULL01-STREAM.json`，`dwconv/FULL-STATUS.json`，`spmm/cuts-v4/REPORT.json` 中的 `full_only_counts`。SPMM 报告另有合并同候选定点证据的计数，不能当作这次 full 自身的成绩。任何下游通过项仍可能依赖其它未证不变量/callee 合同。

共享服务器在运行期间发生显著资源拥塞：09:58 UTC load average 约 1827/1494/863；10:01 UTC 的 `/proc` 实测保存于 `root-review/resource-observations.jsonl`。所有超时只记预算内未证，不解释成逻辑反例，也不据此修改 target。

## 实际补 proof 的结果

- SPMM cuts-v4：通过真实 decrement body 的 ghost 算术 helper 及切分点，原 6 项内层游标建立/保持和全部新增相关 VC 共 14/14；helper 完整 body 的 ensures/assigns 为 2/2。相同 30 秒配置的原 frame-v3 为 5/6，因此实际闭合的是 weight 保持，不能把预算增加带来的 nnz 通过计作新 proof 成果。主 agent 独立复验 14/14、helper 2/2、真假控制接受。外层column-v1为24/30，两个helper body4/4；column-v2新增prefix-zero helper，完整helper body6/6，主组运行中。
- Dwconv r4：保留实际行基址和原地址关系，在 RVV 更新前后加入两个须证明的断言，行游标组 14/14，包含原 12 项建立/保持及两个新断言。相同预算 r3 为 11/12。主 agent 独立复验 14/14、全局 8/8、真假控制接受。r5 选定组29/32，剩三项权重游标；r6 的有 body 条件引理与实际更新切分点使权重相关完整选定组15/15，新增helper body6/6，真假控制接受。r6新完整清单840（body831+globals9，另CFG42），globals已9/9；扩大回归组运行中。
- GEMM candidate05：增加权重内存保持切分点、packed 索引引理、FMA 递归替换关系，选定组 16/20；两次 weight load 与两步 FMA 累加切分点仍未闭合。candidate06 为 18/26，含新索引债务及本次 frame 超时，不能按分子增加宣称改善。candidate07 从05派生后33/37，剩两个首lane边界和两步acc；candidate08 35/38，剩首个边界与两步acc，helper body2/2。candidate09将helper的forall实例化改为具体lane参数，helper body2/2，主选定组36/38，边界/加载关系均通过，仅两步acc未证。candidate10加入8个实际FMA逐lane值切分点及4个frame切分点，全部新增债务纳入新运行。所有新增义务纳入，不按分子增加宣称整核改善。candidate05 独立真假控制接受。
- 已扩展到九项中的 f32-maxpool：cursor-r1 用有 body、无 requires 的 size_t 减法 helper 和两个 rebase 断言，选定组 15/17；剩两项输出游标建立。导出的真实公式有初始等式，但此前 NEON/内存路径上下文很大。cursor-r2 尝试 WP 内置假设过滤，600 秒未完成，不能算改善；cursor-r3改为显式实例化有body的指针零偏移关系，主组18/18、两个helper完整body4/4、真假控制接受。独立同伴静态审核通过；新完整清单为1239逻辑项（body1234+globals5），另有32个CFG项，full01正在尝试，尚无整核结论。

conv-hwc2chw已准备width/cursor候选并在实际运行；dwconv2d-chw已准备height候选，真实doz只补精确ensures（无新requires/assigns），doz和新ghost helper完整body3/3、真假控制接受；主组运行中。其余三项（IGEMM、qd8 GEMM、argmaxpool）保留上一轮完整清单/尝试，尚未在本轮新增整核验证记录。后续仍只在这九项内扩展。

## 审核与共同阻塞

`root-review/audit06.json` 与 `audit06-contracts.json` 核对31个候选：冻结文件条目/模型配置一致，public spec 字节一致，没有新增 requires；10053 个外部锁条目通过校验。静态 guard 不等于断言已证，后续新候选仍需重新审核。真正新增的 ghost/helper ensures 均需完整检查 body，不能把它作为外部公理。

原 GEMM 实际 FMA helper 在合理预算下 NEON 22/22、RVV 21/21；旧 1 秒快筛的超时不能据此判缺 proof。共同的 `canonical_nan` 仍有 5 项未证：Typed 对 memcpy 的字节视图与 float 值视图缺少所需关系，具体 WP 公式及源模型定位见 `root-review/NOTES.zh-CN.md`。没有发现新的 kernel 反例。

`root-review/bit-relation-design01/` 仅是独立语义设计探针：用原生 IEEE/BV 定义检查数值往返、NaN 合法性、零符号和全部 NaN payload 可表示性，拒绝错误的逐位双向互逆。探针本身没有接入Frama-C，不是已验收的内存修复或kernel证明。另建的源码原型位于`byte-fp-prototype/`，新安装实验位于`../stage3-byte-fp-front-v1/`：仅新source替换三个不健全codec公理为原生IEEE/BV解释，逐store新鲜NaN表示选择；正在独立编译/审查控制，尚未资格认证，也未用于任何kernel。旧source、binary、share、锁和防护未变。新鲜选择的量化、内存关联、memcpy/endian 和完整正反控制仍需审核。

所有历史失败、未执行草稿和新失败保留。正式 `verified/manifest.json` 不变。只有最终完整 raw 全绿、pending/缺失覆盖为空、所有 guard/模型锁/正反控制通过，才计新的整核完成。
