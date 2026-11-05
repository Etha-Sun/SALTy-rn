"""Generate meeting triage from the previously checked fixed source identities.

Judgments below are a static review, not proof/approval or performance results.
"""
from pathlib import Path
import collections
import csv
import json

OUT = Path(__file__).resolve().parent
REF = '821969733d7953a212c51839194add416fd5799b'
BASE = f'https://github.com/Etha-Sun/SALTy-rn/blob/{REF}/verification/qcp/verified/'
# category: R=large structural/execution change, Y=local change; unchanged is hash based.
NOTES = {
 'f32-argmaxpool': ('R', 'P1', '两侧计数截断修复、NEON有效tail读取；另为QCP有限预算提取RVV整通道块并拆读表/自增', '修复与block重构分开审；后者是证明驱动，不是新语义bug'),
 'f32-conv-hwc2chw': ('R', 'P0', 'NEON主函数650→219行；两端分解pixel/FMA helpers，重复只读加载和独立累加器交错改变；另有真实masked-load/clamp/写序修复', '优先恢复可保留的原始调度与结构；NaN/访存/写序修复独立保留审查'),
 'f32-dwconv-minmax': ('R', 'P1', 'RVV请求至多4lane、权重步长由vl改4；补NaN传播；两侧do→while', '虽仅23行但执行宽度/packing重大；原布局反例支持修复，不宜称纯证明妥协'),
 'f32-dwconv2d-chw': ('R', 'P0', '58处嵌套调用临时化、46处scalar-load包装、row9FMA helper抽取与额外只读权重加载；另补NaN传播', '优先拆分语义修复与前端重构；审查重复加载、寄存器/调用影响'),
 'f32-f16-vcvt': ('Y', 'P2', '两侧各2个hex浮点常量换精确同值decimal', '前端兼容；核对常量位身份即可，不作为算法大改'),
 'f32-gemm-minmax': ('Y', 'P1', 'NEON do→while、宏/语句排版；RVV拆自增、加入NaN检测和merge', '局部改动但NaN修复有运行成本；原始diff大量排版不能当算法重写'),
 'f32-igemm-minmax': ('Y', 'P1', 'do→while、拆自增/去cast中的restrict；RVV补NaN传播', '真实NaN修复和语法兼容分别登记'),
 'f32-maxpool': ('R', 'P0', 'NaN修复从向量bitmask改为3个32-word栈数组、向量存回/重载及逐lane标量循环；另修计数、归约树和读表', '最优先审：scalar数组替代是明确证明兼容；bit-exact payload要求强于用户当前浮点观察'),
 'f32-raddstoreexpminusmax': ('R', 'P1', 'RVV固定请求AVL4，重建NEON四累加器/pairwise树及2+1尾部；常量/临时变量兼容', '影响并行度与归约调度；已有有限数1ULP反例，当前无容差观察下确需处理，但可研究替代实现'),
 'f32-spmm-minmax': ('Y', 'P1', 'RVV分离mul+add改FMA并补NaN传播；两侧拆副作用表达式、局部重命名', '局部修复而非大幅循环重写；FMA变化是语义重要项'),
 'f32-vmax': ('Y', 'P1', 'RVV增加5行NaN检测、传播与merge；NEON未改', '双方NaN规则仍不能接受NaN与数字差异；不能直接删传播修复'),
 'f32-vmin': ('Y', 'P1', 'RVV增加5行NaN检测、传播与merge；NEON未改', '局部正确性修复；测量额外指令代价'),
 'qd8-f32-qc4w-gemm-minmax': ('Y', 'P1', 'RVV do→while、NaN边界/累加器修复；NEON未改', '局部修复；保持packing/profile身份'),
 'qd8-f32-qc8w-gemm-minmax': ('Y', 'P1', 'NEON prefetch地址加防溢出guard；RVV isnan替换/拆自增', 'prefetch guard非算法重构，但要区分公开地址域与性能影响'),
 'qd8-f32-qc8w-igemm-minmax': ('Y', 'P2', '去cast中的restrict、isnan形式替换、拆自增', '前端兼容为主'),
 'qs8-f32-vcvt': ('Y', 'P1', 'NEON一处有符号取负改无符号模运算再截断', '避免极值UB/明确截断；小改不等于无需语义审核'),
 'qs8-qc8w-gemm-minmax-fp32': ('Y', 'P1', 'RVV补NaN符号/payload优先级，再reinterpret为整数；NEON未改', '最终是整数结果，不能因浮点输出忽略payload就删中间payload修复'),
 'qs8-rdsum': ('Y', 'P1', '两侧计数宽化/安全min与ceil；NEON累加改模运算、do→while', '局部计数/溢出修复；helper也在闭包内'),
 'qs8-rsum': ('Y', 'P1', 'NEON常量表去static/尾逗号；两侧输出累加改显式模运算', '去static是证明前端妥协，可能导致栈初始化；与必要溢出修复分开'),
 'qs8-vadd-minmax': ('Y', 'P1', '两侧规整signed-byte shift；RVV添加极端移位/左右移分支', '局部但改变边界行为；属于真实语义修复'),
 'qs8-vcvt': ('Y', 'P1', '两侧取负避免溢出；RVV左移1再clip16改直接clip15', '移位/饱和边界修复，不能只按4行轻易批准'),
 'qs8-vlrelu': ('Y', 'P1', '取负改模运算；NEON零向量提为局部变量', '区分UB修复与纯表达式兼容'),
 'qs8-vmul-minmax-fp32': ('R', 'P0', 'RVV整段算术移入record_compute及输入/FP消费者helper，加载改output-parameter；另改magic-bias量化和NaN符号', '主文件18行明显低估；量化修复有反例，整段helper化另审前端与代码生成成本'),
 'qu8-f32-vcvt': ('Y', 'P1', 'NEON取负改模运算；RVV for更新移入body', '语义修复与语法兼容分开'),
 'qu8-rdsum': ('Y', 'P1', '计数宽化、安全min/ceil、NEON do→while', '局部计数修复与循环语法兼容'),
 'qu8-rsum': ('Y', 'P1', '仅NEON常量表去static和尾逗号；RVV未改', '明确前端兼容，无算法修复；优先检查能否保留static'),
 'qu8-vadd-minmax': ('Y', 'P1', '两侧规整shift；RVV补越界移位分支', '局部数值边界修复'),
 's8-vclamp': ('Y', 'P1', 'NEON未改；RVV分bulk64/tail匹配NEON的max/min顺序', '为保留min>max旧域而修复；多一循环但不归大幅重构'),
 'x32-packw-gemm-goi': ('R', 'P0', '两侧KC循环/header helper化；NEON LD2-lane拆LD1；RVV tuple/segmented store改两条strided store', '没有新增语义bug作为该重构动机；优先恢复原生操作/结构或证明替换必要性及成本'),
 'x32-transposec': ('Y', 'P1', '零宽/空高边界、do→while；NEON zip tuple拆zip1/zip2，RVV普通strided-store adapter', '小范围结构兼容；边界修复与tuple适配分别审'),
}

