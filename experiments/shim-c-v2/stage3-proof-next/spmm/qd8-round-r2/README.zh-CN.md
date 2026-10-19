# 四后置的真实body分解

round-r1完整body 0/4，none打印确认q==2已实例化、掩码已化常量。当前r2在实际body加入三个须检查的断言，无新前提、无新增assigns、无外部ghost合同。原body token未变。

parse01无solver退出0，mask_value打印为true；sum_exact仍须证明嵌套cast精确，mask_half仍须证明bitand与除2关系。原四后置不能脱离这三条新债务计入成功。完整body预期7条raw。

根执行：
```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/run-single.py qd8-round-r2 round-body-root01 fct:round_up_po2 300
```
