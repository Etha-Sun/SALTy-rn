# Argmax：独立修复 index 尾部越界

这是第三阶段原九项中的 `f32-argmaxpool` 的独立新 target。原版、原锁、公共 spec/wrapper 和正式 manifest 都保留。**尚未整核证明通过。**

## 已复现的问题

冻结 spec 只要求 index 数组有 `pixels*channels` 个元素，没有额外 padding。取 `pixels=1, k=10, channels=1`，所有 input 行与 float 输出均按原 spec 提供额外3个 float，index 数组恰好分配1个 uint32。

原 NEON 第二轮 pooling 的 tail 分支调用 `vld1q_u32(ib)`，实际共享 C shim 的 memcpy 读取16字节，超过4字节 index 对象。ASan 明确报告 heap-buffer-overflow；同一合法域 RVV 成功，原版提供额外 index padding 的对照返回相等。原始证据在 `../../stage3-proof-next/root-review/argmax-tail-runtime01/`。

这是声明 C/shim 合法域内的内存安全反例，不能把原版的该次未定义行为说成已证明的输出不等，也不证明 ISA 实现存在同样缺陷。

## 修复和冻结

只修改 NEON tail 的 index 载入：用4元素局部数组，依次读取确实存在的 `ib[0..c-1]`，其余位置补0，然后执行原 `vld1q_u32`。该处 `c` 为1、2、3；后续只存储这 `c` 个有效 lane，补零不会进入有效输出。RVV、spec、harness 与原版逐字节相同。

- 新 NEON SHA256：`213e054a00a35375a98ca4c8bf735b9b559edfb9da7f26452fda6a4c5abfb7e1`。
- `target-inputs.json` 保存旧/新四文件与其他冻结输入；`frozen.json` 固定新 target、同一 qualified unary 模型及单个 `proof.patch`。
- `source-guard.json` 为真。旧 proof 注释已移植，但保留全部原未证依赖。不要重跑 `prepare.py` 覆盖冻结文件；新修改必须建下一版本。

独立审查记录：`../../stage3-proof-next/root-review/argmax-tail-independent01/`。其 accepted 仅指源码和已记录运行证据审查。

## 已完成验证和未证边界

`runtime-root01/` 的 ASan+UBSan 检查实际通过2100个 case，覆盖1–3个像素、14种 channel、10种 pooling 长度及递增/平值/NaN/无穷/正负零/随机 float bits。index 严格按原 spec 分配；NEON、RVV 与标量 reference 同时检查值及 index。有限运行测试不是全域证明。

`fragment-root01/` 抽取真实修复片段并内联原 `vld1q_u32` body，WP 实际15/21。六项未证是 live/unused 两后置条件、assigns 及 memcpy 的三项前提；存在 Typed 的 uint32→char 不兼容转换警告。片段的局部 requires 只属于这个诊断函数，没有加入 kernel/spec。此记录不构成 kernel 的安全或功能证明。

原 NEON 主循环仍缺完整功能不变量；旧 Argmax root41 的172/181仅是辅助函数成绩，其完整库存为881项逻辑义务。因此本修复没有增加正式已证 kernel 数。

## 在另一台机器重现运行证据

从仓库根目录执行，使用一个从未用过的 run 名：

```sh
python3 experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1/replay-runtime.py server2-runtime01
```

需要支持 ASan/UBSan 的 gcc，不需要 Frama-C。脚本从 Git 中的冻结文件重新构造两版普通 C/shim，重新生成绝对 include，在独立 `.build` 中编译；分别复现原版越界、RVV/额外padding对照及修复版2100个case。当前机器 `runtime-replays/handoff-portable01/result.json` 已实际通过，所有被观察输入 SHA 保持。另在全新不同路径工作树（无原 `.build`）实际执行 `clean-checkout01` 也通过，见 `CLEAN-CHECKOUT-REPLAY.json`；这仍是同一服务器的 gcc 运行验证。

Frama-C 复验另需恢复与资格化工具环境，见 `docs/shared-shim/STAGE3-NINE-HANDOFF.zh-CN.md`。不要直接复用旧 matrix/fragment 文件中的绝对 `.build/plain` include，或把这条 native replay 当成 proof 环境恢复。
