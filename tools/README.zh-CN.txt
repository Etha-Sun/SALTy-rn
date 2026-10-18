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

这里的源码不再依赖原工作区的research/目录。旧工作区仅作为本次实际使用的
外部工具安装位置，运行命令中的绝对路径由CLI参数替换即可。
本次使用已配置的工具环境，尚未在全新系统完成全部solver的从零安装复现。
Why3需要本地进程IPC；本次沙箱禁止该IPC时会停在goals scheduled，
因此实际检查在允许本地IPC的环境运行。这个环境问题不等于proof失败。

模型回归测试是另外的C++测试，需要CVC5开发头/库和ABI兼容的C++编译器。
本次CVC5是Nix构建，使用同一Nix环境的GCC14，系统GCC11不能链接该库。
它们不参与qs8-rsum的WP逻辑证明，详见tests/verification/neon_nan/。
