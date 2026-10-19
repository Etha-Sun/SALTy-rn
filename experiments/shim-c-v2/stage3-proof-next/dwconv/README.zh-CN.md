# dwconv-minmax 后续证明候选

基于 HEAD `7a2e0ae` 的 stage3-conv/revision5，当前候选 r4；没有新增整核通过。不修改原C/shim/spec/wrapper、旧checker或模型，所有新增义务均须证明，不能凭切分点后的绿色认作整链完成。

- r1：将channel内循环写集合从所有pixels收窄为当前pixel输出区间；保留外层完整写集合和原输出前缀关系。ghost Row0/1/2捕获实际转换后的行指针，补真实逐次游标归纳；原通过uintptr关联T0的义务仍保留。原packed weight游标命名，新增块索引cut及两个整数lemma。
- r2：未执行、不采纳的显式lane展开候选。发现对应FMA/mul/add helper合同与body同已验证GEMM r4版本；1秒筛查不足以证明缺proof，所以没有把重复展开当作成果。对照见 helper-comparison.json。
- r3：从r1继续，补外层CH==channels和W0==weights不变量及内层checked seeds。weight-print01.log保留实际未证公式，修改有具体目标依据。新增loop invariant及assert均列为验证债务，未新增requires。

r1正反控制接受，定点12/18，全局8/8（含两个新block lemma）；r3正反控制接受，定点24/30，其中新增outer不变量建立/保持和checked seeds12项全过。权重关系仍有4项、RVV行0保持与weight_index各1项未证。后续运行结果以独立logs原始文件为准。

`run.py`默认10秒/solver；`run30.py`30秒/solver。两者最多2 workers、每solver2048MB，绝对固定handoff-model-plus入口，策略/模型不修改。每次记录源/冻结/proof/模型/执行器SHA，observer实时记录，超时无raw不能计0/0。`inventory.py`只生成清单，独立body/global批次，CFG项与通常raw不同；不构成证明验收。完整尝试最多1200秒。所有日志使用独立名称，不覆盖历史文件。

未发现真实kernel反例。已知uintptr转换、canonical_nan位表示与memcpy桥及完整输出关系仍有义务；有限时间未证不意味着这些公式形式上不可证明。

## r4实际闭合的行游标组

r4保留r3全部内容，仅在真实RVV `i0 += vl` 后添加advance断言、`c -= vl` 后添加rebase断言，两者均须由真实body证明。30秒/solver定点14/14全部通过：两侧三行游标不变量的建立/保持12项，加两个新断言自身2项；Qed13、CVC5最后1项17.6秒。r3相同30秒策略仍11/12，因此这次不是把未证义务藏到切分点。结论仅为这组游标关系闭合，未覆盖原uintptr行基址、FMA输出前缀及其它循环frame。

r4完整清单为827项（body819=主程序387+helper432，global8），CFG-only36项另列。body/global盘点均exit0且含normal_exit marker；8项global实际全过。root独立复验也确认行游标14/14、global8/8和正反控制接受，见root-review证据（不是新增整核通过）。

r4 full01原定1200秒、30秒/solver、2workers每solver2048MB，最终exit124且没有最终raw，流式证据全部保留。运行中主agent报告09:58 UTC系统load average为1827/1494/863，本worker也观察到简单shell读取严重延迟；这是共享服务器资源拥塞，不能把该轮timeout解释为逻辑失败、不可证明或反例。实际耗时、输入SHA、逐目标已证/已尝试未证/没有完成结果的分类见logs/full01-result.json与FULL-STATUS.json。未调整并发或原预算。

## 后续未整核候选

r5将checked seed移动到Row ghost初始化之后，新增对齐取整lemma；root实际单worker复验selected-root01完整29/32，global9/9。原NEON权重游标建立和RVV weight_index已通过，剩NEON权重保持、RVV权重建立/保持三项；相应raw和打印公式完整保存。r5独立正反控制control-root01已接受（3/4，false后置保持未证），没有复用r4记录。

r6从r5补三个真实body、无requires、assigns nothing的ghost helper，证明条件式weight零偏移初始化、对齐块步进、size_t安全减法关系。在真实更新处调用，并加四个checked advancement/rebase切分点；root实际helpers-root01完整6/6，独立正反控制接受；weight-root01完整15/15：两侧weight invariant建立/保持4、seed4、index2、advanced2、future/rebased2、stage3_vl1；新增helper和切分点自身义务均有raw覆盖。旧行游标和9global仍需r6上下文复验，完整分母正在重新生成，不沿用827。没有普通内存写，不加通用地址桥公理。

