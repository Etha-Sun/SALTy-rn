# 当前机器独立重建环境

本目录实际从源码重建了 Frama-C 33.0 Arsenic（同一 IEEE frontend 补丁）、OCaml 4.14.2、Why3 1.8.2。尚不能凭构建成功认定旧证明在新机器恢复；独立模型封装、正反语义控制和新 case 复验由 `../handoff-local/` 记录。

原 `toolchain-build/`、模型和历史锁没有修改。本目录不是已验证的一键 bootstrap；下列过程已在当前 Ubuntu 22.04 x86_64 机器实际执行，安装前缀包含绝对路径。

- `.build/downloads/` 保存官方 Frama-C 源码、opam 2.4.1 引导 binary 和 Ubuntu GMP 开发包。Frama-C、GMP 与原记录 SHA 一致；opam 是本次新下载，SHA 单独记录。
- Frama-C 原归档解到 `.build/source/` 后应用原 `wp-ieee-frontend.patch`；四个修改源码 SHA 全部与旧 `build-result.json` 相同。
- 本地 `opam init --root=<本目录>/.build/opam --bare --no-setup --disable-sandboxing -y`；然后 `opam switch create shim-local ocaml-base-compiler.4.14.2 --jobs=8 -y`。
- GMP deb 仅用 `dpkg-deb -x` 解到 `.build/gmp`，其开发库链接到当前系统已有的同版本 runtime。没有安装系统包。
- `restore-dependencies.sh` 导入原 `--full` export，固定对应版本，最多 8 jobs。第一次因 opam 的系统包存在性检查退出；确认本地 GMP header/runtime 可读后，第二次加 `--assume-depexts` 实际成功。没有运行 apt。
- 独立源码只启用 wp/rte/region/server，随后 `build-framac.sh` 实际 build/install 成功。脚本通过本地 opam 调用 dune。

入口为 `.build/install/bin/frama-c`，运行须设置 `OCAMLPATH=<本目录>/.build/install/lib`。注意 share 实际为 `.build/install/share/frama-c/share`，WP 在其 `wp/` 下。Why3 的 drivers/stdlib 位于 `.build/opam/shim-local/share/why3`。

`recovery-status.json` 是本次构建证据：版本、归档/二进制/源码 SHA、包版本对照和日志位置。`installed-switch-local.export` 保留新环境实际完整清单。`.build` 中二进制、源构建和完整日志不提交 Git；正反控制与完整 case 的可公开日志由独立新模型目录保存。

普通沙箱内 opam 初始索引下载 DNS 失败，保留失败日志后使用获授权的外部网络环境重试成功。依赖下载也使用该授权；Frama-C build/install 在普通沙箱内完成。
