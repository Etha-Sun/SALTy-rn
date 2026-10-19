r5只补真实vsll左移RTE所需范围关系。无新requires：ghost helper以n<8为条件结论，switch覆盖0..7，各分支实际证明所有0..255字节的移位范围；真实callee保留原C，仅ghost调用及两个循环不变量。

none导出正常完成46项，不是46项通过。逐项见SHIFT-INVENTORY.json。commands.txt先检查helper完整body，再检查helper与真实vsll完整body。执行器固定输入SHA并核对执行前后，求解由主agent执行。

r4真实callee42/47：尚缺vand前缀保持、vsll signed_overflow，以及bits_i8 post和memcpy valid_src/separation。r5针对第二项；其余不被假定已证。r4完整caller300秒和named180秒均无最终raw，不算通过。
