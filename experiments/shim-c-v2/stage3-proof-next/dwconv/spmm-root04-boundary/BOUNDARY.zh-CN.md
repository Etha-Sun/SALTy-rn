# root04：SPMM uintptr 步进的只读边界审查

本次没有启动 solver、生成新 WP、修改 proof/模型或重复基线。复核现有真实控制、v10 源码与既有 WP。完整模型不可能性未证明，原 C 反例未发现。

## 精确目标与证据强度

真实 C 步骤为 `output = (float*)((uintptr_t)output + output_stride)`。游标保持需要把 `addr_of_int(to_uint64(stride + to_uint64(int_of_addr(previous))))` 与 `shift_float32(column, next_index*(MC/4+4))` 联系起来。v10 selected-root01 是 3/4，唯一未证保持不能单靠这个计数称为模型不可证。`preserved-goal.txt` 是早期同一 C 步骤的导出，不是 v10 fresh dump。

实际 typed-root01 控制 7/10：普通 typed 步进、原址 roundtrip 通过；合法固定16字节 uintptr 步进后置条件未过，两个故意错误后置条件也未过。该控制配置是 Typed+float，v10 是 Typed+raw+float，不能改称 Raw 控制复验。失败/超时不是反例；有限片段例子也不是全 WP 理论模型。

## 冻结理论到底缺少什么联系

锁定 memaddr.mlw 137–145 把 encode/decode 声明为抽象函数；已存在的逆向条件仅为 `statically_allocated(p.base) -> decode(encode(p))=p`。有效性约束可给静态分配，但没有把 encode 与 shift 的 offset 相加联系起来。局部要解释的最小问题是：对于当前合法同对象 p 与 p+4，为什么 decode(uint64(encode(p)+16)) 必须等于 p+4？原址逆不回答这个问题。具体整数无溢出同样不能规定编码的位移含义。

没有找到冻结 Typed 模型下已经提供该联系的可复用 body 引理。给表达式套 predicate、把同样 C 转换放入 ghost body 或只证明 stride 的整数算术，均没有新增语义信息。将不变量改成真实 cast 的递归轨迹可以描述游标，但仍不能推出原 spec 要求的 typed 数组有效性及输出位置；不能以这种轨迹替换最终关系。两 ISA 都沿 opaque 轨迹走，也不足以把不同输出 buffer 的对应 typed 元素观察联系起来。

## 独立修复必须承担的义务（未实施）

应先选定目标 C 实现的指针整数语义，而不是追加全局 affine axiom。独立模型至少需要定义对象标识、对象基址、字节偏移、有效区间及整数编码，再由该定义证明：

1. 当前声明域内活对象布局不重叠、编码宽度及生命周期规则一致；合法对象内部与一过尾地址能正确 encode/decode。数学有限地址空间和对象集合的相容性不能略去。
2. 对实际 kernel 可达的合法同对象位移，证明带确切整数转换的桥 `decode(uint64(encode(p)+d)) = shift_bytes(p,d)`；正负位移、混合 signed/unsigned 转换与中间回绕条件须逐项覆盖，不能仅验证固定 +16。
3. 由原冻结 wrapper 域推导上述桥在每个 SPMM 步骤的适用条件；如必须加新的 no-wrap/provenance 前提而原域推不出，不能采用该修复来声称原任务完成。
4. 证明表示关系保持原 load/store、别名/分离、memcpy、对象大小和字节/类型步长一致，不能只让地址相等目标变绿却改变读取的内存。
5. 重新锁定独立版本全部依赖，重跑实际 C 正反控制及完整 closure。负控制必须保留且区分 SAT、Unknown、timeout、backend error；包括错误步长、跨对象及回绕边界，不能凭一个未过负例宣称模型健全。

另一条可审计方向是具体平台定义允许时，在前端对已满足条件的 pointer→integer→addition→pointer 模式作正确规范化；它也必须有逐模式语义依据并从原域证明条件。仅把原址 `+0` 消除不能解决 `+sizeof`/动态 stride，不能称为通用桥。

当前结论：保留 SPMM 未证状态，不推荐再堆 body helper 或未经证明的 affine 支持。以上是可核验的缺少联系及修复责任划分，不是整个当前逻辑的形式不可证明定理。
