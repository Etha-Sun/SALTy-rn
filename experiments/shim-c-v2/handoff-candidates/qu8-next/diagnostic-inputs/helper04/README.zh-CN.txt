本目录 proof.patch 是 helper04 当时实际检查的独立诊断版本，不是最终候选。
以 input-manifest.json 指定的 frozen.json files 路径复制各文件为 plain 目录，执行 patch --batch --fuzz=0 -p1 -i <本目录proof.patch> 即可重建实际诊断输入；逐文件 SHA 必须与 input-manifest.json 和 ../../diagnostic-summary.json 对应条目相同。
诊断版本移除了 WP strategy 注释；selected01 另外为所选属性命名。执行命令见 ../../logs/helper04-command.json，须在重建路径中相应替换输入/session/report路径。配置无 RTE、无策略，只选部分目标，不能当整核验收。
