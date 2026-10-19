# 4-lane真实store索引子关系

基于v7，增加column基址与全局输出行基址的loop invariant，增加无requires、有真实body的整数helper spn_store4_bounds，证明row+col*(rows+4)起的4项位于cols*(rows+4)内，并在实际vst1q前调用。原C/spec/模型/函数frame不变；没有新断言，更没有要求输入有限/非NaN。

outer-frame-print01的第一未证part03包括局部w/dmap/nnzmap/n在loop入口已分配时才需属于输出域的条件分支；part04的临时局部同样有When !invalid。这些本应由linked/局部未分配排除，不是实际stack写进输出。另有真正output域包含和uintptr游标证明。此候选只处理后者的索引范围/基址连接，不宣称局部生命周期已修复。

none完整选定18项：column4 frame13，新基址invariant2，原out invariant2，helperensure1。helper完整body还必须单验assigns，共预期2raw；无新的合法域。原out的未证建立/保持仍是依赖，不能只凭frame过就称整循环通过。

```sh
python3 experiments/shim-c-v2/stage3-proof-next/spmm/neon-frame-v8/run.py neon-frame-v8 helper-root01 fct:spn_store4_bounds 180
python3 experiments/shim-c-v2/stage3-proof-next/spmm/neon-frame-v8/run.py neon-frame-v8 selected-root01 spn_frame_2,spn_column_base_4,spn_out_4,spn_store4_index_bound 300
```
sourceguard通过，尚无solver成绩；inline执行配置仍为独立诊断，不当旧checker验收。
