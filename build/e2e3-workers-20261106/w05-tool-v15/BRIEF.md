# W05：规则改写工具 rvv_ptr_lower v1.5（加入 x86 支持和新规则）

## 背景
仓库中的 `tools/rvv_ptr_lower/`（v1.4）是 Vekto 唯一允许用来改写源码的工具：确定性、按规则改写、不由 LLM 改源码。规则表和信任边界见该目录下的 `README.zh-CN.md`。W02（AVX probe）发现了几处工具缺口，监督者已经批准以下规则（见 `research/project-plan-20261102/DECISIONS-FOR-REVIEW.zh-CN.md` 末尾）。W02 的草稿和证据在 `build/e2e3-workers-20261106/w02-avx-probe/work/`（`tools-draft/`、`tools-cfg/`、`probe/`、`REPORT.md` 中的发现 2、5、9、15），只读参考。

## 任务
把整个工具复制到 `work/rvv_ptr_lower/`，在副本上实现 v1.5。监督者审核后再合回仓库，你不要动仓库里的原件。

1. **`--isa x86`**：x86_64 解析 profile，使用 `immintrin.h`、XNNPACK 的 `src/xnnpack/simd/f32-avx*.h`，并为 `<pthreadpool.h>` 提供 stub。写成正式的 config 节，替换 W02 用 `neon` 槽位做的临时覆盖。x86 模式只做规范化和下面的新规则，不做 RVV 式的全面指针化。
2. **R17 扩展**：被调名白名单加入 `_mm` 前缀。
3. **R20**：在预处理后的单元中，删除未被引用的顶层 `static inline` 函数（迭代到不动点）。不删非 static 函数，不删被引用的函数，每一次删除都记进 lowering.json。语义依据：内部链接且未被引用的函数没有可观察行为。
4. **R21**：在一次调用中，同一个按值向量变量作为多个实参出现时（例如 `_mm_movehl_ps(v, v)`），从第二次出现起拷贝到新的临时变量。语义依据：按值传参本来就是拷贝。适用于所有 ISA。
5. **调用点注解插入（R22）**：对"按值传入向量且被调方写堆"的 wrapper 调用，在调用点插入 `/*@ where p=&v */`。只插注释，插入前后的 C token 序列必须完全相同，并由工具自检。参考 W02 的 `tools-cfg/annotate.py`。

## 要求
- 规则表（README）中每条新规则都写清：原形式、改写后形式、语义依据、拒绝条件。规则表之外的构造一律拒绝，不猜。
- 回归：v1.4 原有 35 个 RVV kernel 和 NEON 规范化的输出必须逐字节不变，除非新规则正当地触发，并逐条列出。用 `validate.py` 的确定性和幂等性检查。QEMU 差分测试需要上游 SALTy harness（`research/sol-pipeline-comparison-20261030/sources/SALTy-rn`），本机目前没有；如果缺少 harness，就只做确定性和幂等性检查，并在报告里写明。
- x86 新测试：对 `f32-vabs-avx.c`、`f32-vlrelu-avx-u16.c`（`benchmark/XNNPACK/src/...`）分别运行，原版和改写版都用 gcc `-mavx` 编译，在本机用随机输入（包括 NaN、±0、inf、各种尾部长度）做差分测试，要求输出逐比特相同。
- 报告：`work/REPORT.md`，包含规则表 diff、回归结果和 x86 测试结果。
