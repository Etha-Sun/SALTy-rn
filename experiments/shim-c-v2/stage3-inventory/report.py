"""Render the diagnostic snapshot without presenting it as admission evidence."""
from pathlib import Path
import json
HERE=Path(__file__).resolve().parent
results=json.loads((HERE/'RESULTS.json').read_text())
lines=['# 九个复杂 kernel：完整义务盘点与快速筛查','',
'本轮固定此前实际补过 proof 的候选，仅增加只读观察插件和诊断脚本。没有修改原 C、公共 spec/wrapper、proof、模型或旧 checker；没有新增整核通过。原正式 manifest 保持不变。','',
'“清单完整”表示本次固定候选/诊断配置的 body 与 global lemma 均生成完毕、退出 0、完整结束标记与唯一 goal 数一致、调用闭包定义覆盖齐全。它不是 `complete=true`。本表排除单列的 CFG 自动 exits/terminates；全局 lemma 包含在逻辑义务中。','',
'| Kernel | 清单完整 | 逻辑义务总数 | 已通过 | 超时 | unknown/其他未证 | 尚无完成求解记录 | CFG 自动项（另列） |',
'|---|---|---:|---:|---:|---:|---:|---:|']
for r in results['kernels']:
 c=r['counts'];ok=r['inventory_complete'];total=str(r['total_obligations']) if ok else '未知（生成未完成）'
 vals=[r['kernel'],'是' if ok else '否',total,str(c.get('passed',0)),str(c.get('timeout',0)),str(sum(v for k,v in c.items() if k not in {'passed','timeout','no_completed_check'})),str(c.get('no_completed_check',0)),str(r['cfg_only_separate_count'])]
 lines.append('| '+' | '.join(vals)+' |')
lines += ['', '九核合计 '+str(sum(r['total_obligations'] for r in results['kernels']))+' 项：'+str(sum(r['counts'].get('passed',0) for r in results['kernels']))+' 项已通过，'+str(sum(r['counts'].get('timeout',0) for r in results['kernels']))+' 项超时，'+str(sum(r['counts'].get('unknown',0) for r in results['kernels']))+' 项 unknown，'+str(sum(r['counts'].get('no_completed_check',0) for r in results['kernels']))+' 项尚无完成求解记录。', '', '## 按证明范围分开看', '', '| Kernel | 主 wrapper 已通过/总数 | 实际 helper 已通过/总数 | 全局 lemma 已通过/总数 |', '|---|---:|---:|---:|']
for r in results['kernels']:
 d=json.loads((HERE/r['kernel']/'stream01/REPORT.json').read_text());groups=d['by_function']
 main=groups.get('equivalent',{});glob=groups.get('<global>',{});helpers=[v for k,v in groups.items() if k not in {'equivalent','<global>'}]
 lines.append('| '+r['kernel']+' | '+str(main.get('passed',0))+'/'+str(sum(main.values()))+' | '+str(sum(x.get('passed',0) for x in helpers))+'/'+str(sum(sum(x.values()) for x in helpers))+' | '+str(glob.get('passed',0))+'/'+str(sum(glob.values()))+' |')
lines += ['',
'短跑元数据不匹配的事件不转移结果，另存 unmapped_quick_goals；这不影响已经独立完成的盘点。完整逐项清单与证据见各 `<kernel>/stream01/OBLIGATIONS.tsv` 和 `REPORT.json`；每条含 goal、函数、属性、源码位置和结果。命令、日志、原始流事件、已有官方 raw 以及失败尝试均保留。`POST-RUN-AUDIT.json` 核对冻结文件、proof、生成输入、全部外部模型锁项、observer 和执行脚本 SHA。','',
'## 如何解释结果','',
'- 已通过：本次短跑确有 Qed/solver valid 结果；调用方仍可能依赖本轮尚未证明的 callee 合同或 lemma，不能独立算整核成立。',
'- 超时 / unknown：尝试了但没有证明；不表示不可证明，也不表示 kernel 有 bug。',
'- 尚无完成求解记录：包括尚未开始，以及进程总预算用尽时正在生成/化简/求解的目标；不能说这些目标均已跑过 solver。',
'- 整核通过仍为 0/9；没有任何一项获得严格验收的完整 raw 全绿报告。','',
'## 预算、方法和复用边界','',
'每核先运行真假语义控制，然后不求解生成 body/lemma 清单，随后分别短跑全部实际 helper、主 wrapper 与全局 lemma。Z3 单目标 timeout=1 秒、wp-par=2，helper/main 外层预算分别 90/120 秒；WP 生成与 Qed 化简仍可能耗时。命令中的 wp-steps=1000 被此 Z3 配置明确忽略，不是有效步数上限。各组串行执行，未并发重跑 33 核。','',
'流式 observer 不调用公式求解或改变结果，源码/二进制单独冻结，并以有无插件和真假控制核对。none 模式官方不会写 raw；完整盘点因此用 observer 的 final 集合及 normal_exit 标记。快速筛查保留每个已完成 verdict，进程超时不再丢掉所有中间结果。这是独立诊断证据，不替换正式 checker。','',
'后续同一候选可依此清单定点补 proof、定位函数和属性；改动 proof 后必须重新生成并核对，不能把旧 goal 编号或旧绿色结果直接移植。历史结果仍保留；最终仍需完整严格复验。','',
'完整清单解决“分母不明”，不会自动解决地址桥、浮点位表示、循环归纳或求解复杂度。下一轮应按未证义务的具体公式补局部 lemma/frame/循环关系；只有真实、可复现反例才能据此修复新 target。','']
(HERE/'REPORT.zh-CN.md').write_text('\n'.join(lines))
