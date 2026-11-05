"""Internal aesthetic preview only. Every numeric value below is invented.

Grouped-bar layout adapted from paper-plot/scripts/bar_spice.py; muted palette
and export conventions follow figure-polish. Never use this as experiment data.
"""
from pathlib import Path
import csv
import json
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, Patch
import numpy as np

HERE = Path(__file__).resolve().parent
OUT = HERE / "synthetic-preview"
OUT.mkdir(exist_ok=True)
plt.style.use(HERE / "academic.mplstyle")
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 9,
                     "text.usetex": False, "hatch.linewidth": .65})
BLUE, TEAL, GREY, OCHRE = "#6F849B", "#567E75", "#5C6470", "#AD8365"
NOTICE = "SYNTHETIC DATA · DESIGN PREVIEW ONLY · NOT EXPERIMENTAL RESULTS"
rng = np.random.default_rng(20261103)
ids = [f"K{i:02d}" for i in range(1, 36)]
groups = ["Elementwise"] * 18 + ["Reduction / conversion"] * 7 + ["Pooling / movement"] * 4 + ["Convolution / GEMM"] * 6
optimized = np.round(rng.uniform(1.08, 3.8, 35), 2)
retention = np.ones(35)
for i, ratio in zip([4, 9, 14, 20, 25, 29, 34], [.98, .94, .99, .97, .89, .95, .98]):
    retention[i] = ratio
states = ["admitted"] * 35
for i in [12, 31]:
    states[i] = "counterexample"
for i in [23, 32]:
    states[i] = "unresolved"
admitted = np.array([optimized[i] * retention[i] if states[i] == "admitted" else np.nan for i in range(35)])
hours = np.round(rng.lognormal(.8, .72, 35) * np.linspace(.5, 2.3, 35), 2)
tokens = np.round(hours * rng.uniform(.10, .24, 35), 2)
rows = [{"data_kind": "synthetic", "slot": k, "illustrative_family": groups[i],
         "optimized_speedup": optimized[i], "admitted_speedup": "" if np.isnan(admitted[i]) else round(admitted[i], 3),
         "illustrative_status": states[i], "verification_hours": hours[i], "verification_tokens_m": tokens[i],
         "historical_optimization_hours": "NR", "historical_optimization_tokens": "NR"}
        for i, k in enumerate(ids)]
with (OUT / "SYNTHETIC-NOT-RESULTS.csv").open("w") as f:
    writer = csv.DictWriter(f, fieldnames=list(rows[0]))
    writer.writeheader()
    writer.writerows(rows)

catalog = []
def export(fig, name, title, note, numeric=True):
    fig.text(.07, .967, title, fontsize=15, weight="medium", ha="left", va="top")
    fig.text(.07, .967 - .36 / fig.get_figheight(), NOTICE if numeric else "CONCEPTUAL DESIGN · PROPOSED INTEGRATION", fontsize=8, color=OCHRE)
    fig.text(.07, .025, note, fontsize=7.5, color=GREY, va="bottom")
    for ext in ["png", "pdf", "svg"]:
        fig.savefig(OUT / f"{name}.{ext}", dpi=300, facecolor="white", bbox_inches="tight", pad_inches=.14)
    plt.close(fig)
    catalog.append({"name": name, "surface_class": "internal_review", "numeric_data": "synthetic" if numeric else "none",
                    "script": "../render_synthetic.py", "source": "SYNTHETIC-NOT-RESULTS.csv" if numeric else "../../PAPER-POSITIONING-AND-METADATA.zh-CN.md",
                    "exports": [f"{name}.{ext}" for ext in ["png", "pdf", "svg"]]})

fig, axes = plt.subplots(3, 1, figsize=(10.2, 7.4))
fig.subplots_adjust(left=.085, right=.98, bottom=.13, top=.81, hspace=.50)
for panel, (ax, indices) in enumerate(zip(axes, np.array_split(np.arange(35), 3))):
    x = np.arange(len(indices))
    ax.bar(x-.18, optimized[indices], .35, color=BLUE, edgecolor="white", linewidth=.6, label="Final optimized RVV")
    ax.bar(x+.18, admitted[indices], .35, color=TEAL, hatch="///", edgecolor="white", linewidth=.6, label="RVV admitted by Vekto")
    for j, i in enumerate(indices):
        if np.isnan(admitted[i]):
            ax.text(j+.18, .12, "—", ha="center", color=OCHRE, fontsize=13)
    ax.axhline(1, color=GREY, ls="--", lw=.85)
    ax.set_ylim(0, 4.5)
    ax.set_yticks([0, 1, 2, 3, 4])
    ax.set_ylabel("Speedup (×)")
    ax.set_xticks(x, [ids[i] for i in indices])
    ax.set_xlim(-.65, len(indices)-.35)
    ax.grid(axis="x", visible=False)
    ax.set_title(f"({chr(97+panel)})  Kernel slots {indices[0]+1}–{indices[-1]+1}", fontsize=9, pad=8)
