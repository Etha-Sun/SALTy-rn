"""Paper-sized figures. Explanatory text belongs in manuscript captions.

Only performance-synthetic reads invented values, from a separate labeled CSV.
"""
from pathlib import Path
import csv
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'figures'
OUT.mkdir(exist_ok=True)
plt.rcParams.update({'font.family':'DejaVu Serif', 'font.size':8,
    'axes.labelsize':8, 'xtick.labelsize':6.5, 'ytick.labelsize':7,
    'axes.spines.top':False, 'axes.spines.right':False,
    'axes.linewidth':.6, 'pdf.fonttype':42, 'ps.fonttype':42,
    'svg.fonttype':'none', 'hatch.linewidth':.45, 'text.usetex':False})
INK, BLUE, LIGHT = '#30363A', '#5E7E8E', '#F3F5F6'
catalog = []
def save(fig, name, data):
    for ext in ['pdf','svg','png']:
        fig.savefig(OUT/f'{name}.{ext}', dpi=300, bbox_inches='tight', pad_inches=.025, facecolor='white')
    plt.close(fig)
    catalog.append({'name':name,'surface_class':'paper_main' if data=='none' else 'internal_review',
                    'data_kind':data,'script':'scripts/render_figures.py',
                    'caption_location':['paper.en.md','paper.zh-CN.md'],
                    'exports':[f'figures/{name}.{e}' for e in ['pdf','svg','png']]})
def box(ax,x,y,w,h,text,fill='white',fs=8):
    ax.add_patch(Rectangle((x,y),w,h,facecolor=fill,edgecolor=INK,lw=.65))
    ax.text(x+w/2,y+h/2,text,ha='center',va='center',fontsize=fs,linespacing=1.35,color=INK)
def arrow(ax,a,b):
    ax.annotate('',xy=b,xytext=a,arrowprops={'arrowstyle':'->','lw':.7,'color':INK,'shrinkA':2,'shrinkB':2})

fig,ax=plt.subplots(figsize=(7.0,2.65))
ax.set(xlim=(0,10),ylim=(0,4)); ax.axis('off')
box(ax,.10,3.1,2.15,.75,'NEON source $A$')
box(ax,3.25,3.1,3.45,.75,'SALTyRN + Autocomp\ntranslation and optimization\nwith bounded checks',LIGHT,7)
box(ax,7.75,3.1,2.15,.75,'Final RVV $B_{opt}$')
arrow(ax,(2.25,3.48),(3.25,3.48));arrow(ax,(6.7,3.48),(7.75,3.48))
ax.add_patch(Rectangle((.1,.86),9.8,1.68,facecolor='white',edgecolor=INK,lw=.75))
ax.text(.25,2.29,'Vekto',fontsize=9,fontweight='bold')
box(ax,.30,1.14,2.75,.82,'Specification\ncaller domain\noutput relation',LIGHT,7.5)
box(ax,3.62,1.14,2.75,.82,'Implementation\nsource, target, helpers',LIGHT,7.5)
box(ax,6.95,1.14,2.75,.82,'Proof\ninvariants\nintrinsic contracts',LIGHT,7.5)
arrow(ax,(6.37,1.55),(6.95,1.55))
ax.plot([1.68,1.68,8.33],[1.14,.99,.99],color=INK,lw=.6)
arrow(ax,(8.33,.99),(8.33,1.14))
arrow(ax,(1.18,3.1),(1.18,2.55));arrow(ax,(8.83,3.1),(8.83,2.55))
arrow(ax,(5,.86),(5,.47))
ax.text(5,.25,'Equivalence under the stated contract  /  counterexample  /  unresolved',ha='center',va='center',fontsize=8)
save(fig,'framework','none')

fig,ax=plt.subplots(figsize=(7.0,1.55))
ax.set(xlim=(0,10),ylim=(0,2));ax.axis('off')
box(ax,.05,.8,1.45,.65,'row\nmaximum')
box(ax,2.22,.8,3.1,.65,'exponentials + sum',LIGHT)
box(ax,6.05,.8,1.7,.65,'reciprocal')
box(ax,8.48,.8,1.47,.65,'scaling')
arrow(ax,(1.5,1.12),(2.22,1.12));arrow(ax,(5.32,1.12),(6.05,1.12));arrow(ax,(7.75,1.12),(8.48,1.12))
ax.text(1.87,1.45,'max',ha='center',fontsize=7)
ax.text(5.69,1.45,'sum',ha='center',fontsize=7)
ax.text(8.11,1.45,'1 / sum',ha='center',fontsize=7)
ax.plot([3.77,3.77,9.22],[.8,.3,.3],color=INK,lw=.7)
arrow(ax,(9.22,.3),(9.22,.8))
ax.text(6.4,.38,'intermediate output array',ha='center',fontsize=7)
save(fig,'softmax','none')

with (ROOT/'data/performance-synthetic.csv').open() as f:
    rows=list(csv.DictReader(f))
assert len(rows)==35 and all(r['data_kind']=='synthetic' for r in rows)
fig,axes=plt.subplots(2,1,figsize=(7.0,3.45))
fig.subplots_adjust(left=.075,right=.995,bottom=.14,top=.87,hspace=.38)
for ax, indices in zip(axes,np.array_split(np.arange(35),2)):
    x=np.arange(len(indices))
    a=[float(rows[i]['optimized_speedup']) for i in indices]
    b=[float(rows[i]['admitted_speedup']) if rows[i]['admitted_speedup'] else np.nan for i in indices]
    ax.bar(x-.19,a,.36,color='#B8C0C5',edgecolor='white',lw=.35,label='Final optimized RVV')
    ax.bar(x+.19,b,.36,color=BLUE,hatch='///',edgecolor='white',lw=.35,label='Accepted RVV')
    for j,v in enumerate(b):
        if np.isnan(v): ax.plot(j+.19,.12,marker='x',color=INK,ms=3,mew=.6)
    ax.axhline(1,color=INK,lw=.65,ls='--')
    ax.set_ylim(0,4.2);ax.set_yticks([0,1,2,3,4]);ax.set_ylabel('Speedup (×)')
    ax.set_xlim(-.65,len(indices)-.35)
    ax.set_xticks(x,[rows[i]['slot'] for i in indices])
    ax.tick_params(length=2.5,width=.55)
    ax.yaxis.grid(True,color='#E6E6E6',lw=.4);ax.set_axisbelow(True)
axes[0].legend(loc='lower center',bbox_to_anchor=(.5,1.03),ncol=2,frameon=False,fontsize=8)
axes[-1].set_xlabel('Illustrative kernel slots')
save(fig,'performance-synthetic','synthetic')
(OUT/'figure_catalog.json').write_text(json.dumps(catalog,indent=2)+'\n')
print('Rendered three caption-free figures (PDF, SVG, PNG).')
