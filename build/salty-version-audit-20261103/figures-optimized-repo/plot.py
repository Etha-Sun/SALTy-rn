"""Adapted grouped/hatch paper-plot style; only completed existing RTL data."""
import csv,json,hashlib,os,re
from pathlib import Path
os.environ.setdefault('MPLCONFIGDIR','/tmp/salty-repo-plot-mplconfig')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.font_manager import FontProperties
import numpy as np

HERE=Path(__file__).resolve().parent
ROOT=HERE.parent
style=Path('/home/ycsun/.codex/skills/deepscientist-figure-polish/assets/deepscientist-academic.mplstyle').read_text()
style=re.sub(r': (#[0-9A-Fa-f]{6})',r': "\1"',style)
(HERE/'academic.mplstyle').write_text(style)
plt.style.use(HERE/'academic.mplstyle')
FONT='/usr/share/fonts/truetype/arphic/uming.ttc'
plt.rcParams.update({'font.family':FontProperties(fname=FONT).get_name(),'font.size':11,'axes.unicode_minus':False,'hatch.linewidth':0.7})
rows=list(csv.DictReader((ROOT/'comparison.csv').open()))
lookup={(r['kernel'],r['shape'].split('-')[0]):r for r in rows}
spec=[('f32-vmulc','author','VMULC · 1024'),('x32-transposec','0','Transpose · 128²'),('x32-transposec','1','Transpose · 256²'),('f32-gemm-minmax','0','FP32 GEMM · M1/K512/N512'),('f32-dwconv2d-chw','0','DWConv · 7×7'),('f32-dwconv2d-chw','1','DWConv · 12×8'),('f32-dwconv2d-chw','3','DWConv · 28×28')]
data=[]
for k,i,label in spec:
 r=lookup[(k,i)];c=int(r['optimized_cycles'])
 a=int(r['initial_cycles']) if r['initial_cycles'] else None
 d=int(r['manual_cycles']) if r['manual_cycles'] else None
 data.append({'label':label,'initial_cycles':a,'optimized_cycles':c,'manual_cycles':d,'initial_over_repo':a/c if a else None,'manual_over_repo':d/c if d else None,'profile':r['shape'],'initial_role':'B (public initial; current A timed out)' if k=='f32-gemm-minmax' else 'A (=B) if measured','source':str(ROOT/'comparison.csv')})
fig,ax=plt.subplots(figsize=(10.5,6.9))
fig.subplots_adjust(left=.33,right=.97,top=.80,bottom=.30)
y=np.arange(len(data));width=.30
colors=['#8E9DAE','#668E83']
for idx,key in enumerate(['initial_over_repo','manual_over_repo']):
 for j,r in enumerate(data):
  yy=j+(-.17 if idx==0 else .17);v=r[key]
  if v is None:
   ax.text(.04,yy,'未测成',va='center',color='#8A8A8A',fontsize=9)
  else:
   ax.barh(yy,v,height=width,color=colors[idx],hatch='' if idx==0 else '///',edgecolor='white',linewidth=.6,zorder=3)
   ax.text(v+.035,yy,f'{v:.3f}×',va='center',fontsize=10,color='#334155')
ax.axvline(1,color='#4B5563',linestyle='--',linewidth=1.0,zorder=2)
ax.set_yticks(y,[r['label'] for r in data]);ax.invert_yaxis();ax.set_xlim(0,2.6)
ax.set_xticks([0,.5,1,1.5,2,2.5]);ax.set_xlabel('比较版本 cycles ÷ 本仓库优化版 cycles（>1 表示本仓库更快）',labelpad=10)
ax.yaxis.grid(False);ax.xaxis.grid(True,color='#E7E5E4',linewidth=.65);ax.tick_params(axis='y',length=0,pad=10)
fig.text(.04,.95,'公开优化仓库的实际性能对比',fontsize=19,color='#243746')
fig.text(.04,.90,'Saturn / Shuttle RTL · VLEN512 / DLEN256 · 复用已完成的周期实测',fontsize=11,color='#596675')
fig.legend(handles=[patches.Patch(facecolor=colors[0],label='target / 公开初稿（GEMM 使用 B）'),patches.Patch(facecolor=colors[1],hatch='///',edgecolor='white',label='XNNPACK 手写候选')],loc='upper left',bbox_to_anchor=(.33,.87),ncol=1,frameon=False,fontsize=10)
fig.text(.04,.158,'GEMM：公开初稿 806,987 → 仓库优化版 392,640 cycles（2.055×）；当前本地修复 A 超时。',fontsize=10,color='#485563')
fig.text(.04,.120,'同一行同编译器/输入/协议；VMULC、GEMM 用 GCC15.2，Transpose、DWConv 用 Clang20.1.2。',fontsize=9,color='#66717D')
fig.text(.04,.087,'Transpose/GEMM/DWConv 无候选预热；VMULC 取三次最小。未做缓存清空；小幅差异无显著性结论。',fontsize=9,color='#66717D')
fig.text(.04,.054,'缺失不画成零：Transpose 512² 超时；DWConv 14×14 的优化版、256×256 的手写版超时。',fontsize=9,color='#66717D')
fig.text(.04,.021,'本仓库没有 Exp。图中为提交 597c1d2 的公开文件，未确认与论文图 14 的出图文件完全相同。',fontsize=9,color='#66717D')
for ext in ['png','svg','pdf']:
 fig.savefig(HERE/('optimized-repo-performance.'+ext),dpi=300,facecolor='white')
plt.close(fig)
(HERE/'plot-data.json').write_text(json.dumps(data,indent=2,ensure_ascii=False)+'\n')
print('Rendered',HERE/'optimized-repo-performance.png')
