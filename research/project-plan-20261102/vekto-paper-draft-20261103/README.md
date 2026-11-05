# Vekto bilingual manuscript package

This package contains an English and a Chinese working manuscript, editable LaTeX tables, and all image dependencies. It is a manuscript discussion draft, not a submission-ready paper or a report of completed new experiments.

## Read first

- [English manuscript](paper.en.md)
- [中文文稿](paper.zh-CN.md)
- [Author notes and unresolved evidence / 写作依据与待补证据](AUTHOR-NOTES.zh-CN.md)
- [English LaTeX table previews](tables/tables.en.pdf)
- [中文 LaTeX 表格预览](tables/tables.zh.pdf)

The manuscripts contain table images rendered **from LaTeX**, plus expandable LaTeX source and links to the editable files. No table was drawn with plotting software. If a Markdown viewer does not support collapsible details, read the table PDFs or `.tex` files. Equations require a math-capable Markdown viewer.

## Contents and evidence status

- `figures/`: two conceptual diagrams and one synthetic performance illustration, each as PDF/SVG/PNG. Figure explanations are in manuscript captions, not inside slide-style headers.
- `tables/`: four tables in each language, TeX preview documents, compiled PDFs, and rendered previews. All empirical results remain TBD. The 35 filenames come from the actual final-output repository.
- `data/source-inventory.json`: real source paths and Git blob identities at commit `80feb4564cb470de301062109b6f89db672bdf9d`. It is not proof evidence.
- `data/performance-synthetic.csv`: invented numbers authorized solely for appearance review. Used only by the synthetic illustration in Appendix B. Slot IDs do not map to actual kernels. These values are not included in the result tables or empirical claims.
- `skills/vekto-paper-writing/SKILL.md`: the user's eight writing requirements and PL presentation conventions. A matching skill was installed locally for future writing.
- `macros.tex`: Vekto naming and FIX/NEW author annotations for later Overleaf use.
- `references.bib`, `sources/README.md`: literature metadata and source provenance. Original third-party PDFs are not redistributed.
- `scripts/`: table and figure generators and a dependency checker.
- `VALIDATION.json`: checks actually performed for this package. It is not a kernel verification certificate.

## Rebuild

Use Python 3 with `requirements.txt`. The tables require `pdflatex` and `xelatex`, with `geometry`, `booktabs`, `longtable`, `amsmath`, `xspace`, `ctex`, and Fandol fonts. Prebuilt assets are included, so reading the package does not require these tools.

```bash
python3 -m pip install -r requirements.txt
bash scripts/build.sh
```

The build rewrites only generated assets and the marked table blocks in the two manuscripts. It does not run a kernel, proof checker, optimizer or performance benchmark. The table preview document uses landscape pages so the full inventory can be inspected; the individual table sources can be incorporated into the final venue template.

## 中文说明

此次交付已从规划转为论文式初稿，包含摘要、引言、示例、形式化定义、方法、实验设计、案例分析位置、相关工作和局限。中英文使用同一套定义、样本数量和证据边界。正式结果尚未取得，不能把排版用模拟图解释为已经完成的实验。

当前暂按“Vekto 是独立验证层，SALTyRN/Autocomp 提供主实验产物”组织论述，仍供后续讨论。作者暂为 Yuechun Sun / ycsun@berkeley，邮箱后缀与机构未擅自补全。此包不是完整 LaTeX 正文，但全部表格已用 LaTeX 编写并编译，后续可复用到 Overleaf。
