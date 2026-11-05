"""Generate editable LaTeX tables and embed their source into both manuscripts.

This consumes the real source inventory, never the synthetic performance CSV.
"""
from pathlib import Path
import json
import re

ROOT = Path(__file__).resolve().parents[1]
inventory = json.loads((ROOT / 'data/source-inventory.json').read_text())
OUT = ROOT / 'tables'
OUT.mkdir(exist_ok=True)

def regular(caption, label, columns, header, rows):
    return '\n'.join([
        r'\begin{table}[htbp]', r'\centering', r'\small',
        r'\caption{' + caption + '}', r'\label{tab:' + label + '}',
        r'\begin{tabular}{' + columns + '}', r'\toprule', header + r' \\',
        r'\midrule', *[row + r' \\' for row in rows], r'\bottomrule',
        r'\end{tabular}', r'\end{table}', ''])

for lang in ['en', 'zh']:
    zh = lang == 'zh'
    t = {}
    t['scope'] = regular(
        '评估范围与结果状态。数量是研究规模，不是成功数量。' if zh else 'Evaluation scope. Counts describe subjects, not successful proofs.',
        'scope', '@{}llrrrr@{}',
        '实验 & 对象 & 核/操作数 & 关系数 & 已验证 & 未解决' if zh else 'Study & Subjects & Kernels/ops & Relations & Proved & Unresolved',
        [r'E1 & '+('既有最终优化 RVV' if zh else 'Existing optimized RVV')+r' & 35 & 35 & TBD & TBD',
         r'E2 & '+('AVX 到 RVV/HVX' if zh else 'AVX to RVV/HVX')+r' & 5 & 10 & TBD & TBD',
         r'E3 & XNNPACK & TBD & TBD & TBD & TBD',
         r'E4 & '+('一个完整程序边界' if zh else 'One complete program boundary')+r' & N/A & TBD & TBD & TBD'])
    t['setup'] = regular(
        '来源与目标评测配置。待定项不表示已经精确复现。' if zh else 'Sources and intended measurement setup. Pending fields are not established reproductions.',
        'setup', '@{}p{.24\linewidth}p{.67\linewidth}@{}',
        '项目 & 配置或状态' if zh else 'Item & Configuration or status',
        [('最终产物' if zh else 'Final artifacts')+r' & \texttt{optimized-rvv-kernels}, \texttt{80feb4564}',
         ('原始 NEON 与优化前 RVV' if zh else 'NEON source and initial RVV')+' & '+('逐项配对待完成' if zh else 'Per-kernel pairing pending'),
         ('目标 RVV 硬件' if zh else 'Intended RVV target')+r' & Saturn + Shuttle; VLEN 512 bits; datapath 256 bits',
         ('原论文平台' if zh else 'Reported upstream platform')+' & FireSim / U250; Apple M1 Pro '+('用于 ARM 对照' if zh else 'for ARM comparison'),
         ('本研究精确配置' if zh else 'Exact study configuration')+' & '+('RTL、缓存、内存模型、工具链与 harness 版本待绑定' if zh else 'RTL, caches, memory model, toolchain and harness revisions pending'),
         ('重复与汇总' if zh else 'Repetition and aggregation')+' & '+('优先复用原协议，偏差单独说明' if zh else 'Recover upstream protocol; document any deviations'),
         ('优化时间与 token' if zh else 'Optimization time and tokens')+' & '+('外部历史记录；不可获得时记 NR' if zh else 'External historical records; NR when unavailable')])
    caption = ('35 项最终优化产物的证明、修改与成本。全部结果待填；时间包括失败重试。$\Delta A/\Delta B$ 为源/目标代码改动，统计口径见正文。历史优化成本缺失时记 NR。' if zh else
               'Proofs, changes and cost for the 35 final optimized artifacts. All result cells are pending; time includes unsuccessful attempts. $\Delta A/\Delta B$ records source/target changes. Unavailable historical optimization cost is NR.')
    header = ('编号 & 发布文件 & 证明 & $\Delta A/\Delta B$ & 时间(h) & Token(M) & $R_{\mathrm{perf}}$' if zh else
              'ID & Published file & Proof & $\Delta A/\Delta B$ & Time (h) & Tokens (M) & $R_{\mathrm{perf}}$')
    lines = [r'{\scriptsize', r'\setlength{\tabcolsep}{5pt}', r'\renewcommand{\arraystretch}{1.17}',
             r'\begin{longtable}{@{}rlcrrrr@{}}', r'\caption{'+caption+r'}\label{tab:kernels}\\',
             r'\toprule', header+r' \\', r'\midrule', r'\endfirsthead',
             r'\toprule', header+r' \\', r'\midrule', r'\endhead',
             r'\bottomrule', r'\endfoot']
    for i, item in enumerate(inventory['kernels'], 1):
        lines.append(str(i)+r' & \texttt{'+item['path'].replace('_',r'\_')+r'} & TBD & TBD & TBD & TBD & TBD \\')
    lines.extend([r'\end{longtable}', '}', ''])
    t['kernels'] = '\n'.join(lines)
    t['extension'] = regular(
        '扩展与交叉检查的记录模板。未选定的操作不使用真实 kernel 名称填充。' if zh else 'Reporting template for extensions and cross-checks. Unselected operations remain unassigned.',
        'extension', '@{}lllllll@{}',
        '实验 & 操作/实现对 & 目标 & 新增语义 & 复用依赖 & 成本 & 结果' if zh else 'Study & Operation/pair & Target & New semantics & Reused assets & Cost & Outcome',
        ['E2 & TBD & RVV & TBD & TBD & TBD & TBD',
         'E2 & TBD & HVX & TBD & TBD & TBD & TBD',
         'E3 & TBD & TBD & N/A & TBD & TBD & TBD'])
    for name, src in t.items():
        (OUT / f'{name}.{lang}.tex').write_text(src)
    manuscript = ROOT / ('paper.zh-CN.md' if zh else 'paper.en.md')
    text = manuscript.read_text()
    for name, src in t.items():
        marker = f'{{{{TABLE_{name.upper()}_{lang.upper()}}}}}'
        block = f'<!-- TABLE:{name}:{lang}:BEGIN -->\n'
        block += f'![Table rendered from LaTeX](tables/previews/{name}.{lang}.png)\n\n'
        block += ('LaTeX 源码：' if zh else 'LaTeX source: ') + f'[{name}.{lang}.tex](tables/{name}.{lang}.tex). '
        block += ('[编译预览]' if zh else '[Compiled preview]')+f'(tables/tables.{lang}.pdf).\n\n'
        block += '<details>\n<summary>'+('展开 LaTeX 源码' if zh else 'Editable LaTeX source')+'</summary>\n\n'
        block += f'```latex\n{src.rstrip()}\n```\n\n</details>\n'
        block += f'<!-- TABLE:{name}:{lang}:END -->'
        if marker in text:
            text = text.replace(marker, block)
        else:
            pattern = rf'<!-- TABLE:{name}:{lang}:BEGIN -->.*?<!-- TABLE:{name}:{lang}:END -->'
            text, count = re.subn(pattern, lambda _: block, text, flags=re.S)
            assert count == 1, (name, lang, count)
    manuscript.write_text(text)
    cls = r'\documentclass[10pt,fontset=fandol]{ctexart}' if zh else r'\documentclass[10pt]{article}'
    doc = [cls, r'\usepackage[a4paper,landscape,margin=18mm]{geometry}',
           r'\usepackage{booktabs,longtable,amsmath,xspace}', r'\input{../macros.tex}',
           r'\begin{document}', r'\pagestyle{plain}']
    for name in t:
        doc.extend([r'\input{'+name+'.'+lang+r'.tex}', r'\clearpage'])
    doc.append(r'\end{document}')
    (OUT / f'tables.{lang}.tex').write_text('\n'.join(doc)+'\n')
print('Generated eight LaTeX table sources and embedded them in both Markdown manuscripts.')
