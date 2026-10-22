# 保留原始调用形式的 VADD 验证

本轮复用旧 QCP 模型和证明，保留两侧原 kernel 的 C token，只插入证明注释。
`generate.py` 复用既有冻结检查及 C token lexer，并逐 token 核对原 NEON 函数。
RVV 的对应检查在 [byvalue-rvv](../byvalue-rvv/README.zh-CN.md)。

## 当前结果

- NEON 原循环及尾部：118 个新 C VC，完整 `neon_full_checked.v` 模块已通过 Coq。
- NEON shim：26 个实际 C VC，通过；430 组本机回归与原实现一致，含 NaN、Inf、±0、
  非正规数、各种尾部长度、输入保持和输出边界检查。
- RVV 原循环：45 个新 C VC（kernel 40、assert/vsetvl 5），完整模块已通过。
  按值外壳 11 个 VC 通过，正式路径使用其中 load/add 的 8 个。
- 既有 `equivalent` 调用方的 9 个 C VC 重新检查通过；两侧新 kernel 的合同与
  该调用方引用的合同逐字去空白比较一致。
- 本次不将旧依赖闭包视为重新检查，也没有证明旧公开 mapper 的内联比较循环到
  helper 形式的程序转换。因此本记录不是新的跨 ISA 端到端接受证书。

统一运行：

```sh
python3 verification/qcp/experiments/byvalue-vadd/replay.py
```

入口会重新生成 shim 与 NEON 目标、检查完整 Coq 模块、运行 native 对照、
调用 RVV 完整重放入口，并重新检查旧 equivalent 调用方。旧 wrapper 记录先备份后恢复；
本轮结果保存在本目录 `evidence/`。`replay-status.json` 仅在全部步骤成功后写入。
需要已有 QCP/Coq 配置和已编译旧模型，不是独立安装包。

## 原程序与 shim 的关系

原代码继续写：

```c
const float32x4_t va = vld1q_f32(input_a);
const float32x4_t vb = vld1q_f32(input_b);
float32x4_t vacc = vaddq_f32(va, vb);
vst1q_f32(output, vacc);
```

类型仍是有元素类型和通道数量的 struct。load/add/get 按值传参或返回。
QCP 调用后增加 `/*@ where a = &va, b = &vb */` 等证明注释，普通 C 编译器忽略这些注释。
原文件只读，`neon.c` 是从原文件生成的注释副本，没有把返回值改成输出参数。

store 在 shim 中使用这个宏：

```c
#define vst1q_f32(p,a) qcp_vst1q_f32((p), &(a))
```

因此 **shim 内部仍有指针调用**，预处理后也能看到地址参数。这是目前明确采用的适配，
不能称为完全消除了指针；不再需要旧的外部 kernel 调用改写器。
宏只支持当前 kernel 的向量左值，不能直接用于 `store(p,add(a,b))`。
它只借用局部向量供读取，要求输出与该局部向量分离；当前 VADD 证明保留这项资源条件。
一般 kernel 的重复向量输入、嵌套表达式和其他 intrinsic 仍须单独验证。

## 复用了哪些证明

NEON 的 118 个义务分为：

| 文件 | 义务数 | 做法 |
|---|---:|---|
| `neon_reused.v` | 46 | 新旧目标类型相同，直接 exact 旧定理，由 Coq 再检查 |
| `neon_adapted.v` | 31 | 旧安全和分支证明步骤，适配分支编号和 binder 名称 |
| `neon_copy_checked.v` | 26 | 复用 FastFrame，处理结构体复制、资源重排及 undef |
| `neon_load_calls.v` | 8 | 复用旧数组打开引理及复制策略 |
| `neon_store_calls.v` | 5 | 复用旧输出数组和尾部引理 |
| `neon_pure_tail.v` | 2 | 尾部调用的纯前提 |

最终模块显式实现新生成目标的完整 `VC_Correct`，避免只证明部分义务。
这 8 个新增 Coq 文件（含 shim 与组装模块）共约 460 行，RVV 正式 5 个 Coq 文件
约 219 行；这些行数不包含旧证明依赖或生成目标，不能当作独立证明的全部成本。
`Print Assumptions` 仍显示 QCP 布局和 Coq 经典逻辑等既有假设，没有新增假设来完成证明。

## 纯按值 store 的失败对照

`history/pure-value-store/` 保存先前尝试的源文件、展开 C、目标和生成记录。
该路线的 store 本身能证明，但在 kernel 调用处生成重复的输出资源：
同一 cell 同时以已写和 undef 的分离资源出现。我们没有用矛盾前件强行闭合循环。
采用 shim 内 store 宏后，这份重复消失，旧循环资源证明可以复用。

证明范围仍是既有 C shim 下的部分正确性；输入为全部 binary32，观察为数值相等或双方
为 NaN，固定 LP64/小端/RNE、RVV VLEN=128、e32m8 容量32。未证明任意 VLEN、
浮点异常标志、终止性或真实 ISA 到 shim 的语义对应，也未覆盖全部40个 kernel。
