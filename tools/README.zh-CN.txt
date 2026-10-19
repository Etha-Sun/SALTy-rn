工具依赖与本地安装

本分支收录验证源文件、原程序、规格、全部证明注释、验收脚本和检查记录。
不把外部编译器/求解器/工具链二进制提交进Git。

WP使用 Frama-C 33.0 Arsenic，bundle中的Why3 1.8.2；
外部solver使用Z3 4.12.5、CVC5 1.2.1、Alt-Ergo 2.6.2。
具体可执行文件哈希在environment.json，源码/模型范围在每个case的provenance中。
这些版本是本次运行环境，不是对更新版本的兼容性承诺。

Linux x86_64可用Python3解包固定Frama-C发行版：
  python3 tools/setup_frama.py
脚本核对官方发行包SHA256，只本地解包，不执行系统安装。
默认输出 tools/.local/frama-c/bundle/bin/frama-c，或用--directory选择位置。

Z3/CVC5/Alt-Ergo需要另行安装对应版本并放入PATH；
--prover-bin可以把已有求解器目录加到PATH前面。
检查工具发现的求解器：
  /path/to/frama-c -wp-list-provers
验证入口：
  python3 verified/qs8-rsum/check.py --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin --name replay

实现不变的独立编译检查（先用build.py --name replay生成副本）：
  python3 tools/check_llvm_identity.py \
    verified/qs8-rsum/.build/replay/plain/unit.c \
    verified/qs8-rsum/.build/replay/annotated/unit.c \
    --output-directory verified/qs8-rsum/.build/llvm-identity
默认使用clang-14和llvm-diff-14；在相同编译器/参数、assert启用条件下，
同时要求llvm-diff成功与完整LLVM IR逐字一致。这不是通用C程序等价性工具，
也不证明ghost语义无干扰。脚本与冻结摘要本身属于构建/证据检查信任链。

这里的源码不再依赖原工作区的research/目录。旧工作区仅作为本次实际使用的
外部工具安装位置，运行命令中的绝对路径由CLI参数替换即可。
本次使用已配置的工具环境，尚未在全新系统完成全部solver的从零安装复现。
Why3需要本地进程IPC；本次沙箱禁止该IPC时会停在goals scheduled，
因此实际检查在允许本地IPC的环境运行。这个环境问题不等于proof失败。

模型回归测试是另外的C++测试，需要CVC5开发头/库和ABI兼容的C++编译器。
本次CVC5是Nix构建，使用同一Nix环境的GCC14，系统GCC11不能链接该库。
它们不参与qs8-rsum的WP逻辑证明，详见tests/verification/neon_nan/。

共享shim与小接口生成器
  python3 tools/shim_c_generate.py verified/qu8-rsum
默认检查生成结果；--write仅用于冻结前初次生成。支持reduction-u8、clamp-s8、
binary-f32三类；interface.json为family/padding/observation三字段。
  python3 tools/shim_c_check.py qu8-rsum --name replay --framac /path/to/frama-c \
    --prover-bin /path/to/provers/bin
同样支持s8-vclamp和f32-vadd；--prepare仅生成副本并检查，不运行WP。
checker自动内联实际kernel、检查本case使用的base/module/helper和wrapper，
拒绝覆盖同名结果。完整证据、40项接入盘点与手写LOC在docs/shared-shim/。
