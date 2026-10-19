【2026-10-19 当前任务优先级更新】
当前只处理第三阶段原九项及其真实依赖；用户要求继续直至解决优先三项并尽量完成九项。不得扩展 qs8/qu8 等九项之外任务。允许本地 commit，未经用户重新许可禁止 push。
最新阶段报告：experiments/shim-c-v2/stage3-proof-next/REPORT.zh-CN.md；检查点 bdf42bf 之后还有工作，先核对 branch/status 保留所有候选与日志。新增整核通过仍 0/9，局部组通过不能称整核通过。
当前 qualified 模型为 handoff-model-plus；argmax 使用独立 stage3-unary-front。stage3-byte-fp-front-v1 仅未资格认证的独立实验：控制尚未全过，CVC5 原型编码不兼容，严禁用于 kernel 或声称恢复成功。完整失败与未证依赖见新报告及逐项 STATUS。以下历史交接保留，其旧下一步优先级已由本段覆盖。

# feat/shim-c 接手说明

第三阶段9个复杂kernel的实际proof续作、独立工具修复与逐项未证状态见 [STAGE3.zh-CN.md](STAGE3.zh-CN.md)。本阶段新增整核通过0；原target未改，未经用户允许不push。

当前机器从 `f2f8d2c` 接手后的独立环境恢复与571/571小复验，见 [LOCAL-RECOVERY.zh-CN.md](LOCAL-RECOVERY.zh-CN.md)。下文原服务器路径与历史锁保留，不代表已在当前机器原路径恢复。

接手后的26项分工和最新独立尝试见 [PROOF-WORK-PLAN.zh-CN.md](PROOF-WORK-PLAN.zh-CN.md)：qu8-f32-vcvt新完整报告剩7项；qs8新候选预算耗尽无完整body报告。新增整核通过0，暂不push。

此文针对用户 fork Etha-Sun/SALTy-rn 的 feat/shim-c，当前路线是普通 C shim + Frama-C WP。证明结果基线是 be5a536。后续交接提交只补文档，不产生新证明结果。以这个分支最新 HEAD 为接手点。

根目录 SERVER_HANDOFF.zh-CN.md、AGENTS.md 下半部的 Sail/Coq 内容属于其他分支的历史研究。不要据此切到 feat/assembly-reduction-lean 或 proof/sum，不要将那里的 VLEN=256、Hload 或131模块结果混进本路线。本路线固定 VLEN=128。最初查看的 Arcadia-Y/SALTy-rn:verification 是参考来源；当前工作和推送目的地是用户自己的 Etha-Sun/SALTy-rn:feat/shim-c。

## 1. 目标与用户要求

目标是将 NEON/RVV kernel 的 intrinsic 用共享普通 C shim 表达，用简单模板生成公共 spec.h 和调用 wrapper，先冻结 C/shim/spec/wrapper，再让 agent 补证明，实际验证两个原 kernel 的输出等价。希望共用支持能逐步覆盖更多 kernel，GEMM 是重要后续目标；没有认为“补完 intrinsic 就自动能证所有 kernel”。

- 最终公开功能目标保持输出相等。合法输入、内存与终止条件仍须明确，不能偷偷换成弱规格。
- 可以使用两个 kernel 各自满足的中间结论来分解证明，但每个结论必须由原真实函数体检查；不能假设实现正确。
- 文件清晰分开：neon.c、rvv.c、spec.h、harness.c；每 kernel 只有一个 proof.patch。proof 里的 ghost/helper 放在这一个 patch。共享 shim 自身可共用模块。额外每-kernel helper 文件只有确有必要时才提出并解释。
- 保留旧版本、失败结果、反例和修复前原程序。证明有错误不能靠覆盖记录抹掉。
- 确实发现 kernel 不等价时，区分工具/模型问题与 kernel 问题。用户已允许保留原 target、建立修复 target 新版本，再重新冻结并验证；这不授权修改当前已冻结版本来迎合 proof。
- 中文沟通，解释术语，直接报告已证/未证/下一步。用户喜欢简洁实现，不喜欢为凑点罗列问题或制造复杂框架。
- 可以使用多 agent 分工。用户要求实际补完整 proof，不是仅生成 wrapper 或跑一次基线。

