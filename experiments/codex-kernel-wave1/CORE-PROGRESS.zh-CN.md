本轮任务：两个整数收尾 + 八个核心 kernel。DeepSeek 未使用。spec 和普通 C 继续冻结；修复卷积 target 是先前单独批准并冻结的独立版本。

下表是实测证据与未完成项，不是十个 kernel 都已通过。最终收录以 verified/manifest.json 为准，当前15项收录（含新integer-v4的qs8-vcvt与qs8-vlrelu）。

| kernel | 已完成的实质证明 | 仍需解决 |
|---|---|---|
| qs8-vcvt | 删除旧模型冲突公理后的v55完整与root独立各1220/1220；与旧版proof/全部goal ID相同；实际canonical plain/annotated LLVM相同 | 新包qs8-vcvt-bytes-v4 canonical也1220/1220、579.358s，通过source/闭包/TCB审核后加入manifest；原版RVV反例及旧修复均保留 |
| qs8-vlrelu | 新integer-v4模型的v43两轮均1546/1547；v44仅将最后neon_bulk_old_frame加入既有30s策略，实际单项1/1 | v44完整1547/1547、root独立1547/1547；新包canonical再次1547/1547（618.813s）并加入manifest，旧v3绿色结果隔离 |
| f32-raddstoreexpminusmax | 新native-v6 v106真实support两组103+284=387，v97-v6主循环/连接联合24/24，v106全39global；新tail load/value/store3/3（均局部，非整核） | 同一候选补齐readonly/values循环保持、NEON/tail/最终输出；errno alias与4字节sum对象的域边界 |
| qd8-f32-qc4w-gemm-minmax | 新native-v6 v16单raw46真实helper756/756、39global；同域反控制精确3/4。旧v12实际主函数91/114只作隔离历史，未继承至v6 | 主程序23项：4外层不变量、6RTE、1assigns、12调用前提；公开wrapper、额外errno模型前提门禁；新局部cuts仍未全部闭合 |
| f32-argmaxpool | 真实mask select78/78、u32依赖22/22 | 原公开index padding不足以保证源NEON尾部读取，属于冻结接口/源内存安全边界；主循环和公开caller也未闭合 |
| f32-maxpool | 新native-v6重新检查19个真实数值helper321/321及11global；store70组预算尽无raw。旧memory114只作隔离历史 | uintptr地址还原、主循环frame和最终caller；局部数值通过不能取代内存证明 |
| f32-conv-hwc2chw | 原版右边界有限反例；独立target修复回归；共享索引支持与实际18个更新/skip/VL/mask连接 | 完整卷积循环、地址/packed布局和公开caller；原版、修复版分开保留 |
| f32-dwconv2d-chw | 共享索引/strided load支持，已补实际循环不变量 | 主地址关系、完整累加/输出关系与caller |
| f32-igemm-minmax | 共享索引/strided load和FMA连接，已补实际循环不变量 | packed布局、主地址关系、完整输出与caller |
| f32-spmm-minmax | 共享索引/strided load和FMA连接，已补实际循环不变量 | 稀疏索引/地址关系、完整输出与caller |

共享索引的11个实际helper已经按来源分组复验（114+106个VC）；这不等于四个地址型kernel都完成统一全量验收。所有数字都有具体版本与局部范围，不跨版本拼出整核通过。

审计门禁：不放宽公开pre，不改普通C，不加axiom/assume/不透明helper合同，不把无raw、0/0或部分green视为成功。libc内容/终止合同、WP/Why3/SMT和memory model仍属TCB，ISA/intrinsic到shim的对应没有在此路线中证明。详见 WAVE2-REVIEW.zh-CN.md 和 audit/ 下的原始记录。

本次模型审计：旧Bytes模型的全局pointer uint64范围公理与无限offset+逆映射冲突，已用独立Lean证明并经peer复核。旧v3/v5局部/整核green全部保留但隔离，不能新增收录。新integer-v4仅删除该公理，正反控制与root独立qualification已通过；native-v6也仅删除它；原先资格正例借助checked整数NaN分类桥在完整合并184目标中179/184，剩5个均为预期反例；root独立全量179/184（5原反例）、FMA18/20、repr11/14、book6/8、NaNloop51/52全部达预期，已放行新冻结候选；不是模型一致性证明。未据此断言13个历史Typed收录项同样受影响。详见audit/pointer-range-consistency-root01和audit/integer-v4-root-independent01。

新v6重放的scope与未证依赖见各worker原始raw/guard/qualification记录，不把跨版本局部计数拼成整核成功。