rows = list(csv.DictReader((OUT.parent/'kernel-progress.csv').open()))
perf = {r['kernel']: r for r in csv.DictReader((OUT/'performance-20261026-main30.csv').open())}
def perf_status(kernel):
    if kernel in perf:
        p = perf[kernel]
        if p['gm_speedup_original_over_frozen']:
            return '2026-10-26 RVV原始→821冻结版 GM=' + p['gm_speedup_original_over_frozen'] + '; 完整形状=' + p['complete_AB_BA_shapes'] + '/' + p['scheduled_AB_BA_shapes'] + '; 后续恢复版未测'
        return '已安排；821冻结快照无完整AB/BA形状，无有效GM'
    if kernel == 'f32-vmulc':
        return '额外未改RVV对照，历史GM=0.9746555721645441，不在主图'
    return '冻结归档未测；不填1.0'
out = []
for row in rows:
    kernel = row['kernel']
    unchanged = all(row[f'{s}_main_byte_identical'] == 'True' for s in ['NEON','RVV'])
    if unchanged:
        cat, priority, note, action = 'G', 'P2', 'NEON/RVV两份主C与固定catalog原件逐字一致', '可作保留主源码的代表；仍核对预处理、shim/intrinsic绑定及合同'
    else:
        cat, priority, note, action = NOTES[kernel]
    out.append(dict(kernel=kernel,category={'G':'未改主C','R':'大改或执行策略强改变','Y':'局部小改'}[cat],meeting_priority=priority,
                    NEON_changed_lines=row['NEON_main_changed_lines'],RVV_changed_lines=row['RVV_main_changed_lines'],
                    change_summary=note,meeting_action=action,approval='待逐项确认；本表不批准修改',
                    before_after_kernel_performance=perf_status(kernel),
                    source_ref=REF,NEON_diff=f'diffs/{kernel}.NEON.diff',RVV_diff=f'diffs/{kernel}.RVV.diff',
                    package_url=row['package_url']))
with (OUT/'kernel-triage.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(out[0]));w.writeheader();w.writerows(out)
md=['# 40项逐核会议标记','','固定快照 `'+REF+'`。静态审核建议，不是修改批准、原始程序精化或新证明结果。',
    '“未改”仅指两份主C逐字一致；大改按结构/执行方式及helper判断，小改也可能是重要语义修复。行数为既有去注释/空白的主文件指标，不包含helper，也不是语义距离。','',
    '性能已恢复：[10月26日设置与版本核对](PERFORMANCE-20261026.zh-CN.md)，逐项状态见CSV。', '',
    '| kernel | 分类 | 优先级 | NEON/RVV改动行 | 改了什么 | 会上建议 | 证据 |','|---|---|---|---|---|---|---|']
for x in sorted(out,key=lambda x:({'大改或执行策略强改变':0,'未改主C':1,'局部小改':2}[x['category']],x['kernel'])):
    md.append(f"| `{x['kernel']}` | {x['category']} | {x['meeting_priority']} | {x['NEON_changed_lines']}/{x['RVV_changed_lines']} | {x['change_summary']} | {x['meeting_action']} | [NEON]({x['NEON_diff']}) / [RVV]({x['RVV_diff']}) / [包]({x['package_url']}) |")
(OUT/'ALL-40.zh-CN.md').write_text('\n'.join(md)+'\n')
counts=dict(collections.Counter(x['category'] for x in out))
assert len(out)==40 and len({x['kernel'] for x in out})==40
assert counts=={'大改或执行策略强改变':8,'局部小改':22,'未改主C':10},counts
for x in out:
    for key in ['NEON_diff','RVV_diff']:assert (OUT/x[key]).exists()
print(json.dumps(counts,ensure_ascii=False))
