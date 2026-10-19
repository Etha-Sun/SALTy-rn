# Unsigned 低位补偿 helper

r2 实际body 6/7，唯一未证 mask_half；原后置依赖它，故没有round函数闭合。r3新有body、无requires helper，对任意size_t x断言整数拆分 x=2*(x/2)+x%2、掩码等于右移再左移、右移等于除2、左移等于乘2。两个ensures给half及低位补偿结论。真实round调用该ghost helper，不改原返回表达式或合同。

关键 shift_mask 使用现有已冻结工具的 Wp.bitwised tactic（64位），range侧条件与children全部必须检查；不添加codec/model公理。该策略可能仍未闭合，不能预报成功。4个断言+2后置+assigns共预期7个helper raw，另原round7个raw。closure必须包含此ghost函数，CFG另记。

sourceguard通过；frontend01只做无-WP前端解析，exit0，无solver。不要用带该策略的none WP调用冒充无solver，因为绑定策略可调solver。

根先运行helper，再round：
```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/run-single.py qd8-round-r3 helper-root01 fct:qd8_clear_low 300
python3 experiments/shim-c-v2/stage3-proof-next/spmm/run-single.py qd8-round-r3 round-root01 fct:round_up_po2 300
```
执行需保留策略树与事件；如现有runner不启策略，使用独立执行配置显式tip（锁新runner与参数），不改旧runner或模型。
