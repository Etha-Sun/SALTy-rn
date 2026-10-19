# 局部步进覆盖与控制

新增 igemm_step4 没有 requires；其条件后置由 helper 自身实际 body 检查。原 k 范围、k%4==0 不变量与进入本次 do-loop 的 k>0 推出 k>=4，故减4不下溢。原 wrapper 的 k<=SIZE_MAX/32 使 kc=k*4 不溢出。已有 row/weight 游标不变量分别解释加1与加8；新 cuts 仍须单独验证，不能把未证切分点作为完成。原始 FMA、访存、frame、indirection 和循环其余义务全部保留，局部选定通过不等于这些前提已经闭合。

helpers-root01 实际 raw 2/2 通过；selected 正在 root 执行。

同上下文正反控制由 root 执行：
```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/run-igemm-control.py controls-root01
```
独立 prepare 与日志目录，复用原 runner 的固定 model/driver/observer、wp-rte、par1、30秒/solver、2048MB、180秒墙时；包含完整 annotated unit 后追加两个有真实 body 的控制函数。两个 ensures 中 positive 必须通过，negative（return 1 却声明结果0）必须未通过。CFG/终止观测另记。控制源、命令、原始结果及 SHA 留存；不修改 frozen source/proof。
