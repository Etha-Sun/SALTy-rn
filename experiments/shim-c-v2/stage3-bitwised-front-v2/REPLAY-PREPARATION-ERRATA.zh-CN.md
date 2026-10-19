# 回归准备错误（保留原证据）

原 prepare-standard-replay.py 将所有 files 复制到 frozen-inputs，错误地改写了 model_runner.py 的固定路径。正式 v7 要求该条目实际指向 tools/shim_c_campaign_v7.py，即使文件内容 SHA 相同也不能任意换路径。原 replay/f32-vadd 冻结记录保留，不应覆写修补；root另建 f32-vadd-r2。

原 command.txt 错误地使用低层 tools/shim_c_campaign_modular_v7.py，未加载正式 model share/config，造成 Unknown prover alt-ergo。该记录只作为失败来源，不得重用命令。正式入口必须依据 frozen.files["model_runner.py"].path 确定。

smoke01 是入口/环境错误；smoke02 是正式冻结校验拒绝，均非proof失败或kernel反例。不能将这两个结果覆盖为成功。

QD8 qd8-round-r4-bitwised-v2 准备过程仅替换模型锁及独立proof路径，保留所有旧 files 的其他路径，未复制model_runner。磁盘独立核对见该候选runner-path-audit.json。本文不宣称新模型已qualified，资格以root实际正式回归结果为准。
