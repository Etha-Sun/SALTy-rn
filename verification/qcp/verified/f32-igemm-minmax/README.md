# F32 IGEMM 完整修复版

在[公开契约](spec.c)与[22项 intrinsic spec](proof/intrinsic-ledger.json)下，完整当前 [NEON](impl/testNEON.c)、[RVV](impl/testRVV.c)、实际调用两侧的等价性入口及普通 helper 已通过 Coq 检查。结果入口为 [status](proof/status.json)、[完整证据](proof/full-status.json)及[完整接口](proof/coq/FloatIgAdmission/FinalCheck.v)。唯一修复日志是 [repair.md](repair.md)。

本次统一运行从源码重新编译687个本地模块，含完整接口和32份最终假设报告；4个实际C单元共593项义务（RVV317、NEON229、caller40、普通helper7），另有7项真实copy策略义务。604份最终假设报告仅使用14项已登记的QCP/Coq/Flocq继承假设，无新增项目公理。所有4个C单元重新生成的目标与被检查目标完全一致，两侧原始/加注释C的预处理token一致。

公开范围为mr=1、NR=8、任意合法正N、K=kc/4与E=ks/8；cn_stride=32。N不超过UINT64_MAX/4，并保留契约中的对齐、地址上界和分离内存条件。a_offset是4的倍数字节数。指针表项等于zero时直接读取zero本身，其余表项才加a_offset；[输入池与映射](proof/coq/FloatIndirect/InputMapping.v)支持重复与重叠的只读窗口，每个窗口只需K个float，不要求额外输入padding。输出、权重、指针表、参数与输入池按公开分离逻辑关系持有权限。

每个packed panel包含8个bias及按entry/K顺序排列的8列权重，最后不满8列仍分配完整panel。累加保持原始顺序与每一步FMA单次RNE舍入，clamp顺序为min(hi)后max(lo)。[模型](proof/coq/FloatIndirect/MatrixModel.v)覆盖全部binary32，包括NaN、Inf、带符号零与subnormal，也允许lo>hi。最终观察是数值相等或双方NaN；不观察NaN payload、异常标志或零的符号差异。

RVV固定VLEN=128、SEW=32、LMUL=4，物理VLMAX=16；kernel每次使用VL=min(nc,8)。合同只约束活动前缀，未活动lane保持任意且未被观察。NEON采用AArch64、RNE、FZ=0、AH=0，RVV使用RNE、vstart=0。具体定义、官方版本、合同及哈希见[语义台账](proof/intrinsic-ledger.json)，最终人工语义复核仍为pending。

本结论是C-shim模块化部分正确性与等价性。QCP前端/VC生成器及列明的intrinsic解释属于信任边界；没有声称ISA/编译器/物理ABI对应、任意VLEN、完整终止性、超出QCP整数地址模型的ISO C provenance，或原版到修复版的独立refinement定理。

原版NaN反例及精确补丁见修复日志。当前完整源码的ASan/UBSan回归通过24375例、316875个输出观察，并检查输入保持及输出边界；独立标量oracle拒绝两侧同时使用错误零FMA。False证明与源码篡改控制均被拒绝。这些回归和负控制不代替形式证明。

新重放使用32个配置worker，普通Coq每进程16GiB/7200秒，生成器64GiB/21600秒，通过共享池协调总预算。已有证据保持原运行身份；换run名重放，不覆盖历史：

```sh
python3 proof/admission_generate.py --run replay-c --jobs 32 --budget-runner /path/to/budget_run.py
python3 proof/compile.py --run replay-coq --jobs 32 --budget-runner /path/to/budget_run.py
python3 proof/audit.py --compile-run replay-coq --generation-run replay-c
python3 proof/native.py --run replay-native --jobs 32
python3 proof/negative.py --run replay-negative --jobs 32
```

需要已配置的QCP/Coq/Flocq环境；[环境清单](proof/evidence/full-run/environment.json)记录所用外部文件和工具身份，不表示已从空环境重建。审核从impl、spec、shim、台账及Coq定义开始。[续接入口](CONTINUE_PROMPT.zh-CN.md)记录本案完成边界。
