# 复杂13项最终状态（本轮）

18次正式完整尝试已结束：13个Typed v4、1个vcmul策略版、2个纯整数Bytes v1、2个Bytes v2。没有新增整核通过。所有原C/public spec SHA核对通过；所有同配置模型负控制accepted。

13个Typed主WP均达到1200秒预算；独立全局lemma并入的5/5、6/6不是body成功，主body VC数没有最终JSON时记未知。两个Bytes版本各2项也均达到1200秒，无完整body报告。

vcmul策略版是有完整body清单的结果：helper18个192/192，global3/3，主程序182/223，合计377/418；41个pending全部属于equivalent。

| Kernel | 整核状态 | 具体缺口 |
|---|---|---|
| x32-packw-gemm-goi | 未证；1200秒超时，无完整body JSON | 原 Typed 下 tuple 初始化及 char-strided store 不闭合；Bytes v1/v2虽能证明独立tuple，整核仍有 vmov/store/segment-store/strided-store 的word内容与frame目标，且4处uintptr地址换算没有可用桥。group/channel/K前缀与padding候选已补，尚未闭合。 |
| x32-transposec | 未证；1200秒超时，无完整body JSON | Typed将 uint32*→char*→uint32* 地址隐藏，Bytes版保留地址后仍有store内容/stride有效性/frame证明；round_down_po2另剩bitand/mod2算术目标；12处uintptr地址换算、tile/prefix/frame候选尚未闭合。 |
| f32-vcmul | 未证；策略版377/418 | 最新策略版18个实际helper 192/192、全局lemma3/3，全部覆盖；只剩equivalent主程序182/223，41项为最终关系、6处uintptr后load/store有效性、循环及frame。不能算整核通过。 |
| f32-conv-hwc2chw | 未证；1200秒超时，无完整body JSON | canonical_nan的uint32→float memcpy分类与Typed char-pointer有效性未证明；有69行uintptr换算；卷积多层行/列/通道、输入halo和边界output布局的主循环关系仍未完成。 |
| f32-argmaxpool | 未证；1200秒超时，无完整body JSON | Typed下float/uint32位选择和memcpy缺少精确桥（vbslq_f32等）；24行uintptr换算。原全量还出现vaddq_u32等普通integer helper的循环证明缺口，已独立补12个candidate且11个全闭合，但未改历史全量proof；获胜value/index及tie的主循环关系仍未完成。 |
| f32-maxpool | 未证；1200秒超时，无完整body JSON | canonical_nan位构造与Typed memcpy有效性未证明；40行uintptr换算；9输入分组、多pass把新输入归并到output、最终clamp和prefix关系尚未完整证明。 |
| qd8-f32-qc4w-gemm-minmax | 未证；1200秒超时，无完整body JSON | canonical_nan/Typed memcpy桥与5行uintptr换算未闭合；还需packed 4-bit符号扩展、整数重解释、block尺度/补偿和FMA累加的关系及完整多层循环不变量，不能把这些都只归为float模型。 |
| f32-dwconv2d-chw | 未证；1200秒超时，无完整body JSON | canonical_nan及mask的整数/float bit representation、Typed memcpy有效性未闭合；22行uintptr换算；滚动5行缓冲、halo/尾块、三输出行关系和frame尚未完成。 |
| f32-gemm-minmax | 未证；1200秒超时，无完整body JSON | canonical_nan/Typed memcpy桥及28行uintptr换算未闭合。已补NC/KC游标、packed权重位置与variant，但尚未完成4行、NR8分块、K累加器和active mr*nc输出关系；FMA已用真实RNE模型，未当作普通乘加。 |
| f32-spmm-minmax | 未证；1200秒超时，无完整body JSON | canonical_nan/Typed memcpy桥及11行uintptr换算未闭合。还缺prefix_nnz/prefix_diff与实际稀疏cursor、行strip、权重/bias/FMA累加的多层归纳关系。 |
| f32-dwconv-minmax | 未证；1200秒超时，无完整body JSON | 已补按实际FMA/非融合顺序的参考表达式和pixel/channel prefix/frame；canonical_nan/Typed memcpy桥、10行uintptr换算和这些候选的实际body义务仍未闭合。 |
| f32-raddstoreexpminusmax | 未证；1200秒超时，无完整body JSON | 这是13项中唯一没有uintptr转换的一项，仍被float↔integer bit reinterpret/memcpy挡住；vbicq_u32等integer helper原缺注释（新candidate仅vbic还有1个prefix未过），指数构造、多项式和sum reduction关系尚未完整证明。 |
| f32-igemm-minmax | 未证；1200秒超时，无完整body JSON | canonical_nan/Typed memcpy桥及6行uintptr换算未闭合；indirection表、positions/K双层累加和NR8输出前缀关系尚未完成。冻结wrapper本来就是mr=1、offset=0、zero=NULL的既定scope，未偷偷扩大或缩小。 |

已证明的局部内容不能替代整核：共享IEEE关系6/6；FMA helper43/43；内存重排36/36；私有min/max helper46/46；另补12个纯整数helper candidate有11个全闭合、raw165/166，仅vbicq_u32前缀1项未过，原C tokens相同，未改正式run的proof。

当前最后模型的最小地址probe已重新实测：直接uintptr roundtrip成功，但加0/加sizeof(uint32_t)都未证；目标为addr_of_int(to_uint64(int_of_addr(p)))=p和其+4版本。Typed+raw及纯整数Bytes v2结果一致，false control未证明。

复现入口：collect_results.py产生每项results/<kernel>/result.json；final-source-hash-audit.json记录18项source SHA最终核对；v4-call-closure.json包含可达callee和原始uintptr源码行；PROOF-WORK.zh-CN.txt记录各阶段实质proof工作。

这些缺口可继续通过精确地址/位表示模型与循环证明工作解决；本轮没有把新的未证假设、axiom、外部ghost合同或修改impl作为捷径。
