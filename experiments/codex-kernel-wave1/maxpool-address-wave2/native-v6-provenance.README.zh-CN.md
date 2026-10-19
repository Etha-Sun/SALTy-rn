# Native binary32 Bytes v6：构建与资格证据

本文是新增说明文件，不修改任何已冻结模型、脚本、kernel、spec 或 proof。仓库根目录为 `/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence`。文中的相对路径均从该目录出发。

截至本说明建立时，worker 的旧 profile 尚未切换。v6 的本地资格检查已关闭所有预期正例；root 正在独立重放。资格检查不是模型一致性证明，也不是完整 kernel 等价性证明。

## 1. 改了什么

新后端为 `experiments/codex-kernel-wave1/float-bits/model-native-bytes32-v6-no-pointer-range`；FMA 组合入口为 `experiments/codex-kernel-wave1/core-float-wave2/model-native-bytes32-v6-fma`。

新后端从旧 `float-bits/model-native-bytes32-v5-bookkeeping/.build/source` 独立复制并重建。唯一源码变化是 `src/plugins/wp/MemBytes.ml` 删除 `PointersProperties.ranges()` 的十行定义及 `compile()` 中一次调用，停止注入旧 `Q_pointers_int_range` 全局 law。没有新增 law、axiom、requires，也没有修改地址转换的其他规则。

旧 law 对无限 `addr(base=0,offset=任意整数)` 施加有限 uint64 物理地址范围，与旧模型已经存在的静态地址 inverse 冲突。该问题的映射和独立 Lean 数学检查见 `experiments/codex-kernel-wave1/audit/pointer-range-consistency-root01/` 及本目录 `pointer-range-lean-peer-review.json`。旧模型的成功记录保留为历史，不能据其宣称程序等价。

| 项目 | SHA-256 |
| --- | --- |
| 原 MemBytes.ml | `e1c9d9ab625f6d3bccab6e9a340ab6eb5bccc34758da82d7c1b0299918019044` |
| 新 MemBytes.ml | `3de8c76038b4a959dc62197d43e928d99bc2ea2823b605cbf8de9ebd018de57f` |
| 11 行删除 patch | `03badd89444ab455ebd8c11f09b1ae9abccac48d648864d370dc8430036aaf1b` |
| Native v6 lock | `9d6e312082637fa2bd7e8c55b02e7384084b3a7b0614dec92e0bbd07e08d14ce` |
| FMA v6 lock | `719fc553cd7c9839b8cd767c1ecf8de67f423f75b91e462943232740909cf97c` |

完整 before/after 源码哈希见新后端 `source-audit.json`，不是仅比较上述一个文件。`Cint`、`Cfloat`、`MemAddr`、binary32 word codec、NaN 存储规则、Float64 拒绝、ProofEngine trivial-child 统计补丁均保持不变。Why3 share 与 driver 内容保持不变；`why3.conf` 仅重定位两个 driver 路径。FMA 入口仅委托到新 v6 后端，仍追加原 `experiments/shim-c-v2/model-fma/fma.driver`。

新 lock 初次写入时保留 candidate 描述；后续资格结果单独追加，不为更改状态而改写 lock。本目录 `native-v6-lock-recheck23.json` 记录资格检查后对 34305 / 34307 个锁文件的完整重新计算，均零差异；root 另有独立审计。

## 2. 如何重建

构建脚本是 `experiments/codex-kernel-wave1/float-bits/build-native-bytes-v6-no-pointer-range.py`。它要求两个输出 namespace 不存在，否则立即停止。已建立的模型不可原地重建；保留原件，使用独立配置好的工作区进行重建。

构建依赖旧 v5 的完整 `.build/source`、项目已配置的 opam switch 与本机 prover。只有 Git clone 不具备这些外部环境。

```bash
cd /zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence
python3 experiments/codex-kernel-wave1/float-bits/build-native-bytes-v6-no-pointer-range.py
```

脚本设置 `OPAMROOT=experiments/shim-c-v2/toolchain-build/.build/opam`，通过该工具目录的 `bin/opam exec --switch=shim-wp-fix -- dune` 执行 build/install，构建并发为 4。原始 argv 和日志分别在新后端 `build-command.json` / `build.log`。然后重放原 `float_bits32.mlw` 的九项 helper，证据为 `helper-proof-command.json`、`helper-proof.log`、`helper-proof-result.json`，实际 9/9。

## 3. 资格检查来源与最终证明

初始自动资格脚本 `float-bits/qualify-native-bytes-v6-no-pointer-range.py` 的 native / fma 两组结果在各新模型的 `controls/`。这些是保留的首轮记录：其中 word-store 还缺整数分类桥，NaN loop 的两项 RTE 有预算超时。不要把首轮 `accepted:false` 改成 true，也不要用最终报告掩盖它们。

最终控制证明只有一个 C 文件：本目录 `qualification-proof24.c`，SHA-256 为 `e64f75c2d081524b29953752a47d50864eb84a3b620b3d8fa0ec80f9c140e82b`。

它合并两个原控制文件：

- `experiments/codex-kernel-wave1/audit/codec-store-controls.c`；
- `experiments/codex-kernel-wave1/float-bits/probes/byte32-special-controls.c`。

