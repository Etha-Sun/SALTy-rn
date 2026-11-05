"""Three-version absolute-cycle panels for new simple-kernel RTL results."""
import json,os,hashlib
from pathlib import Path
os.environ.setdefault('MPLCONFIGDIR','/tmp/salty-simple-kernels-mplconfig')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
from matplotlib.ticker import MaxNLocator,FuncFormatter
from bench_simple import HERE,KERNELS,SIZES,sizes_for,write

plt.style.use(HERE.parent/'figures-optimized-repo/academic.mplstyle')
plt.rcParams.update({'font.family':FontProperties(fname='/usr/share/fonts/truetype/arphic/uming.ttc').get_name(),'font.size':11,'axes.unicode_minus':False})
rows=json.loads((HERE/'comparison.json').read_text())
roles=['D-xnnpack-u8v','C-public','A-target']
keys=['xnnpack_cycles','optimized_cycles','target_cycles']
colors=['#6F9388','#7893AE','#B7B5B1']
names={'f32-vlrelu':'Leaky ReLU'}
exports=[]
for slot in [0,1]:
 fig,axes=plt.subplots(2,4,figsize=(14,7.2));fig.subplots_adjust(left=.055,right=.985,bottom=.22,top=.80,wspace=.32,hspace=.55)
 for ax,k in zip(axes.flat,KERNELS):
  n=sizes_for(k)[slot]
  r=next(r for r in rows if r['kernel']==k and r['n']==n);vals=[r[z] for z in keys];good=[x for x in vals if x]
  ax.set_ylim(0,max(good)*1.24 if good else 1)
  for x,(value,color,role) in enumerate(zip(vals,colors,roles)):
   if value is None:ax.text(x,.12*ax.get_ylim()[1],'未完成',ha='center',fontsize=10,color='#8A8A8A')
   else:
    ax.bar(x,value,width=.63,color=color,edgecolor='white',linewidth=.8,zorder=3)
    ax.annotate(f'{value:,}',(x,value),xytext=(0,5),textcoords='offset points',ha='center',va='bottom',fontsize=11,color='#334155')
  ax.set_xticks([0,1,2],['XNNPACK','Optimized','target'],fontsize=10);ax.tick_params(axis='x',length=0,pad=6)
  ax.set_title(names.get(k,k.removeprefix('f32-').upper())+f' · N={n}',fontsize=13,pad=13)
  ax.yaxis.set_major_locator(MaxNLocator(4));ax.xaxis.grid(False);ax.yaxis.grid(True,color='#E7E5E4',linewidth=.65)
  if good and max(good)>10000:ax.yaxis.set_major_formatter(FuncFormatter(lambda v,pos:f'{v/1000:g}k' if v else '0'))
 fig.text(.035,.953,'新增 8 类简单 kernel · '+('主尺寸' if slot==0 else '含尾部尺寸'),fontsize=21,color='#243746')
 fig.text(.035,.894,'绿色：XNNPACK u8v 手写候选  /  蓝色：公开优化 C  /  灰色：target A（修复前）',fontsize=12,color='#596675')
 fig.text(.035,.848,'柱顶为实际目标 cycles，越低越快；各面板纵轴从零起、独立缩放。',fontsize=11,color='#596675')
 fig.text(.035,.151,'统一 GCC15.2 / O3 · Shuttle + Saturn RTL · VLEN512 / DLEN256 · 相同输入和调用参数',fontsize=11,color='#485563')
 fig.text(.035,.108,'VDIV/VSQRT 预热 1 次，其余预热 5 次；均计时 3 次取最小；每次逐位检查输出及 canary。原始三次周期另存，没有 cache flush。',fontsize=10,color='#66717D')
 fig.text(.035,.065,'仅测试共同有限输入域；除数为正、sqrt 输入非负。小幅差异不作显著性结论；不是新的形式证明。',fontsize=10,color='#66717D')
 fig.text(.035,.022,'VMIN/VMAX 冻结修复版 E 另有实测；其余六个 E 与 A 源码一致，不另行重复运行。',fontsize=10,color='#66717D')
 for ext in ['png','pdf','svg']:
  p=HERE/('simple-kernels-'+('main' if slot==0 else 'tail')+'.'+ext);fig.savefig(p,dpi=300,facecolor='white');exports.append(str(p))
 plt.close(fig)
write(HERE/'figure_catalog.json',dict(surface_class='connector_milestone',source=str(HERE/'comparison.json'),script=str(HERE/'plot.py'),exports=exports,claim='Only these new local RTL measurements; each panel has identical compiler/input/protocol across three candidates. Missing cases not plotted as zero.',inspection='pending render inspection',data_sha256=hashlib.sha256((HERE/'comparison.json').read_bytes()).hexdigest()))
print('Rendered',len(exports),'exports')