## 2. 必须先读的当前资料

1. experiments/shim-c-v2/REPORT.zh-CN.md：本轮33项逐项结果与原因。
2. verified/README.zh-CN.txt、verified/manifest.json：正式收录及输入/结果 SHA。
3. experiments/shim-c-v2/MODEL-AND-TCB.zh-CN.txt：修复、禁止模型和范围。
4. experiments/shim-c-v2/integer/STATUS.zh-CN.txt、STATUS.json：整数10项。
5. experiments/shim-c-v2/complex-v3-next/FINAL-STATUS.zh-CN.md、results.json：复杂13项。
6. experiments/shim-c-v2/float-proof-candidates/FINAL-PROOF-NOTES.zh-CN.txt。
7. experiments/shim-c-v2/final-independent-audit.json、source-freeze-audit.json、old-version-preservation.json。
8. tools/README.zh-CN.txt、工具链 README（第5节）。这些文件里原始模型的安装说明不是当前浮点修复环境的替代品。

早期 docs/shared-shim/RESULTS.zh-CN.txt、EXTENSION-RESULTS.zh-CN.txt 和 experiments/shared-extension/results.json 是演进记录，其中有被隔离的旧浮点绿色计数。不能当当前已验收状态。当前总表是 experiments/shim-c-v2/RESULTS.json，正式收录看 verified/manifest.json。

## 3. 已经做到哪里

当前40项盘点：正式收录11项，尚未证明26项，另外3项缺对应 target。不要把缺 target 当成 proof 失败。

原4个整数收录项（历史已检查，未在最后一轮重新证明）：

| Kernel | 记录的完整义务 |
|---|---:|
| qs8-rsum | 579/579 |
| qu8-rsum | 567/567 |
| s8-vclamp | 688/688 |
| u8-vclamp | 688/688 |

恢复的7个浮点项全部重新完整检查、打包后 canonical01 独立重验：

| Kernel | 目录 | 完整义务 |
|---|---|---:|
| f32-vadd | verified/f32-vadd-v2 | 571/571 |
| f32-vsub | verified/f32-vsub-v2 | 556/556 |
| f32-vmul | verified/f32-vmul-v2 | 585/585 |
| f32-vdiv | verified/f32-vdiv-v2 | 601/601 |
| f32-vmulc | verified/f32-vmulc-v2 | 583/583 |
| f32-vmin | verified/f32-vmin-v2 | 536/536 |
| f32-vmax | verified/f32-vmax-v2 | 538/538 |

合计3970/3970。571这类数字是拆分后的证明义务，不是测试数量，也不是571条公开功能规格。以 vadd 为例：NEON233、RVV89、shim127、wrapper72、proof helper50；最终等价后置条件只有一项。

其余26项已经做过实际证明续补和完整尝试，新增整核通过0。较接近的：
- qs8-f32-vcvt 794/805、qu8-f32-vcvt 835/843：全部 intrinsic body 已闭合，剩11/8项在 kernel/wrapper。
- f32-vcmul 377/418：18个helper192/192、global3/3通过，剩41项在主程序。
- qs8-vcvt 698/719、qs8-vlrelu 846/866：struct-by-value 的 memcpy/重解释、ASR/RNU、尾部 store 与 kernel 归纳。
- f32-vsqrt 383/402、f32-vlrelu 491/520、f32-vrndne 662/679：float/word 位表示桥及循环关系。
- qs8-rdsum 420/702：公共 sum/lambda 遇到 WP/Why3 的 unbound variable in of_term / Lambda-functions not yet implemented，另有地址/多行归纳。
- 其他项多次达到1200秒整核预算，没有完整 body JSON；仅有global5/5或6/6绝不能算整核成功。全部逐项看 REPORT 和两份 agent 状态。

本轮没有新的 kernel 功能反例，也没有修改实现修复 kernel。先前已修复的 target 与原版均保留，不能说它们是本轮新发现/新修复。

## 4. 目录与文件导航

