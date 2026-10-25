# DWCHW 发布副本的身份审查

本案完整 H2 门禁及原目录签发审计通过；签发包的 `proof/status.json`、清单和 H 均保持原字节。旧的冻结 `record_status.py` 把策略生成命令中记录的原绝对输入路径，与搬迁后的当前路径直接比较，因而直接在 `verified` 运行旧审查器会误报 `Actual strategy generation input differs`。这不是 C 或 Coq 义务失败。

仓库级 [审查入口](../tools/audit_dwchw_publication.py) 在不改签发包的前提下复用原审查器，仅将这一处 metadata 比较的期望来源，改为原 full receipt 的 `run_directory` 所对应的原 case 根。当前策略源仍须匹配原 H 的源码 SHA；原 flags、源相对路径、生成目标、普通编译记录、完整 Print、归档及对象来源检查全部保留。随后重新生成当前13个CPP，并核对37个普通函数和全部合同／调用闭包。实际派生审查代码、原／新哈希及唯一替换内容写进审查收据，不能把它当作重新证明。

```bash
python3 verification/qcp/tools/audit_dwchw_publication.py \
  --case verification/qcp/verified/f32-dwconv2d-chw \
  --proof-run /path/to/original/full-ecjzolw2
```

该命令需要原完整运行及配置好的同源环境用于对象／日志来源复查。干净机器上的完整重放须按本案工具链与冻结／重放说明执行；历史日志不是新重放。人工 intrinsic 语义审查仍 pending，未声称 ISA、物理 ABI、编译器精化或终止性。
