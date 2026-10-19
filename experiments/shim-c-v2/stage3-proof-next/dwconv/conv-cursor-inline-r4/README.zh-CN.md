本候选沿用 conv-cursor-inline-r3 的真实 body inline 配置，只对 signed-add 循环增加一个有真实空 body 的条件 successor ghost helper。helper 自身 2/2；定点 4/4，包含两个原未证游标切分点与新增循环 index 建立/保持。没有新增函数 requires 或改变原 C/spec/model。完整内联的 memcpy、RTE 与全部循环义务尚未完整验收，不能称整核完成。

后续根扩大 cursor-root01 回归正常16/16，helper2/2独立保留。完整内联义务清单正在生成，不沿用旧候选分母。

完整none盘点已完成：body02正常2322（equivalent1803），globals02为6，正常总分母2328；另55个CFG-only不计VC分母。两阶段exit0/normal marker/input unchanged；首轮300秒失败保留。新增successor2义务与signed-add16/sub16/reinterpret5真实body均在完整清单。全量尝试命令及par2/3600秒独立执行配置见full-execution-lock.json，尚未整核验收。
