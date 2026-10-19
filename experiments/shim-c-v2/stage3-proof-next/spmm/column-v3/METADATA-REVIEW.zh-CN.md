# 4/5 的边界

map-root01 五个 raw 目标中唯一未证是 spmm_map_local_disjoint；新 map_initial_value、inner_map_value 建立/保持以及原 column_map_value 均过。后四项依赖前一未证分离断言，因此这是债务迁移，不能报告完整 metadata 组闭合。

parse01/run.log 第124行将当前 nnz 局部块写入 malloc；第689行附近只给当前 malloc 下 map 单元 valid_rd；第707行目标为 map 单元地址不等于局部 nnz 地址。原公共 maps 有效性在 Malloc_0，第236行；当前是经过前一个 NEON kernel 的 Malloc_10。需恢复跨时刻地址/分配关系，不能补假设。

真实 annotated/utils.c 第3行 prefetch body 仅 `(void)p;`，NEON 第52/54行调用，WP 最后确有缺 assigns 警告。值得独立诊断真实 body inline，保留其他全部参数与模型，观察分离公式是否改善；当前没有做该新诊断，也没有修改旧 runner。不能仅凭警告归因整个失败。
