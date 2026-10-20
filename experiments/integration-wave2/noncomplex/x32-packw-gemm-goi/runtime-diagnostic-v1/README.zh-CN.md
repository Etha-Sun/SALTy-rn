# 冻结普通C差分筛查

共7560个确定性合法spec输入，比较wrapper公开观察的全部输出（含stride/padding），ASan+UBSan未报错，未找到不等价。有限测试不能代替无界proof。完整harness、编译/执行命令、seed、输入枚举范围与frozen C哈希、原始stdout/stderr全部保留。无失败输入；所有输入可由seed与harness逐字重建。
