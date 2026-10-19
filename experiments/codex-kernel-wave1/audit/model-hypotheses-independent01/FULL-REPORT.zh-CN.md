# 两项原 rsum 的新 alias 配置完整复验

两项新隔离候选均完整通过。不是复用旧绿色，也不是只有义务生成：本轮实际 raw 为 qs8-rsum 579/579、qu8-rsum 567/567，pending均为空，所有模型分离警告均消失。公开 spec、普通实现、原 proof 均未改，正式 manifest/results 没有更新。

| 候选 | full01主检查 | body集合 | global集合 | 同profile控制 | 总耗时 |
|---|---:|---:|---:|---|---:|
| qs8-rsum-aliased-full-v1 | 579/579 | 33/33 | 原有0，未新增 | 3/4，准确仅false ensures未证 | 185.843s |
| qu8-rsum-aliased-full-v1 | 567/567 | 33/33 | 原有0，未新增 | 3/4，准确仅false ensures未证 | 180.262s |

两个 main 均退出0、raw实际存在、全部passed，目标ID多重集合及函数集合精确等于各自旧正式admission的全集。每项 equivalent 包含328个义务，NEON/RVV真实两体按原命令内联进入 equivalent，其余intrinsic/helper/ghost体按原集合检查。最终源码、旧包/旧证据、工具/模型、candidate和本轮annotated哈希全部保持匹配。独立后检结果及所有证据SHA见 `full-review.json`。

## 冻结、配置和重放

- qs8 frozen SHA：`662d0e6adbd6f690c1c02662bf8eaea53ce27a29d31bf3c40da24022eb0d09ec`
- qu8 frozen SHA：`2b36f0627807b51a4518f5572a6dc95724d5fc942c0fe04766c1da051ae28871`
- runner：本目录 `full.py`，本身SHA被两份frozen.json锁定。

两包分别在同名候选目录保存 `frozen.json`、`plain/`、`annotated/` 和 `archive/`。源与proof从既有probe02逐字节复制，后者由原冻结源和原patch重建并精确命中admission guard。每份新冻结同时锁定全部候选源/原proof、旧manifest中该包所有源与证据SHA、原binary/WP插件/share模型、solver/gcc及runner。没有覆盖旧freeze。

维持原bundle33.0、原默认Typed模型、原solver/driver、原inline与RTE选项、每solver1024MiB、timeout10s和cache none。qs8仍为machdep x86_64，qu8仍为gcc_x86_64。仅标准 `-wp-alias-vars test_neon_onemask_table` 扩大表的alias建模，并按授权将par从2改8；session/输出路径迁移到新audit目录。两项并行，每campaign总预算600秒，control60秒上限，main使用剩余预算；没有增加深度、前提、lemma或axiom。

完整可审命令分别在：

- `qs8-rsum-aliased-full-v1/logs/full01-control.log`、`full01-main.log` 与 `full01-summary.json`
- `qu8-rsum-aliased-full-v1/logs/full01-control.log`、`full01-main.log` 与 `full01-summary.json`

原始JSON分别为同目录 `full01-control.json`、`full01-main.json`；helper/body/global/pending、前后不变和coverage字段均保留，没有过滤局部目标。用于控制的唯一新增源在 `.build/full01/control.c`，include 同一实际 annotated unit，两个真实空函数分别要求true/false；仅诊断命令选择这两函数，main命令没有 -wp-fct/-wp-prop/-wp-skip-fct。

root若独立重放，需允许Why3外部IPC，使用新名字，不能重用full01：

```bash
PYTHONDONTWRITEBYTECODE=1 python3 experiments/codex-kernel-wave1/audit/model-hypotheses-independent01/full.py run qs8-rsum --frozen-sha256 662d0e6adbd6f690c1c02662bf8eaea53ce27a29d31bf3c40da24022eb0d09ec --name independent02
PYTHONDONTWRITEBYTECODE=1 python3 experiments/codex-kernel-wave1/audit/model-hypotheses-independent01/full.py run qu8-rsum --frozen-sha256 2b36f0627807b51a4518f5572a6dc95724d5fc942c0fe04766c1da051ae28871 --name independent02
```

## Statement specifications skipped 的实际含义

两项full01-main.log:42-43仍完整保留这两条原警告，没有删除、屏蔽或将其简单归为证明不安全。

具体源与生成位置：原 spec.h 中test_neon/test_rvv的 requires/assigns/terminates 合同，在内联后仍附着于两个普通 block。先前实际 CIL（与本轮相同源及相同inliner配置）可见于 `qs8-rsum-probe02/alias-cil01.c:978-987`、`:1378-1388`；qu8第一块在 `qu8-rsum-probe02/alias-cil01.c:1011-1018`。合同后面是真实算术/循环/store函数体，而不是用post替换的空实现。

本地Frama-C33.0源 `experiments/shim-c-v2/toolchain-build/.build/source/frama-c-33.0-Arsenic/src/kernel_services/ast_transformations/inline.ml:105-116` 显示把原合同复制成 `AStmtSpec` 并加到内联body上。WP `.../.build/install/lib/frama-c-wp/core/cfgAnnot.ml:401-407` 对非assembly AStmtSpec仅打印warning并返回原列表 `l`，没有增加 `code_admitted` 或 `code_verified`；`cfgCalculus.ml:204-219` 只有这些显式code_assertion才会进入use/prove，:240及:284-303仍遍历真实CFG并处理scope、Set、init等。

`cfgAnnot.get_stmt_assigns` 确实另有实现(:352-376)，但 `cfgCalculus.ml:337-339` 唯一调用位于Asm分支；这里是普通内联block。因此这两处残留statement合同不被作为未经证明的callee假设使用，也不单独证明该合同，而真实body继续检查。不能因出现“skipped”就推论它偷偷使用了未证后置。内联合同在此没有提供正确性捷径；其调用需要的真实内存访问、算术、循环关系仍在equivalent的raw义务中。原helper/ghost的33函数集合及全部goalID门禁均保留。

旧分发bundle没有可读OCaml源，故上述说明明确来自本地同版本33.0源与实际CIL/日志的交叉阅读，不额外声称有已证明的source-to-binary编译对应。该源码审读的SHA也记录于full-review.json。

## 保留的TCB与范围

full01-main.log:4-5仍提示 alignment 与 valid_function RTE 不受支持，assert.h 也继续打印既有生成缺省exits/terminates条款的提醒。完整raw通过不表示所有严格ISO C UB均已排除；C/ACSL解析、WP/Qed、Var/Typed与stdlib模型、Why3/driver、SMT solver、ABI和ISA到普通C shim的对应仍是TCB/范围边界。

此结果解决两项新隔离配置中的额外常量表分离条件，不反向改写旧日志，也不自动更新正式收录。它没有解决exp的errno域门禁，没有触碰当前主线的两个整数新核。