| 路径 | 职责 |
|---|---|
| verified/<kernel>[-v2]/neon.c、rvv.c | 干净、冻结的两侧实现 |
| 同目录 spec.h | 公开前置条件、允许写区域、终止与输出等价合同 |
| 同目录 harness.c | 调用两程序并逐项比较的 wrapper，不是 proof |
| 同目录 interface.json | 简单模板配置：family / padding / observation；不是任意 C 前置条件推断 |
| 同目录 proof.patch | 唯一每-kernel证明材料；只应用到临时 annotated 副本 |
| 同目录 frozen.json | 固定实现、规格、shim、driver、checker、模型锁等输入的路径及 SHA |
| 同目录 logs/ | 实际命令、raw VC、summary、同上下文正反控制 |
| 同目录 llvm/ | 干净/带注释 C 的 host LLVM IR 身份检查 |
| verified/shared/ | 共用 base、rsum、clamp、float_ops 等普通 C 模块与证明材料；已冻结，不原地改 |
| experiments/shared-extension/ | 首轮扩展的源、共享支持、wrapper/spec和历史证据；许多新 frozen.json 仍引用这里的 C |
| experiments/shim-c-v2/ | 独立模型、各批冻结 case、候选 proof、正反控制、诊断及结果 |
| tools/shim_c_generate.py | 小接口生成器，原有三模板；新 family 可以增模板，避免改成通用编译器 |
| tools/shim_c_check.py、verified/qs8-rsum/build.py | 最初 source/token/合同守卫；新checker仍复用这些检查 |
| tools/shim_c_campaign_v2/v3/v4/v5/v6/v7.py 及对应模块 | 历次独立checker版本，不能拿任意版本替代 case 已固定的版本 |
| tools/shim_c_call_closure.py | 实际调用闭包/未知外部调用检查 |
| experiments/shim-c-v2/collect_results.py | 汇总已保存完整报告；运行它不等于重新执行证明 |

初始三模板是 reduction-u8、clamp-s8、binary-f32。新族通常还需简单模板/调用对应、合法域、布局与公共 helper 支持，并补具体循环证明；不是只加 shim 就必然完成。

## 5. 环境：先区分同服务器和新机器

### 5.1 同服务器/同文件系统，优先复用

现有 worktree：
/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence

先 git status / remote / branch；有已有 worktree 时不要在上面 clone、reset 或覆盖本地工作。主目录 /zp_vegeta/scratch_sb/ycsun/verus 是另一条研究分支；build/pr-sum 也有别的用户资料，不要操作它们。

从当前 worktree 根执行：

~~~bash
SHIM_REPO=/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence
cd "$SHIM_REPO"
git status --short --branch
git remote -v
git log -3 --oneline
python3 --version
gcc --version
clang-14 --version
llvm-diff-14 --version
free -h
df -h . /tmp
"$SHIM_REPO/experiments/shim-c-v2/model-front/frama-c.py" -version
/home/ycsun/verus-x86-linux/z3 --version
/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin/cvc5 --version
~~~

本次最后实测版本：Frama-C33.0 Arsenic（自行补丁编译）、OCaml4.14.2、Why3 1.8.2、Z3 4.12.5、CVC5 1.2.1；部分老 proof 用 Alt-Ergo2.6.2。Python工具是标准库脚本，Python3.11已使用，不要求安装整套LLM主流水线、Lean、Coq、Sail或XNNPACK子模块来验证当前打包C。

真正的修复版 binary 在：
experiments/shim-c-v2/toolchain-build/.build/install/bin/frama-c

请通过 model-front/frama-c.py wrapper 调用，它设置 OCAMLPATH、FMA/libc driver 并验证输入 SHA。model-plus 和 integer-byte-v2 各有自己的入口。不要拿系统 frama-c 或原发行包直接替代。

为什么 --prover-bin 还不够：why3.conf/driver 有绝对 solver 和 import 路径，PATH 不会覆盖它们。两个 CVC5/Alt-Ergo 可执行文件是指向 /nix/store 的符号链接，复制链接不等于复制工具；跨账户还要核对文件权限。认证用新账户自己的凭据，不复制密钥或 token。

### 5.2 新机器/纯 clone：尚无已验证的一键 bootstrap

~~~bash
git clone --branch feat/shim-c https://github.com/Etha-Sun/SALTy-rn.git SALTy-rn
cd SALTy-rn
git status --short --branch
git log -3 --oneline
~~~

