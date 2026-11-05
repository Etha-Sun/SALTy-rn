"""Three source versions, existing RTL measurements only; independent zero-based axes."""
import json,os,hashlib,subprocess,csv,shutil
from pathlib import Path
os.environ.setdefault('MPLCONFIGDIR','/tmp/salty-three-versions-mplconfig')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
from matplotlib.ticker import FuncFormatter,MaxNLocator

HERE=Path(__file__).resolve().parent
BASE=HERE.parent
plt.style.use(BASE/'figures-optimized-repo/academic.mplstyle')
plt.rcParams.update({'font.family':FontProperties(fname='/usr/share/fonts/truetype/arphic/uming.ttc').get_name(),'font.size':11,'axes.unicode_minus':False})
rows=json.loads((BASE/'comparison.json').read_text())
sources=json.loads((BASE/'sources.json').read_text())
cat=json.loads(subprocess.check_output(['git','show','821969733:verification/qcp/catalog.json']))
original_hash={r['name']:r['files']['rvv']['sha256'] for r in cat['kernels']}
spec=[('f32-vmulc','author-ref3-avl0-aligned64','VMULC · 1024 个 FP32 元素','GCC15.2 · 三次取最小'),('x32-transposec','0-cold1-avl0-aligned64-clang-diagnostic','Transpose · 128²','Clang20.1.2 · 无候选预热，单次'),('x32-transposec','1-cold1-avl0-aligned64-clang-diagnostic','Transpose · 256²','Clang20.1.2 · 无候选预热，单次'),('f32-gemm-minmax','0-cold1-avl0-aligned64','FP32 GEMM · M1 / K512 / N512','GCC15.2 · 无候选预热，单次')]
manual={'f32-vmulc':'D-manual-u8v','x32-transposec':'D-manual-16x8','f32-gemm-minmax':'D-manual-nr64'}
labels=['XNNPACK\n手写候选','公开优化\n此仓库 C','target 原稿\n修复前 B']
colors=['#6F9388','#7893AE','#B7B5B1']
records=[]
fig,axes=plt.subplots(2,2,figsize=(11.2,8.6))
fig.subplots_adjust(left=.09,right=.98,bottom=.23,top=.81,wspace=.25,hspace=.58)
for ax,(k,s,title,protocol) in zip(axes.flat,spec):
 r=next(r for r in rows if r['kernel']==k and r['shape']==s)
 baseline=next(x for x in sources if x['kernel']==k and x['role']=='B-initial')
 assert baseline['sha256']==original_hash[k],(k,'not the pre-repair proof baseline')
 roles=[manual[k],'C-public','B-initial']
 vals=[r['manual_cycles'],r['optimized_cycles'],r['initial_cycles']]
 evidence=[]
 for role,value in zip(roles,vals):
  run=r['roles'][role];assert run['valid'] and run['cycles']==value and value>0
  p=Path(run['evidence']).parent;b=json.loads((p/'build.json').read_text());rr=json.loads((p/'result.json').read_text())
  assert rr['binary_sha256']==hashlib.sha256((p/'test.elf').read_bytes()).hexdigest()
  assert json.loads((p/'native.json').read_text())['valid']
  evidence.append({'role':role,'cycles':value,'result':run['evidence'],'compiler_sha256':b['compiler_sha256'],'elf_sha256':rr['binary_sha256']})
 assert len({e['compiler_sha256'] for e in evidence})==1
 bars=ax.bar([0,1,2],vals,width=.60,color=colors,edgecolor='white',linewidth=.8,zorder=3)
 ax.set_ylim(0,max(vals)*1.25)
 for bar,value in zip(bars,vals):
  ax.annotate(f'{value:,}',(bar.get_x()+bar.get_width()/2,value),xytext=(0,6),textcoords='offset points',ha='center',va='bottom',fontsize=12,color='#334155')
 ax.set_xticks([0,1,2],labels,fontsize=10);ax.tick_params(axis='x',length=0,pad=7)
 ax.set_ylabel('目标 cycles（越低越快）',fontsize=10)
 ax.yaxis.set_major_formatter(FuncFormatter(lambda v,pos:f'{v/1000:g}k' if max(vals)>10000 and v else f'{v:g}'))
 ax.yaxis.set_major_locator(MaxNLocator(4));ax.xaxis.grid(False);ax.yaxis.grid(True,linewidth=.65,color='#E7E5E4')
 ax.set_title(title+'\n'+protocol,fontsize=12,pad=18,color='#334155')
 records.append({'kernel':k,'profile':s,'title':title,'protocol':protocol,'source_original_matches_frozen_proof_catalog':True,'original_sha256':baseline['sha256'],'measurements':evidence,'initial_over_optimized':vals[2]/vals[1],'manual_over_optimized':vals[0]/vals[1]})
fig.text(.05,.965,'同一 kernel 的三份 RVV 实现：实际周期对比',fontsize=20,color='#243746')
fig.text(.05,.917,'Saturn / Shuttle · VLEN512 / DLEN256 · 各面板纵轴独立，柱顶为实际 cycles',fontsize=12,color='#596675')
fig.text(.05,.151,'target 柱为修复前 catalog 原稿 B；我们的形式证明绑定修复版 E，两者不能混称。',fontsize=11,color='#485563')
fig.text(.05,.116,'GEMM 原稿 B：806,987 cycles；当前本地修复 A 超时，未以 B 冒充 A。NR8 / NR64 packing 已核对。',fontsize=10,color='#596675')
fig.text(.05,.081,'每个面板三版共用编译器、输入、RTL 和计时协议；准备与检查在计时外。未做缓存清空；小差异无显著性结论。',fontsize=9,color='#66717D')
fig.text(.05,.048,'仅列三版均通过检查的点：此优化仓库缺 Exp；DWConv target 未测成；Transpose 512² 超时。',fontsize=10,color='#66717D')
fig.text(.05,.015,'复用已完成 RTL 实测，未启动新性能批次；此图不代表论文精确复现，也不证明公开优化源码正确。',fontsize=9,color='#66717D')
for ext in ['png','pdf','svg']:fig.savefig(HERE/('three-versions-cycles.'+ext),dpi=300,facecolor='white')
plt.close(fig)
(HERE/'plot-data.json').write_text(json.dumps(records,indent=2,ensure_ascii=False)+'\n')
with (HERE/'plot-data.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=['kernel','profile','role','cycles','result','elf_sha256']);w.writeheader()
 for r in records:
  for e in r['measurements']:w.writerow({**{k:r[k] for k in ['kernel','profile']},**{k:e[k] for k in ['role','cycles','result','elf_sha256']}})
print('Generated:',HERE/'three-versions-cycles.png')
