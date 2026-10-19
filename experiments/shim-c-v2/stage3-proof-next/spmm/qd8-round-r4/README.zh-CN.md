# mask 前先建立已检查的算术范围

r3短tip日志显示高位mask子目标失败后又递归应用同一通用bitwised策略，产生更多range子目标。r4保持真实C、round原合同与模型不变：先检查shift_half、shift_restore，再检查restored_range/even，最后mask。新增2个断言全部计债务，helper预期9 raw。

策略匹配限制为原始完整常量mask 18446744073709551614，避免对子目标13835058055282163712继续递归bitwised。这只是有证据的候选，不预报通过；新范围断言未证时不能将mask假绿当进展。独立runner显式tip并输出strategy/allgoals。sourceguard通过，frontend02无WP解析通过。

```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/qd8-round-r4/run-tip.py qd8-round-r4 helper-tip-root01 fct:qd8_clear_low 180
```
首先完整helper9项（2ensures+6asserts+assigns）；若成功再实际round7项，全部原核义务保留。