Git 包含源码、patch、模型定义、环境/构建配方与原始证明记录；不包含 .build、wp-share、opam switch、编译器/solver二进制、Nix closure 和 .frama-c session/cache。所有历史 lock 带本机路径及 binary hash；换路径或重新编译会变化。不能把原 lock 的 hash 改成新 hash 后就宣布旧证据在新环境通过。

两条恢复方式：
1. 若能私下搬迁同服务器资产，保留原路径和可执行文件依赖，验证原 SHA。OCaml/opam/native binary 可能嵌入前缀，换路径不保证可用。
2. 无这些资产则独立重建新环境版本，保留所有旧 lock 和旧结果。先恢复依赖和模型，跑正反语义控制，再生成新路径的 model lock 和独立 case manifest（C/spec/shim 内容 SHA 必须与原版相同），然后实际重跑。环境缺失应报告为环境缺失，不是假称 proof 失败。

重建资料/顺序：

| 阶段 | 资料与约束 |
|---|---|
| 基础 | Linux x86_64、Python3、GCC/CPP、patch、make、opam、OCaml4.14.2、Dune、GMP开发依赖；clang/LLVM14用于额外身份检查 |
| 原发行包 | tools/setup_frama.py 核验官方bundle SHA并本地解包；仅是原始依赖，不能用于恢复7项IEEE成功证据 |
| 编译修复前端 | experiments/shim-c-v2/toolchain-build/README.zh-CN.txt、source-provenance.json、wp-ieee-frontend.patch、installed-switch.export、build-result.json |
| 源码校验 | Frama-C33源码归档 SHA：9c1cbffd28bb33c17a668107e39c96e4ae7378a3d8249f69b47afc7ee964e9b8；补丁及4个改动源码 SHA 在 build-result.json |
| 独立构建 | 原源码应用补丁，隔离 opam switch；dune build -j 8 --release --promote-install-files=false @install；dune install --release --prefix=<新环境安装路径>；启用wp/rte/region/server |
| 模型层次 | model（native Cfloat/driver）→ model-fma → model-front（patched frontend）→ model-plus（Cint/builtin）；build_overlay.py / build_share.py 是原布局恢复配方，不是可任意位置执行的通用安装器 |
| Cint/Byte | model-plus/cint.mlw；model-integer-byte[-v2]/README、rebuild.py、禁float codec补丁及why3源码；整数模型只准用于审计过的纯整数case |
| Solver | 精确Z3/CVC5版本、Why3配置及native FP driver；先验证可执行路径/依赖，再跑语义控制 |
| 收尾 | 重建后重新冻结新版本。不可覆盖活跃 proof 的模型/driver/share/lock，不能让两个任务共享同一个可变模型目录 |

原安装 export 是成功环境清单，不是从空机器已验证的一键锁。source-provenance.json 的早期 status 曾写 awaiting-build；实际成功看 build-result.json 与语义报告。model-plus README 曾引用不存在的 model-front README，应看 toolchain-build 的实际 README。

### 5.3 当前服务器的外部依赖备份清单

见同目录 ENVIRONMENT-HANDOFF.json。至少：
- 本 worktree 的 experiments/shim-c-v2/toolchain-build/.build（源码、opam、install及本地GMP）。
- 各 model*/wp-share 及整数Byte模型各自 .build/install。
- 外部原bundle /zp_vegeta/scratch_sb/ycsun/verus/research/frama-c-qs8-rsum/toolchain/bundle。
- /home/ycsun/verus-x86-linux/z3。
- /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin 及指向的 /nix/store 依赖，或在目标机重新安装。
- .frama-c 下已生成的可检查策略session可私下备份；证明源patch本身包含策略提示，缺session不准用作跳过目标的理由。
不要将这些二进制/缓存/私有配置或认证信息整体提交到公开Git。

## 6. 如何先做一个小复验

先只读核对 manifest 中源文件 SHA 与旧版本保留，不要上来并发重跑33项。恢复环境后，选一个已通过案例作 smoke replay。以下使用vadd的已审计模块化v7，预计几分钟，不会覆盖 canonical01：

