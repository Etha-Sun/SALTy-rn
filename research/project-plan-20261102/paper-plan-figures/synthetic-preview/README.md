# Vekto figure previews — synthetic data only

Surface class: `internal_review`. The user explicitly authorized invented values to evaluate appearance. **No numeric value or outcome in these previews is an experimental result.** K01–K35 are illustrative slots without a mapping to real source files. Do not import this CSV into a measurement pipeline or use its values in manuscript claims.

| Preview | PNG | PDF | SVG |
| --- | --- | --- | --- |
| Performance: 35 paired slots, common illustrative RVV baseline | [Preview](01-performance.png) | [Vector](01-performance.pdf) | [Editable text](01-performance.svg) |
| Verification hours and token cost | [Preview](02-verification-cost.png) | [Vector](02-verification-cost.pdf) | [Editable text](02-verification-cost.svg) |
| Coverage and cost table | [Preview](03-coverage-table.png) | [Vector](03-coverage-table.pdf) | [Editable text](03-coverage-table.svg) |
| Proposed relationship to SALTyRN/Autocomp; no numeric data | [Preview](04-framework.png) | [Vector](04-framework.pdf) | [Editable text](04-framework.svg) |

Source: [SYNTHETIC-NOT-RESULTS.csv](SYNTHETIC-NOT-RESULTS.csv). Script: [render_synthetic.py](../render_synthetic.py). Export manifest: [figure_catalog.json](figure_catalog.json).

The grouped-bar layout adapts the paper-plot `bar_grouped_hatch` / `bar_spice.py` template and uses the existing academic style. Colors are muted blue/green; hatching distinguishes the admitted series without requiring color vision. Axes start at zero, the performance reference is 1×, missing admitted values are not plotted as zero, and the invented values have no fabricated confidence intervals. Table counts and medians come from the same synthetic CSV. Historical optimization cost remains NR, consistent with evaluating existing artifacts rather than rerunning search.

The source inventory elsewhere contains the real 35 files. This preview does not assert that any of them is admitted, has a counterexample, needs a repair, or has a particular runtime.

Reproduce from the repository root:

```bash
MPLCONFIGDIR=/tmp/vekto-paper-mpl python3 research/project-plan-20261102/paper-plan-figures/render_synthetic.py
```

Visual review: opened all four first renders; fixed overlapping title/notice spacing on short canvases and rerouted the candidate-to-proof arrow above the outcome box. Reopened the revised table and framework previews to check spacing and connections. These are review-sized figures; final paper sizing, typography and captions follow the approved venue template.