conv-cursor-r1仅扩展原九项内f32-conv-hwc2chw：从stage3-conv/revision3补ow_done范围及真实ow/ow_done更新前后四个checked cuts，所有原义务保留。source_guard通过，求解统一交root执行；不能把guard当证明通过。

worker此前一个工具调用被登录shell/环境阻塞1317秒后中断，r5 worker control未启动，无相应证明记录。后续所有exec采用login:false；需要Why3 IPC的求解统一由root启动，worker仅编辑、只读审查或none清单。该环境错误不算proof失败。


dwconv2d-height-r1扩展原九项内f32-dwconv2d-chw：针对旧3项height/rows保持未证，为真实doz仅补精确结果ensures（不加requires/assigns），补有body的无requires ghost算术helper及更新前后检查点。首次guard因原rvv.c无末尾换行的diff编码失败，未进入求解；失败patch和说明保留，修正diff末尾标记后guard02通过。该准备阶段错误不算逻辑失败。待root执行真实doz/helper和height/rows组，尚无成功声明。

r6独立完整清单：body normal 831（主程序393、helper438），CFG-only42另列；global9，总分母840。body/globals均exit0、normal_exit=true、inputs_unchanged=true。生成清单不等于证明通过。

conv-cursor-r1实际定点10/15，pending为NEON width保持、RVV store_cursor保持、next_width_before/subtracted/rebased。未证cuts自身未被忽略。cursor-print01是none/no-qed/no-clean真实公式：raw模型局部size_t也由Mint数组保存，更新含to_uint64与多层内存frame，不能称作只缺普通整数线性算术。

conv-cursor-r2独立冻结：两个空body、无requires ghost helper显式证明size_t安全减法/加法的条件等式；before和bound检查提前到stage3_vl之后，真实输出指针更新和ow_done更新后补两个pointer切分点。待root执行，不能因添加检查点当成已闭合。NEON width未证仍保留，本次定点仅检查RVV关系组。

dwconv2d-height-r1实际11/14，RVV高度组7/7连同新增cuts闭合；NEON三个新增cut未证，旧invariant通过依赖这些cut，不能认作整链。height-print01保留真实公式，doz缺frame造成调用后input_height读取的Mint_0没有与调用前Mint_157相联系；详见wp-diagnosis.json。这是模块化证明抽象缺口，不是kernel反例。未擅加assigns或修改执行配置。

dwconv2d-height-inline-r2经root授权准备为独立执行诊断：proof.patch与height-r1完全相同，原C/spec/shim/model均不变；唯一执行差异是在inline-calls增加真实doz，remove-inlined仍只删除test_neon/test_rvv，保留doz定义另验body。execution-config.json与freeze.json固定执行器及配置SHA，runner-diff.patch可直接审查。未经过旧checker验收，不把诊断通过等同正式验收。求解由root统一执行。

argmax-index-r1仅扩展原九项内f32-argmaxpool，以stage3-unary-front/replay/f32-argmaxpool为基线，锁18fae880dd3039ce8d2a5dbc5840052444be0dd0cd11916c2cb64e0fbe000973；不能改用handoff-model-plus入口。原share/config继续由该锁引用。新增uint32 index指针seed/step及size减法三项有body ghost helper，真实seed/vl/advance/rebase四个checked cuts，保留原group/output/input关系。专用run30-unary.py断言候选模型锁与固定入口相符；仅待root执行，不声明通过。

r6 full-root01完整预算1200秒后exit124，inputs unchanged，无最终raw/normal marker。按840完整分母，该完整run流式记录408 valid、16 timeout、416未取得结果；body831中分别408/16/407，另9global没有在该full流取得结果。独立globals-root01的9/9单列，不能并入“full得到417”成绩。详见r6/FULL-STATUS.json。不是整核完成；局部37/37、helper6/6也不能替代完整验收。

argmax-index-r1实际5/8，三个pending为channel_bounds保持、advanced/rebased新cuts，旧index游标绿不能代替切分点自身证明。当前基线四个u32 helper缺wholefunction frame；r2仅补真实helper内部loop range/frame/prefix（merge加suffix），不加function requires/assigns。root授权的独立执行器inline四个真实helper body，保留定义；新执行配置SHA单独记录。所有inline loop/RTE义务须在真实caller域证明，不能宣称未约束的独立helper任意输入body已过。root执行，仍不作旧checker验收。
