此目录是独立的新模型版本；model、model-fma、model-front 和既有 kernel C/spec 均未修改。
在 model-front 的修复版 WP 前端、IEEE 操作和 FMA 语义上增加：
1. cint.mlw 的有定义整数 cast/mod 辅助结论。原有与新增全部 54 项 Why3 VC 已检查，记录见 ../integer/model-support/root-extended-evidence.json 和 root-extended01.jsonl；没有新增公理。
2. libc/math.h 对 __builtin_nanf 使用已存在的标准 nanf 契约。它仍属于标准库/ABI 模型 TCB，不是用户证明。

先按 model-front/README.zh-CN.txt 构建隔离前端及前置 overlay，再运行 python3 experiments/shim-c-v2/model-plus/build_share.py。
入口 frama-c.py；所有运行输入由 float_model_lock.json 固定。controls02.json/log 是本版本实际正/负回归，controls01 保留为先前失败实验。
该版本只用于 Typed 系列。Bytes+float 的浮点编码公理存在独立问题，本 wrapper 明确拒绝 Bytes；不得使用原 Byte 模型的绿色结果证明浮点 kernel。
检查通过只表示声明 C/shim 模型下的结论，不证明 ISA→shim 对应，也不消除 WP 前端、内存模型、标准库和 solver 的 TCB。
