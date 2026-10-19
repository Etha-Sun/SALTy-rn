这是独立构建的 Frama-C 33.0 WP；旧 bundle 和旧证明没有改动。

wp-ieee-frontend.patch 的四个修改：
- Cfloat.code_lit 保留负零字面量；
- 不再用有理数计算折叠 IEEE 浮点算术/舍入；
- C 与 ACSL 的不同精度浮点转换直接使用 IEEE converter；
- 移除因此不再使用的旧折叠函数。

已经实际构建成功。运行版本、插件/运行依赖和模型文件的 SHA 见
../model-front/float_model_lock.json；正反回归在 ../model-front/semantic03.json。
10 个正确 postcondition Valid，3 个错误 postcondition 未证明。
这不是整个 WP 前端的形式化正确性证明。编译器、Frama-C/Why3 和 SMT 仍在 TCB 中。
本版本明确拒绝 Bytes* 模型，字节复制和浮点位表示编码另行审计。

本地编译目录 .build/ 不入 Git。恢复环境需要：
1. 从 source-provenance.json 的官方 URL 下载归档并核验 SHA。
2. 解包到 .build/source/frama-c-33.0-Arsenic，从源码根应用本目录的 wp-ieee-frontend.patch
   （应从源码根执行，并使用补丁的正确绝对路径）。
3. 在 .build/opam 新建 shim-wp-fix/OCaml 4.14.2；installed-switch.export
   是这次成功构建后的完整包清单，不是一个已经在新机器验证过的重建承诺。
   GMP 开发包只在 .build/gmp 解包，未安装/修改系统软件；SHA 见 gmp-source.json。
4. 启用 wp、rte、region、server，其他插件通过 dev/disable-plugins.sh 禁用。
5. 在源码根用隔离 opam exec 执行：
     dune build -j 8 --release --promote-install-files=false @install
     dune install --release --prefix=<本目录>/.build/install
   编译时 CPATH/LIBRARY_PATH 指向本地 GMP include/lib，日志见 build-result.json。
6. 运行需 OCAMLPATH=.build/install/lib；../model-front/frama-c.py 已设置。
   原有 Why3 driver 会出现重复搜索路径，因此新模型使用独立 why3.conf。

固定 manifest 包含本机绝对路径和二进制 SHA。其他机器重建后应新建模型版本、
重跑语义控制和全部 kernel，不能把本机历史结果当成新构建的检查记录。
