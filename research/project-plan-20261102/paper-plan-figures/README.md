# Empty figure layouts for outline review

**Update (2026-11-03):** The user authorized invented values for aesthetic review. See the separate [synthetic previews](synthetic-preview/README.md). The empty layout below is retained as an earlier design; the current cost figure emphasizes verification because E1 consumes existing optimized artifacts. Synthetic values never enter real experiment tables.

Surface class: `internal_review`. These are layout previews, not result figures or manuscript pages. No measured or synthetic observations are used. K01–K35 and Op1–Op5 are unassigned slots derived from the user's planned sample counts. All outcomes and costs remain pending. Axis limits are provisional.

- [PNG preview](layout-preview.png)
- [Vector PDF](layout-preview.pdf)
- [Editable-text SVG](layout-preview.svg)
- [Rendering script](render_layout.py)
- [Narrative, table templates and figure definitions](../PAPER-PLAN-FOR-REVIEW.zh-CN.md)

Reproduce from the repository root:

```bash
MPLCONFIGDIR=/tmp/simd-paper-plan-mpl python3 research/project-plan-20261102/paper-plan-figures/render_layout.py
```

The local style is adapted from the figure-polish skill's academic Matplotlib style. Hex colors are quoted so Matplotlib does not parse them as comments. The bundled skill asset was not modified.

Visual inspection: opened the first render, increased bottom spacing and export padding, and replaced abbreviated legend names with readable labels. Opened the revised render to check labels and spacing. The four panels are a review board; final manuscript figures will be separate and sized to the selected venue template. Bars and uncertainty intervals will only be drawn from actual measurements.
