# 本次调研验证记录

2026-09-06（Asia/Seoul），SALT `7ea7bf35317eb5434341c2f4f3b72776a1a5deae`；neon2rvv `2abbe36cc3c52d4616f854f88894e5be11b96580`。

Confirmed：仅新增 `research/` 下的调研文档、库存脚本和诊断产物；没有修改原有 tracked C、Python、Lean 文件，没有提交或推送。

## Corpus 结构审计

命令（从 lean 根目录）：

```sh
python3 research/audit_corpus.py research/corpus-audit.json
```

40/40 `test_neon` 经 Clang 14、aarch64-none-elf、freestanding、真实 arm_neon.h 和重建 audit facade 成功解析。

- Source loop depth：1→22 个、2→9 个、3→9 个。
- 54 ForStmt、25 DoStmt、7 WhileStmt、230 IfStmt。
- 无 BreakStmt、ContinueStmt、SwitchStmt、GotoStmt、显式 ReturnStmt。
- 28 个 FP kernel；17 个 pointer/integer address conversion；5 个 pointer-table kernel；3 个 tuple `.val[]` 使用者。
- Raw branch union：190 intrinsic spelling。Arm64 active profile：178，neon2rvv 有定义 176，缺 vzip1q_f32/vzip2q_f32。
- Target：36 非空、1 空、3 缺失。

`corpus-audit.json` 是结构库存，不是完整程序 verification 或 RVV compile report。脚本中 XNN 宏和参数声明是 audit facade，不能作为 caller contract 或 production parse authority。

## Lean artifact 诊断重放

命令：

```sh
python3 research/replay_lean.py /srv/home/yuechunsun/.elan/toolchains/leanprover--lean4---v4.29.1
```

7 个基础模块成功构建，2 Proof.lean、10 Counterexample.lean 全部成功；每个都经过 `#print axioms`。

- `f32-f16-vcvt.completeValueEquivalence` 与 `f32-vrndne.completeValueEquivalence`：仅 propext、Classical.choice、Quot.sound。
- 9 个 FP complete-value counterexample、1 个 S8 phase counterexample：都包含 native_decide 的 native axiom。
- 详细版本与逐定理输出在 `lean-replay.json`。

这是不同 patch 版本上的诊断重放。仓库固定 Lean 4.29.0；没有改 pin、重新发布 Result 或声称通过原完整内容寻址/环境身份认证。FP 正常运算仍依赖 host-backed Float32，proof 的标准公理清单不能代替语义对应证明。

## 现有 Python tests

初始系统 Python 缺 pytest；用 uv 临时缓存安装 pytest。第一组 capabilities/recognize/schema 为 22 passed。随后一组 43 tests 为 34 passed、9 failed：其中 4 个因本机没有 pin 的 Lean 4.29.0，5 个为 capability registry 问题。

为隔离环境问题，显式选择已安装 4.29.1 后运行以下诊断集合，不修改源码或 pin：

```sh
env UV_CACHE_DIR=/tmp/uv-cache PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=src \
  ELAN_TOOLCHAIN=leanprover/lean4:v4.29.1 \
  uv run --offline --no-project --with pytest python -m pytest \
  -q -p no:cacheprovider --tb=line --junitxml=research/diagnostic-tests.xml \
  tests/verification/elementwise_compiler/test_capabilities.py \
  tests/verification/elementwise_compiler/test_recognize.py \
  tests/verification/elementwise_compiler/test_schema.py \
  tests/verification/elementwise_compiler/test_contracts.py \
  tests/verification/elementwise_compiler/test_intrinsics.py \
  tests/verification/elementwise_compiler/test_compiler.py \
  tests/verification/elementwise_compiler/test_wide_generation.py
```

结果 **60 passed, 5 failed，81.93s**。JUnit 保存于 `diagnostic-tests.xml`。剩余 5 个都是 `test_wide_generation.py`：

1. wide fixed tail [16]：全局 registry 缺测试 descriptor `salt_neon_high2_u16`。
2. wide fixed tail [32]：缺 `salt_neon_high2_u32`。
3. f32 fixed tail：缺 `salt_neon_high2_f32`。
4. u16 no tail：缺 `salt_neon_load4_u16`。
5. mixed i32/i16：缺 `salt_neon_load4_i32`。

Confirmed cause：当前 `compiler.py:354` 新增全局 `verify_capability_refs(root, refs)`；registry 从默认 canonical index 构建，不使用测试传给 compile_pair 的自定义 index。错误在该关卡明确报出 absent capability。Inference：发布整理引入了测试扩展点与正式能力注册接口的不一致；不能从这五个失败推导 arithmetic/loop theorem 错误。

## Binary32 FMA 公式实验

```sh
clang -O0 -ffp-contract=off research/fma_witness.c -lm -o /tmp/saltyrn-research-fma-witness
/tmp/saltyrn-research-fma-witness
```

结果 exit 0：`separate=0x00000000 fused=0xa8800000`。

这是有限正常输入的 host binary32 公式实验；不是 neon2rvv 交叉编译或硬件执行测试。

## 未执行的实验

- 未初始化 XNNPACK/autocomp/Chipyard/Zephyr 大型 submodule；没有重新验证上游 caller contract 的全部来源链。
- 未运行新 LLM 翻译或 autocomp 性能优化。
- 未部署现代 RVV cross compiler 与 Spike/QEMU；未声称 neon2rvv 编译 40 kernel 成功。
- 未运行整个仓库 test suite 或原 Lean 4.29.0 认证 pipeline。
- 提议的 imperative subset 尚未实现，所以没有该新 IR 的形式化 coverage/preservation theorem。
