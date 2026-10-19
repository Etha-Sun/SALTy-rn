r8针对r4 vand前缀保持的真实公式：body输出含uint8截断，合同没有该冗余截断。新增无requires的真实ghost body qd8_and8_cast，以完整范围断言证明两个byte的AND仍在0..255，并证明截断冗余。实际vand入口调用helper；纯整数关系作为独立命名loop invariant，建立/保持均留在raw义务。普通C、合同/spec及model不变。

none正常导出27目标（含生成CFG）；未跑solver。先完整helper，再helper+真实vand。bits_i8 memcpy三项仍未闭合，不将caller对合同的使用当作callee验证。r7已实测helper38/38及helper+真实vsll64/64，二者input/frozen稳定。
