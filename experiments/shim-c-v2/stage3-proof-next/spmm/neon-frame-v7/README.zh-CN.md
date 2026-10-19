# 仅frame标签的精确选择

相对v6只为七个loop assigns首term增加用户标签，原写集合表达式/不变量/C/spec/model都不变。source guard通过；frames-selector01 none正常退出，恰好74条观测，全在NEON循环，不包含RVV/函数整体frame。

不能用 raw property id 当-wp-prop：selector-check01证实选到0。cfgInfos.selected_assigns匹配term_name，故这里使用语义不变的用户term标签。

```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/neon-frame-v7/run.py neon-frame-v7 frames-root01 spn_frame_1,spn_frame_2,spn_frame_3,spn_frame_4,spn_frame_5,spn_frame_6,spn_frame_7 900
```
仅labels不是证明进展，全部74仍需实际求解。