16 个原函数的 contracts/signatures 原样保留；普通 C 不变。新增内容只有 ghost helpers、ghost calls 和证明断言。原合并程序与证明版通过同一 clang14 stdin 编译，LLVM IR 逐字相同；命令、IR 与哈希见 `.build/qualification-proof24-llvm/result.json`。

三个 ghost helper 都实际检查 body：

- `proof_nan_mask`：从两个 NaN unsigned-word 区间证明 exponent mask 全一、mantissa 非零。先用标准 `Wp.shift` 连接右移与除法，再处理两个符号区间；mantissa 为零分支与严格 NaN 区间矛盾。来源为 root 独立检查的 `audit/nan-mask-root04/bridge.c`。
- `proof_non_nan_mask`：在 NaN 区间反证分支调用前一个 helper，得到与原 mask 前提的矛盾。
- `proof_nan32_intervals`：在未修改的 binary32 driver 下实际证明 `from_repr32(u)` 的 NaN 分类等价于两个 unsigned-word 区间。

没有把未证明 assert 当作已完成。早期 `proof19` / `proof21` 中的 `decoded_input_non_nan` 确实未证，原始失败保留；最终版本用上述有已检查 body 的 helper 关闭。原规格不添加 NaN、有限数、pointer range 或 array length 限制。

最终同源完整两轮 `native-v6-combined-proof24` 与 `native-v6-combined-proof25` 均为 **179/184**，分别 111.65 / 111.00 秒，exit 0。第二轮使用独立的新 WP session / output，cache none。全部 20 条新增断言、22 项 helper 义务、其余原正例和 RTE 都通过。恰好五个预设负例仍未证明：

- `arbitrary_value_roundtrip_ensures`：任意 NaN payload 经值复制后完全保留；
- `independent_nan_stores_equal_ensures`；
- `nan_stores_equal_control_ensures`；
- `codec_false_ensures`；
- `byte32_false_control_ensures`。

完整 raw、argv、日志、计时见相同 run 名的 `.json`、`-command.json`、`.log`、`-result.json`。`qualification-proof24-coverage.json` 列每个新增 cut 与 helper 义务。总报告是 `native-v6-qualification-summary-final.json`，其中仍保留所有早期失败和它们的具体原因。

另有必要控制：bookkeeping 6/8（仅两个原反例），representation 11/14（仅三个原反例），NaN 两次存储循环原预算 10 秒重放 51/52（仅原 payload-equality 反例），FMA 18/20（仅 false 和错误 unfused 等价反例）。Native/FMA 两入口均拒绝 Float64。

真实 maxpool store 的三个 prefix-frame VC 新旧各 3/3；逐篇 SMT 对比只有上述 `Q_pointers_int_range` 删除，其余全文相同。见 `native-v6-actual-smt-removal-audit.json`。这比单独 false 控制更精确地确认预期 law 在实际调用路径中消失，但仍不是整个模型一致性的证明。

## 4. 独立重放最终合并控制

以下只写全新重放目录，不覆盖历史记录；`-wp-prover`、模型、源码、规格和 proof 策略保持记录中的值。需要本机 Why3 IPC 权限。故意保留的负例意味着 Frama-C exit 0 本身不能作为成功判据，必须检查完整 raw。

```bash
cd /zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence
python3 - <<'PY'
from pathlib import Path
import json, os, subprocess
p = Path('experiments/codex-kernel-wave1/maxpool-address-wave2').resolve()
out = p / '.build/native-v6-readme-replay01'
out.mkdir(parents=True, exist_ok=False)
cmd = json.loads((p / 'native-v6-combined-proof25-command.json').read_text())
for flag, value in [('-wp-report-json', out/'raw.json'),
                    ('-wp-session', out/'session'), ('-wp-out', out/'out')]:
    cmd[cmd.index(flag)+1] = str(value)
(out/'command.json').write_text(json.dumps(cmd, indent=2)+'\n')
env = dict(os.environ, PATH='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+os.environ['PATH'])
with (out/'raw.log').open('w') as log:
    subprocess.run(cmd, env=env, stdout=log, stderr=subprocess.STDOUT,
                   timeout=180, check=True)
rows = json.loads((out/'raw.json').read_text())
expected = {'arbitrary_value_roundtrip_ensures', 'independent_nan_stores_equal_ensures',
            'nan_stores_equal_control_ensures', 'codec_false_ensures',
            'byte32_false_control_ensures'}
assert len(rows) == 184
assert {r['property'] for r in rows if not r['passed']} == expected
print('179/184; all positive obligations passed, five intended controls unproved')
PY
```

重新运行通用首轮 qualifier 会覆盖其原命名结果，因此独立审计应读取其 argv 并改为全新目录，而不是原地重跑脚本。最终 combined 重放只验证该源文件的所有控制；它不替代 FMA、Float64、NaN loop 等单独资格结果。

## 5. 证据边界

本次只删除旧的不一致全局 law，没有证明剩余理论一致。Frama-C C/WP 前端、Bytes/IEEE 模型与 driver、外部 libc 模型（包括无 body 的 memcpy 合同）、求解器等仍属于可信基础。NaN typed store 仍为可选择 NaN 编码的过近似，不能宣称 payload 逐位保留；ISA intrinsic 到普通 C shim 的对应也尚无此处的机器检查证明。

worker 迁移应建立新冻结配置，只更换已审核的新模型入口/lock，保留旧版；然后完整检查所有 helper/global/caller/RTE 和同源码正负控制，不能移用旧不一致模型下的绿色计数。
