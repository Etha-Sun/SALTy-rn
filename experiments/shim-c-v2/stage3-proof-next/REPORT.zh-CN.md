# 第三阶段九项：后续 proof 与独立审核

本地分支 `feat/shim-c`，阶段检查点 `bdf42bf`，后续工作继续。只处理原第三阶段九项及其真实依赖。原 C/shim、公共 spec/wrapper、已冻结模型/锁和旧 checker 不变。用户未授权 push。**新增整核通过仍为 0/9**，没有新的 kernel 反例。

## 完整尝试与完整分母

下表只统计各自 full 运行的流式结果，不拼接不同运行。均因 1200 秒预算结束，缺最终完整 raw，不能严格验收。CFG 自动项另列于 inventory，不计入逻辑分母。

| Kernel / 候选 | 逻辑分母 | valid | 已尝试未证 | 无完成结果 |
|---|---:|---:|---:|---:|
| f32-gemm-minmax / candidate05 | 1199 | 359 | 23 | 817 |
| f32-dwconv-minmax / r4 | 827 | 431 | 32 | 364 |
| f32-dwconv-minmax / r6 | 840 | 408 | 16 | 416 |
| f32-spmm-minmax / cuts-v4 | 764 | 427 | 34 | 303 |
| f32-maxpool / cursor-r3 | 1239 | 301 | 18 | 920 |

maxpool 未证为 17 timeout + 1 unknown。dwconv r6 的另次 globals 9/9 不拼入 full 的 408。证据分别见对应 `INVENTORY.json`、`FULL01-STREAM.json`、`FULL-ROOT01-STREAM.json`、SPMM `REPORT.json` 的 `full_only_counts`。服务器曾严重拥塞；超时只表示预算内未证。

新 proof 会产生新义务。GEMM candidate09 的完整分母是 1218（1206 body + 12 global），candidate13 是 1225（1213 body + 12 global）；不得沿用 candidate05 的 1199 或把选定组几十项当整核分母。

## 九项实际 proof 进展

以下均为局部结果。被调用合同、上游断言或不变量仍有未证义务时，下游绿色不能单独组成整核证明。

| Kernel | 实际新增证明与现状 |
|---|---|
| f32-gemm-minmax | candidate09 helper 2/2、选定组 36/38，边界和两次加载关系通过，两步 acc 未证。candidate12 浮点 helper 4/4、主组 38/43，新增 ground 断言仍有债务；三个关键断言提高到 120 秒仍 0/3。candidate13 改为有完整定义的 predicate 实例化，helper 4/4，主组 40/44；FMA ground 实例化通过，剩 dup/acc 关系及原两步 acc。 |
| f32-igemm-minmax | cursor-r2 helper 3/3、主组 15/16；仅该组选定的 k 建立未证，实际 WP 涉及局部槽更新前后的分离。其它数值/内存义务保留。 |
| qd8-f32-qc4w-gemm-minmax | round-r2 实际 round_up_po2 body 6/7；四个后置条件依赖未证 mask_half，不能称 helper 完成。r3 新增有 body 的商余/移位 helper，正在验算全部新义务。 |
| f32-conv-hwc2chw | cursor-r1 10/15；r2 新 helper 4/4、RVV 游标组 11/13，仍有实际 store/rebase 关系；NEON width 的旧债务保留。 |
| f32-dwconv-minmax | r6 helper 6/6、权重组 15/15、扩大回归 37/37、global 9/9、控制接受。完整尝试仍未完成，见上表。 |
| f32-dwconv2d-chw | height-r1 真实 doz 与 helper 3/3、主组 11/14（RVV 高度子组 7/7）。独立 inline 实际 doz body 诊断 13/14，仍一项未证；不是旧 checker 的正式验收。 |
| f32-maxpool | cursor-r3 两个 helper 4/4、主组 18/18、控制接受、独立同伴审核。完整尝试见上表。 |
| f32-argmaxpool | index-r1 helper 6/6、主组 5/8、控制接受；channel 保持和两项索引游标未证。r2 给四个真实 u32 helper 补循环范围/写入范围/前缀证明，独立 inline 实际 body，待验。固定独立 unary 修复模型，不能偷换普通 frontend。 |
| f32-spmm-minmax | cuts-v4 helper 2/2、主组 14/14、独立复验及控制接受。column-v2 30/36、v3 map 4/5，剩局部分离等债务；inline prefetch 单独无改善。neon-frame-v5 为原先未注释的七个真实 NEON 循环补写入范围及范围/游标不变量，40 个新 invariant VC 已 28/40；272 个 equivalent assigns 尝试 900 秒后无最终 raw。v6 内联真实 vld2q_dup_f32 后入口 range 2/2，不能将窄写入范围当假设。 |