~~~bash
cd "$SHIM_REPO"
SHIM_CASE=verified/f32-vadd-v2
SHIM_CASE_SHA=$(sha256sum "$SHIM_CASE/frozen.json" | cut -d ' ' -f1)
SHIM_RUN=handoff-smoke-01
python3 tools/shim_c_campaign_v7.py "$SHIM_CASE" \
  --frozen-sha256 "$SHIM_CASE_SHA" \
  --name "$SHIM_RUN" \
  --framac "$SHIM_REPO/experiments/shim-c-v2/model-front/frama-c.py" \
  --prover-bin /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin
~~~

这条命令仅在原路径/模型输入已恢复时适用。先与 verified/manifest.json 或 root-freeze.json 中预先记录的 frozen SHA 交叉检查，不能仅对已被改动的 manifest 现算hash来绕过冻结。案例用哪个 runner 以 frozen.json 的 files/model_runner.py 为准；min/max等不是都用v7，不要随手全改runner。

--framac 必须绝对路径：checker会切到 annotated build cwd，传相对路径会 FileNotFoundError。--name 必须全新，不能重用 canonical01/proof01 或已有 .build/<name>。为什么/actual_command/timeout与modelcontrol都在logs中；原字段 command 可能是请求的默认命令，实际执行参数看 actual_command。

Why3需要本机IPC；沙箱禁止IPC导致“goals scheduled后不动”是环境问题，可在允许IPC且授权的环境运行，不要改规格消除它。每case/wp-par通常2，先小范围查内存和耗时，再选有限并发；不要按机器线程数满开。

严格验收：
- complete=true；所有raw目标通过，pending为空。
- source_guard.passed、unchanged、model_inputs_unchanged为true。
- model_control.accepted=true；true控制通过，故意false不能获证明。false不通过只是回归门，不是整个模型一致性证明。
- missing_body_ensures和missing_global_lemmas均为空；实际两个kernel、调用闭包、所有ghost及global lemma覆盖完整。
- 所有证明/工具/模型输入核对，含proof.patch SHA，验证后复核。
- 实现token及预处理token不变、spec字节不变，普通C保持原程序；可另做host LLVM IR身份检查。
- 只完成局部helper/指定VC的诊断不算整核；超时且缺body raw不能填0/0或引用独立global6/6冒充成功。

LLVM工具的历史小坑：min/max两份IR字节相同，但llvm-diff-14当时返回1；原始结果保留，独立 byte-identity-audit.json 依据成功编译后的字节身份。不能改原退出码或说llvm-diff全通过。其他五项当前返回0。

## 7. 下一步实际工作（建议优先级，不是已完成成果）

环境恢复与小复验后继续26项：
1. 优先 qs8-f32-vcvt / qu8-f32-vcvt：实际 intrinsic 已全证，补 kernel lane/high-half、tail rebase、输入/scale frame和wrapper量词实例化。qu8局部 final03 的3/3不能算整核；必须合并到新完整冻结候选再跑。
2. f32-vcmul：helper全过，补uintptr尾部与主循环41项。可先抽最小地址例诊断。
3. 共享框架缺口：精确C指针→uintptr→加offset→指针的地址/有效性桥；float↔word/memcpy位表示（NaN payload等不能伪造双向bijection）；struct-by-value packing。应先做小正反控制和模型审计，再新版本整核验收。
4. 之后推进GEMM/卷积/池化：不仅是模型问题，还要packed布局、累加次序、嵌套循环与输出归纳。FMA必须保持真实单次RNE，不能当普通乘加。
5. qs8-rdsum的冻结公共sum/lambda是前端后端错误；可独立修工具或做等义且可检验的翻译，不可删公共前提/改输入域。
6. 更新逐项状态，区分：已完整通过、仍有明确VC、预算耗尽、环境/工具错误、实际kernel反例。没有反例不要说kernel有bug。

不要一开始继续扩大checkout或重写通用生成器；先选一个剩余case把完整证明做成。若确需新checker支持，应先独立版本、正反回归、完整依赖覆盖审计，然后冻结，不能边跑边改当前checker。

## 8. 哪些能改，哪些不能改

