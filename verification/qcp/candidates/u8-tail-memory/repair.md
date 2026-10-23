# 修复与反例边界

本能力没有改原NEON/RVV kernel。原始源码及SHA保持；当前已检查的是两种原嵌套tail调用在明确byte-backed C表示中的实现合同。

旧“原C直接scalar uint32存储”的诊断不准确：实际为 `vst1_lane_u32((void*) output, vreinterpret_u32_u8(vacc), 0)`。本能力通过完整8-byte视图、低word打包和已检查的逐byte写入实现该调用，不依赖scalar uint32内存对齐，不改变其输出byte。

历史故意错误shim负控只把第一个reinterpret中的 `r.s1=a.s1` 改成 `r.s1=a.s2`。[负控结果](proof/evidence/historical/negative-result.json)保留原proof针对新目标失败、native exit2及未产生成功object的记录。这是用于排除“双方同错”的错误模型控制，不是原u8 kernel不等反例，也不是本包正向实现的修复。

full u8原kernel的NaN无关；lo/hi的uint32→byte截断及min/max先后属于另一个完整kernel规格，不在本tail能力中假设lo≤hi、修改clamp语义或宣告整核已证。ISA/ABI与终止性另列未完成。
