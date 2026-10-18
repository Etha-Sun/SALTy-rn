旧符号模型的NaN/正负零回归

regression.cpp编译实际 src/verification_cvc5/neon/ops/core.hpp，而不是复制实现。
检查NaN出现在左操作数、右操作数、两侧的三个例子，以及min(-0,+0)=-0、
max(-0,+0)=+0。对预期结果的否定应为UNSAT；不只检查C++能否编译。
修改前真实header的负对照为SAT，修改后为UNSAT。
这些是模型回归样例，不是完整ISA语义定理，也不证明NaN payload/异常标志。

运行：
  python3 tests/verification/neon_nan/check.py \
    --cvc5-prefix /path/to/cvc5 --cxx /path/to/compatible/g++
可选--reference-header指向未修复worktree的同一个真实header，执行负对照。
evidence/results.json保留本次两者的命令、退出码与header哈希。
旧header来自本分支父提交978bc31，修复前调用numeric min/max，掩盖了NaN差异。

两个symbolicbackend均修复f32 FMIN/FMAX的NaN选择和相反符号零选择。
Bitwuzla侧复用其已有nan-propagating helper，再显式处理零；本环境尚未编译
Bitwuzla的C++封装。CVC5侧实际完整header已经编译运行。
这是旧SMT验证系统的修复，与verified/qs8-rsum的WP证明路径独立。

evidence/另存了系统GCC与Nix CVC5库不兼容的链接失败记录，以及只修NaN后
暴露的signed-zero反例；这些历史失败没有被计为已通过。