| 对象 | 允许的工作 | 禁止 |
|---|---|---|
| 新候选proof.patch | ACSL合同/不变量/assert、有body且实际检查的ghost helper、checked WP策略 | assume/admit/新axiom、空口外部ghost合同、ordinary memory写入或改普通C |
| 公共spec.h/harness/原kernel/shim | 新kernel首次接入时确定，冻结前审查；发现真bug时另建保留原版的新target | 在当前冻结版本原地改、放宽合法域、加finite/非NaN限制或换较弱输出关系以过证明 |
| 中间kernel结论 | v7已允许的真实定义前ensures，必须证明body；公开spec.h不变 | 新requires/assigns/terminates、wrapper合同，或给仅prototype附合同绕过body |
| 工具/模型 | 新独立版本修实际缺陷；复核来源、语义、正反控制和所有调用后再冻结 | 改live/旧model lock/share/checker；强制+ref/+cast/+real或用未审计模型绿灯验收 |
| 冻结manifest | 新环境/新版本生成新manifest，保持原C/spec/hash并说明差异 | 更新旧SHA来掩盖改动或让旧证明看起来检查了新实现 |
| 历史结果 | 另存新run、保留失败与原始exit | 覆盖canonical01、把old历史当新运行、删pending/选择性统计 |
| 生成器 | 简单family模板、新语法/共享模块支持，改动小且目的明确 | 建复杂profile系统、对单case过度抽象、夹带无关重构 |
| Git | 清晰checkpoint、只提交相关源/证据/文档；按授权push | force-push、reset用户工作、切换到别的研究路线、提交key/cache/二进制 |

integer10 的旧公共spec只给 equivalent 前提，kernel原型没有 requires/assigns；不能照抄v7给kernel塞更强前提。若要模块化，必须先导出并审查从原wrapper域可推出的内部条件，再固定独立版本，所有调用前提也实际检查；不得缩小原合法域。

已知不健全的原Bytes+float继续硬禁用。新整数Byte前端 CODEC_FLOAT.compile 必须拒绝真正浮点codec，直接binary绕过wrapper也应失败。普通pointer pack正例全通过，并不代表struct-by-value pack已证明。

## 9. 精确范围与TCB

- 输入长度为满足spec的任意符号长度，没有固定总长度展开上界；不是任意硬件VLEN或任意VL调度。
- 固定VLEN128；SEW/LMUL决定capacity，例如e32m8=32、e32m1=4，不是统一VLMAX=8。
- 固定RNE；浮点观察是数值相等或双方NaN，不比较NaN payload、正负零bit、FP flags/errno。内部 same_float 保留非NaN符号；最终 same_value 不区分±0，不能任意当作除法等后续上下文的同余。
- shim/ISA语义对应、ABI/对齐、C/ACSL解析、WP/Qed/策略、内存和stdlib模型、Why3/driver、SMT solver及freeze/coverage脚本仍是TCB，没有Lean/Coq重检SMT证书。
- WP仍有alignment/valid_function RTE不支持项；不能宣称消除了所有严格ISO C UB。
- 此处model-front/plus使用native IEEE，并没有切到Real抽象。实际Factory.default是Machine整数+Float浮点；Typed不显式加+float也不是改用Real。
- 部分模型辅助定理已检查并不等于整个memory model或整个工具链形式化验证。

## 10. 协作与代码倾向

用rg找文件；改前先读依赖和实际原始目标。最小、局部、可审查的改动，保留同目录风格，不重构不相关代码、不增加单次使用抽象或复杂配置。只跑与改动相关且有意义的检查；环境通过后才扩大计算。

先冻结再补proof；变更模型时独立新版本，先小控制再完整case。多agent各自候选目录、各自日志；由主agent独立冻结与检查，不让agent同时改同一个模型/manifest。启动前明确所有权和资源预算；任务结束汇总而非只列启动命令。

进度/最终答复先给结果，解释为什么及证据；对未证项明确具体VC或环境原因。不要反复问用户已授权的动作；需要真实不可推断的信息才提问。不要把“tool timeout”说成“程序不等价”。长期目标是少量共享支持+简单接口模板+agent proof，但当前证据尚未证明它能覆盖所有kernel。
