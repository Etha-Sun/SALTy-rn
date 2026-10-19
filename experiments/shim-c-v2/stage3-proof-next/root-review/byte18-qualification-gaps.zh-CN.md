Byte18 资格盘点（只读审查；当前未 qualified）

已确认的边界与证据：

- 实际入口仍是独立 byte-fp-front-v1 的编译 binary，配 v18 的 share、driver、Why3 config 与适配器；不能仅按目录版本号推断编译源码版本。
- 本次逐项核对 experimental-inputs02.json 的 14668 个输入 SHA，未发现变化。该清单覆盖安装产物、求解器和模型文件，但没有直接列出 `.build/source/src/plugins/wp/{MemBytes,CodeSemantics,TacBitwised,wpo}.ml`；编译源码出处应由独立构建证据补链。
- 主 agent 已报告 memory 31/34、IEEE 23/26、真实 FMA 62/66，pending 恰为预设 false。独立审查不把这些分母相加为一次全量成绩。
- sliced adapter 的删完整前提方向与严格结果输出已作 peer review；这不能替代浮点内存语义、fresh seed 量化和整个工具链资格验证。

仍需完成或明确链接的具体证据：

1. 完成正在运行的 codec-controls01 全量 raw。按具体函数/post 核对 32/64 位 finite、±0、数值 store/load、同一 storage、多字节复制和 partial-byte frame；明确每个故意错误 finite/zero/NaN/false post 以及 abstract_negative_fixed_payload、abstract_negative_shared_seed 的预期。特别不能将所有 pending 都笼统归为“负控制”，RTE/assigns/中间断言仍需通过。当前源来自 byte-fp-front-v6/controls.c，命令必须保留该真实路径及 SHA。
2. 在 Byte18 实际配置下跑 unary.c 全 body。至少覆盖 !pointer、!float、!double、negative zero、integer-not、negate/complement，以及两个故意错误 post。旧 Typed 的通过不能替代当前 Bytes 的复验。当前可见 unary.c，尚未看到 Byte18 unary 完成记录。
3. 将新增 Why3 lemma 的已检查证据逐项映射到 v18 最终 theory 的原文/SHA。尤其 store-wide trigger 的“已证”需要指向真实源命题、实际 prover 结果与依赖；只修改 trigger 不改变语义，但不能把未经核验的 lemma 当新公理。保留旧 CODEC_FLOAT 三条公理删除证据和 byte memcpy 语义修正出处。
4. 补全实际 binary 的源码与构建对应关系：MemBytes fresh seed/store 代码、驱动的 BV↔IEEE 定义、unary 修复是否继承、bitwised 高位与 Qed 子目标结果修复是否继承。若未继承某个修复，应明确其边界；不能仅依据另一个 binary 的资格记录声称具备。不得为了审查改动当前锁定 binary。
5. 建立独立标准 frontend、float_model_lock、控制 manifest 与资格汇总文件；冻结实际 binary/share/config/driver/adapter/solver/libc/runner/源控制文件的 SHA，并记录控制前后输入核验。保留历史 experimental 锁，不能就地改其 qualification:false 掩盖演进。新 ABI observer 须重编译并验证有/无 observer 的 raw 一致性。
6. 仅复制一个已通过 f32-vadd，保持原 C/spec/proof 字节不变，以新模型独立 freeze、唯一 run 名执行严格回归。正式入口须采用 frozen model_runner 指定路径；不能再次复制 runner 到错误路径或使用不加载 share/config 的低层入口。没有通过前，不能称该新环境可用于正式 kernel 验收。
7. 针对九项真实依赖另做实际 body 闭包复验：canonical_nan 的真实 memcpy、bits_i8 的真实 memcpy 及所需 signed/unsigned、struct copy/frame。独立控制函数通过不等于这些原 helper 已通过。此项说明模型能否解除当前缺口，不要求先声称整 kernel 通过；仍需保留原 helper 的全部 RTE/assigns/post。

尚未建立的能力不能扩张：Bytes 编解码修复不会自动增加 MemAddr 的 uintptr 仿射地址语义。SPMM 的该保持目标仍是另一层支持缺口；不能以新模型名掩盖它。所有已声明通过范围仍受固定 VLEN128、RNE、原合法域及数值相等/双方 NaN 的输出观察限制。

本报告不启动 solver、不修改任何模型/锁，也不提前声明 qualified。

后续补记（v19已另建，旧v18结论保留）：v1准确构建证据路径为stage3-byte-fp-front-v1/source-audit.json（列旧unary锁SHA、10056条核对、全源码before/after与仅MemBytes.ml变化）、MemBytes-native-codec.patch、patch.log、build-result.json（dune build/install exit0）、experimental-inputs01.json（安装产物SHA）。应以source-audit中的after清单核v1源码，再核patch只产生声明变更，结合build命令/安装目录和binary SHA串联。v1实际TacBitwised仍是1 lsl k，不能借用另一binary的高位修复成绩；主agent已在独立v19合并两修复并复验，故后续资格应以v19的新源码/构建/控制证据为准。本报告不修改v18锁、不将v19成绩冒充v18。
