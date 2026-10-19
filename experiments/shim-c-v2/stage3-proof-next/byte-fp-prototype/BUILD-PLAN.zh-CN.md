# 独立构建计划（仅文档，尚未执行）

建议新目录 `experiments/shim-c-v2/stage3-byte-fp-front-v1/`，目录必须原先不存在。不得以 `stage3-unary-front` 或 `environment-recovery-local` 为输出。review源码目录 byte-fp-prototype 保持首版，后续改动另存版本。

## 1. 复制与补丁

- 先核 SOURCE-PROVENANCE.json 的全部文件SHA和 `stage3-unary-front/float_model_lock.json`；旧源来自 `stage3-unary-front/.build/source/`，含此前已通过控制的 logical-not 修复。
- 把该源复制到新目录 `.build/source/`，排除 `_build`、`.git`，不要复用旧 `_build` 或旧安装。检查符号链接不让构建写回旧源；可展开源文件链接。
- 仅在新源应用 `MemBytes-native-codec.patch`。逐文件对照旧源，预期只有 `src/plugins/wp/MemBytes.ml` 改变。保存新旧完整source SHA清单、精确patch和应用输出。
- 确认新源已无 CODEC_FLOAT、decode_encode/encode_decode/encode_bounds 的旧 Admit 注册。不要仅关闭调用而保留可意外触发的旧分支。

## 2. 编译环境与新安装

复用已恢复、但只读的工具依赖；不运行 opam install/update，也不修改旧 switch。绝对恢复根为：

`/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/environment-recovery-local`

子进程环境沿用已成功 stage3-unary-front/build.sh 的约定（新任务变量名应使用 SHIM_BYTE_FP_ROOT，不复用 HOME/CODEX_HOME）：

- OPAMROOT = `<recovery>/.build/opam`
- OPAMSWITCH = `shim-local`
- OPAMJOBS = `2`（共享服务器拥塞时进一步降为1）
- CPATH = `<recovery>/.build/gmp/usr/include/x86_64-linux-gnu:<recovery>/.build/gmp/usr/include`
- LIBRARY_PATH = `<recovery>/.build/gmp/usr/lib/x86_64-linux-gnu`
- PKG_CONFIG_PATH = `<recovery>/.build/gmp/usr/lib/x86_64-linux-gnu/pkgconfig`

只在**新source**中，以 `<recovery>/.build/downloads/opam exec -- dune build -j 2 --release --promote-install-files=false @install` 编译，再 `dune install --release --prefix=<新目录绝对路径>/.build/install`。保持完整输出和退出码。此计划没有执行上述命令，编译/API兼容尚不保证。

## 3. 独立 share / Why3 config / 执行入口

- 复制 `handoff-model-plus/wp-share/` 到新目录 `wp-share/`，再放入本原型 `why3/frama_c_wp/bytefloat.mlw`。
- 新share内的 `membytes_le.mlw`、`membytes_be.mlw` 使用 provenance 指定的 `model-integer-byte-v2/why3/frama_c_wp/` 内容；Cint使用已锁 model-plus/cint.mlw。核对原share的命名/路径，不能仅因文件存在就假设load到了新定义。
- 两个 codec driver 只在新目录配置；其 import 当前指向固定 handoff-model-front 原生IEEE driver。若改成新拷贝路径，必须保留本初版并锁新路径/新SHA。FMA继续使用已审计真实FMA driver，不改成乘加。
- 新 `why3.conf` 引用原固定 Z3 4.12.5 / CVC5 1.2.1 二进制，driver 指向新 codec driver，记录binary SHA。不可覆盖 handoff-model-front/why3.conf。
- 资格控制阶段仅从新绝对 binary 调用：OCAMLPATH=`<new>/.build/install/lib`；PATH 前置固定 handoff-solvers/.build/bin。显式传 `-wp-share <new>/wp-share -wp-why3-config <new>/why3.conf -wp-no-why3-detect` 后再传 `-wp-prover z3,cvc5`。gcc预处理保持 model-plus/libc，FMA driver显式包含；不要漏掉已审计libc合同。
- 当前旧frontends仍必须拒绝旧Bytes+float，不能修改其guard。新入口若创建，要明确标记实验/未资格认证，只允许这份新source/binary/share/driver组合进行控制；尚不能用于kernel。

## 4. 先检查公式，再进行 solver 控制

先 `-wp-prover none -wp-print` 和原生SMT导出核对controls中的seed：每个真实浮点store一个新自由变量；同次存储后多次读取不重新选择；最终全称关闭；不出现旧codec公理或未解释codec函数。把两个solver导出的定义实际与32/64公式对照，含 bv2int / bv2nat 方言。

随后运行 controls.c 的完整body组和计划中的其他正反控制，全部输出、失败和资源预算保留。负控制需明确分开真实false与抽象不确定性检查。检验IEEE/FMA旧正反回归、初始化/地址/byte alias/memcpy控制，确认符号与内存映射未误接。

通过足够控制后，收集新 binary、source、share、drivers、config、libc、solver路径和SHA建立**新的**环境锁，保存旧锁引用。任何路径/内容调整后重新冻结、复验；控制完成不是整核通过。新kernel候选另外冻结，不覆盖旧实现、proof和历史结果。

## WP library 注册补充

`Lang.extern_f ~library:"bytefloat"` 还需要 `bytefloat.driver` 注册 `library bytefloat: cfloat` 和 `why3.import += "frama_c_wp.bytefloat.Bytefloat"`。该文件已新增。新控制命令必须把它与原FMA driver一同传入 `-wp-driver`，例如逗号列表 `<new>/bytefloat.driver,<existing>/model-fma/fma.driver`；不能只在 why3.conf 选择codec solver driver。前者让WP知道语义库依赖/导入，后者负责原生SMT解释，两层都不可省略。新锁必须同时包含它们。

`driver-export01/` 单独使用 Why3 `prove -D ... -o ...` 导出32/64目标；不指定实际 prover、不执行solver。它只检查Why3解析/类型/driver打印，不证明codec或C控制，更不能确认尚未编译的WP extern符号注册已贯通。
