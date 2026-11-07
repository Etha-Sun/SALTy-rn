冒烟测试，不做证明。请依次完成：
1. 运行 `/srv/home/yuechunsun/tools/lean/.local/qcp/env-exec.sh coqc --version`。
2. 在 work/ 下写一个 hello.c，用 zig 交叉编译成 riscv64-linux-musl 静态程序，再用 qemu-riscv64-static 运行。
3. 把两条命令的输出写进 work/REPORT.md，结论写"冒烟通过"或"失败"。
