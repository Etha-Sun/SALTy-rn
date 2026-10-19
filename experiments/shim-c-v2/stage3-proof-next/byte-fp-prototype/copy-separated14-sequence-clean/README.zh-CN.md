# 独立 memcpy frame 依赖检查

`../copy-separated14/frame.mlw` 给出条件式 separated frame 的真实 body，无新 requires，覆盖 size≤0、同块不重叠和异块三个分支。完整 none 库存为主 body 15 项、`RWBytes.bread_32bits_bwrite_seq_sep` 递归 body 2 项和 `MemBytes.to_seq` 真实 body 3 项。

原 driver 已排除官方同类 memcpy frame 结论，主 body 和递归 body 的实际导出均无这些结论。直接从官方文件导出 `to_seq` 时，本地模块命名导致 15 条较早的 `bcopy_sep` 结论未被 driver 排除。因此这里独立保存三份原 SMT，并且仅删除命名的完整 assumption assert。其他内容及最后 negated goal 逐字节保留；UNSAT 的加强任务可支持原任务，不能以 SAT 反推原任务失败。

`inventory.json` 记录原来源和 goal SHA，`task*.removed.json` 保留删除的完整断言，`seal.json` 锁定工具、模型输入、扫描器和全部任务。`run.py prove NEW_RUN` 对三个加强任务顺序运行固定 CVC5，单项 30 秒求解预算、2048 MiB 地址空间、40 秒墙钟。不调用模型 adapter，不改旧模型。只有 exit0、首行 UNSAT 且无 error 才接受，并核对输入未变。主 body、递归和三个 sequence 义务全部通过前，不能宣布依赖闭包已完成。

worker 主 body 的第一次实际尝试保留在 `../copy-separated14/worker-main01`：Why3 Unix socket 被 sandbox 拒绝，exit1，0 实际 SMT 调用，无 solver verdict。这是环境失败，不是证明失败或 0/0 通过。该旧 runner 的 `solver_invoked` 仅标记请求的 prove 模式，实际执行以调用目录和日志为准。主 agent 将在正常环境另起 run。

此目录 prepare 已完成；准备时没有执行 solver，根执行的新结果应另看具体 run/result.json。以上仅共享支持的独立 body 验证，不构成 kernel 或新模型资格验收。