## 冻结与证据审核

`root-review/audit08.json` 与 `audit08-contracts.json` 核对 46 个候选，冻结文件/模型配置及 public spec 一致，没有新增 requires，20109 个外部锁条目校验通过（含不同锁的重复文件）。后续候选还需新一轮审核。静态 guard 不等于 proof 解析或断言成立。

所有 ghost/helper 合同必须由真实 body 证明；不添加外部无 body 合同或假设。独立 inline 执行诊断保留真实函数定义，并记录执行配置和 SHA；不能直接作为旧执行器的整核验收。

## 位表示桥的独立工具实验（未资格认证）

旧 Typed 模型的 canonical_nan 有 memcpy 字节视图与浮点值视图之间的未证关系；原生 IEEE FMA 实际 helper 已 NEON 22/22、RVV 21/21，因此不能以旧 1 秒筛选结果宣称 FMA body 缺失。

`byte-fp-prototype/` 与 `../stage3-byte-fp-front-v1/` 是独立新源码/安装，不用于任何 kernel。仅新源码替换旧 Bytes+float 的三个不健全 codec 公理，使用 native IEEE/BV 定义和逐 store 新鲜 NaN 位表示选择。旧 Bytes+float 仍禁用，旧模型/锁未改。

- 新 canonical_nan 的 proof-only 字节复制切分控制 14/14；不是 kernel 通过或整个新模型已安全的结论。
- codec-cuts02 全部控制尝试 900 秒超时，无最终 raw；零位表示/64 位 packing 等控制仍未闭合。
- v2 独立 Why3 lemma body 为 4/6，两个非 NaN 位逆关系超时。v3 拆分后 BV 逆 32/64 和 int32 有界往返共 3/4 通过，int64 往返仍超时；两个接口 body 2/2。固定 NaN 错误逆关系 32/64 及 false 三个负控制实际得到 SAT。
- 原型 CVC5 driver 中 `fp.to_ieee_bv` 被固定 CVC5 1.2.1 拒绝，这是后端不兼容，不能当负控制成功。后续原型只用固定 Z3 做独立实验，不修改旧 qualified 配置。
- 新 lemma 未导入公共 share。尚须完成所有实际正反语义控制、内存/别名/分支循环与 IEEE/FMA 回归，建立独立新锁并复验，才能考虑用于新冻结候选。

所有失败、未执行草稿、执行配置和日志保留。正式 `verified/manifest.json` 不变。只有 complete=true、全部 raw VC 通过、pending/缺失 body/global 为空、所有 source/model guard 与正反控制通过，才增加整核完成数。

## Typed 内存块编号审查（独立候选，尚无因果结论）

只读审查发现旧 MemTyped 中 UInt128/M_f32 都使用 rank 9，SInt128/M_f64 都使用 rank 10，compare=0 与结构相等不一致。独立 `stage3-typed-rank-front-v1` 只调整后续编号为 11..15，旧锁/source/binary 不变。当前普通 struct-copy 诊断失败是否由此导致尚待正反控制，不能提前声称修好模型；也不能据此无证据宣称历史 kernel 有误。10894 个源码文件只一处文件变化的审核已记录，独立编译完成后对同一 struct-copy body 的实际复验仍 5/9，与旧版相同，故不能把此修复称为当前 float-only 复制证明的解决方案。
