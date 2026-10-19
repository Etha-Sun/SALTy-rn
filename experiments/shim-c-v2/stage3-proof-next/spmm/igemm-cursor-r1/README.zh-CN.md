# IGEMM RVV 减4与游标局部候选

本目录只涉及原九项中的 f32-igemm-minmax。继承 stage3-gemm/f32-igemm-minmax-r4 的原 C/spec/shim/模型/checker，原冻结文件全部一致。新增一个无requires、实际空body的ghost整数helper，条件ensures必须实际证明；它不会更改kernel输入合法域。

RVV内层三个既有不变量（k范围/余数、a0游标、w游标）只加独立名字以精确选择；每步FMA之后增加8个数学和指针切分点，原浮点累计、indirection、frame与最终输出义务全部保留。REVIEW.diff显示相对旧annotated rvv的最小差异，构建只用proof.patch。

source-guard.json已通过；尚未由本worker启动solver，由root执行。预计选定组15项（旧不变量建立/保持6、新assert8、helper ensures1），helper完整函数预计2项，最终以实际raw为准。局部结果不能当作整核通过；新增assert的依赖和自身义务必须全部保留。
