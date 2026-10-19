# 九项依赖的浮点位表示桥：独立只读评估

结论：值得制作**独立新版本的最小原型**，先只证明真实 `canonical_nan` 及内存正反控制。现有探针方向合理，尚不是 Frama-C 内存模型修复，也没有解除任何整核未证义务。本评估未改模型、锁、驱动、实现或 spec，未运行新 solver。

## 现有探针实际证明了什么

检查 `root-review/bit-relation-design01/{codec,coverage}.smt2` 与对应完整日志：decode 为原生 binary32 逐位解释；非 NaN encode 使用原生 fp.to_ieee_bv；NaN encode 通过独立 seed 生成两个符号和所有非零 fraction。所有函数都有定义，没有 codec 公理。

数值往返、合法 NaN、零符号保存和 NaN 位模式覆盖四项否定式为 unsat；覆盖式提供具体 witness：保留 sign，并将 fraction 减一作为 seed 的低位。模运算范围为 0..2^23-2，加一不会进入指数或零 fraction，因此覆盖包括 quiet 和 signaling NaN。逐位逆命题有 sat 反例 0x7f840000，符合 NaN 抽象丢失 payload 的事实。基础 sat 和错误命题否定式 sat 有助于排除片段内矛盾，但不是实际 C/WP 健全性证明。

## fresh seed 量化：存在可核对的实现路径

源码位于固定恢复版 `environment-recovery-local/.build/source/frama-c-33.0-Arsenic/src/plugins/wp/`：

- `MemLoader.ml:598-604` 的 `assigned_loc` 已使用 `Lang.freshvar` 创建未知值，再传给 `stored`；`544` 的 aggregate havoc 同样创建未知内存。
- `MemLoader.ml:556-561` 将存储变成 `Set(post_memory, store(pre_memory,...))`。
- `Cvalues.ml:29-31` 把 Set 解释为逻辑等式。
- `wpo.ml:180` 以 `F.p_close` 关闭最终目标；`Lang.ml:880` 明确 `p_close=e_close_forall`。

因此，若新 seed 在**每次实际 store_float 生成时**作为未绑定 freshvar 进入该 Set，其预期 WP 形状为 `forall seed, post. post=store(pre,encode(value,seed)) ==> Q(post)`，要求对所有允许表示均成立。它不是可由证明者挑选的存在见证。已有 havoc 路径是有力可行性证据，但仍需检查新原型实际输出的 WP/Why3/SMT：不得只凭调用 freshvar 就宣布满足量化要求。

关键实现条件：

1. encode 的 seed 必须为显式参数；不要在 CODEC_FLOAT 的 Generator 缓存定义或全局常量中分配唯一 seed。两个独立 store 不得意外共享 seed。
2. 同一次 store 生成的内存表达式保持同一个 seed；后续重复读取该未改变的内存只做确定性 decode，不重新选择 payload。
3. **memcpy 必须复制原始字节**，不得解码后重新 encode。直接复制同一 NaN 内存的字节必须保持逐位相等。普通浮点赋值可用任意合法 NaN 表示作过近似，但不能把这种重选套到字节复制上。
4. fresh int seed 可无界再转 BV32/64，使所有位模式可达；不要引入假设范围来缩小合法 C 输入。
5. 检查函数调用、分支、循环、不变式、aggregate assignment 的种子作用域，防止 WP 优化/缓存把两个语义选择错误合并。

## 最小应改哪些语义

旧 `MemBytes.ml:425-506` 的 CODEC_FLOAT 创建未解释 encode/decode 并注册三个 Admit（双向互逆和范围）。这些不能保留。当前 `535-536` 的 load_float 是 uint32/64 读取后 decode，`574-575` 的 store_float 是 encode 后 store_int；这是最局部的替换入口。

建议在独立源码/安装/driver/share/lock 中：

- 完全删除该三条 Admit；定义原生 IEEE/BV decode 和带 seed encode，支持 binary32、binary64，保留非 NaN 的精确位表示及 ±0；不支持的浮点种类必须明确拒绝，不能回退 Real 或旧公理。
- 只在 store_float 创建本次 fresh seed；接入既有整数 WBytes 读写、初始化、分离和 memcpy 语义，并携带此前已审计的整数 memcpy 修正。审计 UInt32/64 整数到 BV 的截断/有符号边界以及 endian。
- driver/Why3 定义必须落到 native FP/BV 操作，不把数字转换错当 bitcast。导出的 SMT 应不再出现旧 codec 公理。
- 可以先做**只支持 decode、遇到 float store 明确拒绝**的更小隔离原型，用真实 `canonical_nan` 探明 memcpy→decode 链；这不是可跑九项的模型。九项需要完整 store/assignment/aggregate 支持，不能部分启用后让旧 encode 偷渡。

没有找到现有已审计配置可直接闭合当前 Typed 的跨类型 memcpy。`MemTyped.ml` 使用分离的 Mf32/Mf64 等数组；其 `cast:912-926` 对不兼容布局报错或回退。仅在 driver 新增“字节等于浮点”的合同无法维护实际别名写入、重叠与逐字节更新，不是更小的 sound 修复。统一 Bytes 后端比给 Typed 的多数组临时加联系更容易界定修改范围，但仍须完整控制验证。

额外边界：SMT 浮点值本身不保存 NaN payload/sign。原始字节内存可以保留这些信息，但若后续 C 直接对已解码 NaN 调用 signbit，不能把 SMT 单一 NaN 的分类结果自动解释成原始 sign。当前 `cfloat.mlw:140` 的 sign_f32 使用 F32.is_negative；应审计九项实际消费者（例如 min/max 的 signbit 路径先限定为零）并保留“输出数值相等或双方 NaN”的既定观察范围。不要据此宣称任意 C 位观察/flags 已获证明。

## 最小正反控制清单

先检查生成公式，再由 root 在正常 IPC 环境运行；每组真实 C body，不只 isolated SMT：

- 正：真实 canonical_nan；uint32/64↔float/double memcpy 对常规值、±0、±inf、最小 subnormal；NaN decode 分类；store→load 数值/NaN关系；两次读取同一存储表示保持一致。
- 正：NaN 原始字节 memcpy 保持全部 bits、部分字节写入影响预期位置、不重叠写入 frame、初始化与有效性；32/64 endian 分别核对。
- 负：不允许证明任意 NaN store 固定为单个 payload/sign；两个独立 NaN store 不允许证明字节必相同；但同一内存的两次读取和字节 memcpy 必须能证明相同（同时查过约束与欠约束）。
- 负：不能证明错误 bitcast 1.0↔0、负零变正零的位相等、NaN 数值自等、全bits的 encode(decode(bits))=bits、非法/越界/错误分离 memcpy；false 控制不能得到 vacuous proof。
- 回归：已审计 IEEE/FMA 正反控制及严格已通过 kernel smoke；新环境独立冻结后二次复验。通过后才为九项另建新候选模型版本，绝不覆盖旧锁或把当前局部成果换成新模型下的整核通过。

## 与 SPMM 当前结果分开

cuts-v4 的完整尝试仍未通过：full-only 427/764，34 timeout，303 尚无完成记录；精选目标合并后的 442 不作为完整成绩。服务器严重拥塞是本轮预算解释因素，timeout 不是逻辑反例。本设计评估不改变这些事实。
