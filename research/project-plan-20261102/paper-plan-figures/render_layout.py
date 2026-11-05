"""Render an internal layout review. No measured or synthetic results are plotted."""
from pathlib import Path
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Patch, Rectangle

HERE = Path(__file__).resolve().parent
STYLE = HERE / "academic.mplstyle"
plt.style.use(STYLE)
plt.rcParams.update({
    "font.family": "DejaVu Sans", "font.size": 10,
    "axes.titlesize": 12, "axes.labelsize": 10,
    "text.usetex": False, "svg.fonttype": "none",
})
BLUE, TEAL, GREY = "#657F96", "#718F86", "#666666"
fig, axs = plt.subplots(2, 2, figsize=(12.8, 8.4))
fig.subplots_adjust(left=.075, right=.97, bottom=.17, top=.82, wspace=.29, hspace=.72)
fig.suptitle("SIMD verification: figure layout for review", x=.075, ha="left", y=.97, fontsize=20)
fig.text(.075, .915, "NO EXPERIMENTAL DATA  |  Empty slots are not zero values or failures.", color=GREY, fontsize=11)

def pending(ax, text="Results pending"):
    ax.text(.5, .50, text, transform=ax.transAxes, ha="center", va="center",
            fontsize=14, color="#777777", bbox={"facecolor":"white", "edgecolor":"none", "pad":6})

def kernel_axis(ax, title, ylabel):
    ax.set_title(title, loc="left", pad=15)
    ax.set_xlim(-.7, 34.7)
    slots = [0, 4, 9, 14, 19, 24, 29, 34]
    ax.set_xticks(slots, [f"K{i+1:02d}" for i in slots])
    ax.set_xlabel("Kernel slots (identities not assigned)")
    ax.set_ylabel(ylabel)
    ax.spines[["top", "right"]].set_visible(False)
    ax.grid(False)

ax = axs[0, 0]
kernel_axis(ax, "F2  Performance", "Speedup over unoptimized RVV (×)")
ax.set_ylim(0, 4)
ax.set_yticks([0, 1, 2, 3, 4])
ax.axhline(1, color=GREY, lw=1, ls="--")
ax.text(.98, .27, "1× reference", transform=ax.transAxes, ha="right", color=GREY, fontsize=9)
ax.legend(handles=[Patch(facecolor=BLUE, label="Optimized RVV"), Patch(facecolor=TEAL, hatch="//", label="Verified RVV")],
          loc="upper left", frameon=False, ncol=2, fontsize=9)
pending(ax)
ax.text(0, -.30, "Planned: paired bars + uncertainty; common baseline.", transform=ax.transAxes, color=GREY, fontsize=9)

ax = axs[0, 1]
kernel_axis(ax, "F3a  Time cost", "Elapsed time (hours)")
ax.set_ylim(0, 1)
ax.set_yticks([])
pending(ax, "Timing data pending")
ax.text(0, -.30, "Planned: optimization / verification; retries included.", transform=ax.transAxes, color=GREY, fontsize=9)

ax = axs[1, 0]
kernel_axis(ax, "F3b  Token cost", "Tokens (millions)")
ax.set_ylim(0, 1)
ax.set_yticks([])
pending(ax, "Usage data pending")
ax.text(0, -.30, "Planned: optimization / verification; shared costs separate.", transform=ax.transAxes, color=GREY, fontsize=9)

ax = axs[1, 1]
ax.set_title("F4  Five AVX operations, two target ports", loc="left", pad=15)
ax.set_xlim(-.5, 1.5)
ax.set_ylim(4.5, -.5)
for row in range(5):
    for col in range(2):
        ax.add_patch(Rectangle((col-.5, row-.5), 1, 1, facecolor="white", edgecolor="#D5DADD", linewidth=.8))
        ax.text(col, row, "TBD", ha="center", va="center", color="#888888", fontsize=10)
ax.set_xticks([0, 1], ["RVV", "Hexagon / HVX"])
ax.set_yticks(range(5), [f"Op{i+1}" for i in range(5)])
ax.set_ylabel("Operation slots")
ax.tick_params(length=0)
for spine in ax.spines.values():
    spine.set_visible(False)
ax.grid(False)
ax.text(0, -.30, "Planned: explicit outcome labels; costs in a companion table.", transform=ax.transAxes, color=GREY, fontsize=9)

fig.text(.075, .025, "Internal design preview. Planned counts only; axis ranges are provisional. Final paper figures will be separate.", fontsize=9, color=GREY)
for extension in ["png", "pdf", "svg"]:
    fig.savefig(HERE / f"layout-preview.{extension}", dpi=180, facecolor="white", pad_inches=.18)
plt.close(fig)