axes[0].legend(loc="lower left", bbox_to_anchor=(0, 1.17), ncol=2, fontsize=9)
axes[-1].set_xlabel("Illustrative slots; no mapping to real kernels")
export(fig, "01-performance", "Vekto  /  Preserving optimized performance",
       "Common illustrative baseline: pre-optimization RVV = 1×. Missing admitted bars are not zero.\nAll values and outcomes are invented; no confidence intervals are claimed.")

fig, axes = plt.subplots(2, 1, figsize=(10.2, 5.9))
fig.subplots_adjust(left=.085, right=.98, bottom=.17, top=.80, hspace=.47)
for ax, values, color, label in zip(axes, [hours, tokens], [BLUE, TEAL], ["Verification time (h)", "Verification tokens (M)"]):
    ax.bar(np.arange(35), values, .70, color=color, edgecolor="white", linewidth=.4)
    ax.set_ylabel(label)
    ticks = [0, 4, 9, 14, 19, 24, 29, 34]
    ax.set_xticks(ticks, [ids[i] for i in ticks])
    ax.set_xlim(-.7, 34.7)
    ax.grid(axis="x", visible=False)
axes[-1].set_xlabel("Illustrative kernel slots; all attempts included in the intended metric")
export(fig, "02-verification-cost", "Vekto  /  Cost of verification",
       "Historical optimization cost: NR (not reconstructed). Shared infrastructure cost would be reported separately.\nAll displayed hours and token counts are invented for layout review.")

fig, ax = plt.subplots(figsize=(10.2, 4.8))
fig.subplots_adjust(left=.07, right=.97, bottom=.26, top=.76)
ax.axis("off")
table_rows = []
for family in dict.fromkeys(groups):
    idx = np.array([i for i, x in enumerate(groups) if x == family])
    table_rows.append([family, str(len(idx)), str(sum(states[i] == "admitted" for i in idx)),
                       str(sum(states[i] == "counterexample" for i in idx)), str(sum(states[i] == "unresolved" for i in idx)),
                       f"{np.median(hours[idx]):.1f}", f"{np.median(tokens[idx]):.2f}"])
table_rows.append(["Total / median", "35", "31", "2", "2", f"{np.median(hours):.1f}", f"{np.median(tokens):.2f}"])
table = ax.table(cellText=table_rows, colLabels=["Illustrative family", "n", "Admitted", "Counterex.", "Unresolved", "Median h", "Median M tokens"],
                 colWidths=[.25, .06, .12, .13, .13, .12, .19], bbox=[0, 0, 1, 1], cellLoc="center")
table.auto_set_font_size(False)
table.set_fontsize(8.8)
for (r, c), cell in table.get_celld().items():
    cell.set_edgecolor("white")
    cell.set_linewidth(1.5)
    cell.set_facecolor("#E7ECEE" if r == 0 else ("#EEF3F0" if r == 5 else ("#F5F6F7" if r % 2 else "white")))
    cell.get_text().set_color(GREY)
    if r in [0, 5]:
        cell.get_text().set_weight("bold")
    if c == 0:
        cell.get_text().set_ha("left")
export(fig, "03-coverage-table", "Vekto  /  Coverage and effort",
       "Every status and cost is hypothetical. No real kernel is classified here.\nCounts and medians are derived from the same synthetic CSV as the bar charts; n = planned sample size.")

fig, ax = plt.subplots(figsize=(10.2, 4.6))
fig.subplots_adjust(left=.05, right=.98, bottom=.17, top=.81)
ax.set_xlim(0, 10)
ax.set_ylim(0, 3.3)
ax.axis("off")
def box(x, y, w, h, label, color):
    ax.add_patch(FancyBboxPatch((x, y), w, h, boxstyle="round,pad=.04,rounding_size=.07", facecolor=color, edgecolor="#C9D2D5", linewidth=.8))
    ax.text(x+w/2, y+h/2, label, ha="center", va="center", fontsize=9, linespacing=1.45, color="#36414B")
box(.1, 2.05, 2.5, .86, "NEON source\nFixed code + caller contract", "#F0F2F4")
box(3.2, 2.05, 3.1, .86, "SALTyRN + Autocomp\nTranslation / bounded checks / optimization", "#F0F2F4")
box(7, 2.05, 2.8, .86, "Final optimized RVV\nExisting external artifact", "#F0F2F4")
box(3.2, .40, 3.1, 1.03, "Vekto\nSemantic models + contracts\nImplementation proofs + equivalence", "#DCE9E3")
box(7, .40, 2.8, 1.03, "Verification outcome\nAccepted / counterexample / unresolved", "#EEF3F0")
for start, end in [((2.65,2.48),(3.15,2.48)), ((6.35,2.48),(6.95,2.48)), ((6.35,.92),(6.95,.92)), ((1.35,2),(3.15,.95)), ((8.4,2),(5.65,1.48))]:
    ax.annotate("", xy=end, xytext=start, arrowprops={"arrowstyle":"->", "color":GREY, "lw":1.05})
export(fig, "04-framework", "Vekto  /  An independent validation layer",
       "Proposed positioning: Keagan's pipeline supplies the main evaluation artifacts.\nThe figure does not claim a new optimizer or a completed integration.", numeric=False)
(OUT / "figure_catalog.json").write_text(json.dumps(catalog, indent=2)+"\n")
print(f"Rendered {len(catalog)} previews in {OUT}")
