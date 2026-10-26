from pathlib import Path
import json,re,hashlib
C=Path(__file__).resolve().parents[1];P=C/'proof';Q=P/'coq';g=Q/'neon_pixel_unit_goal.v';s=g.read_text();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();fs=re.findall(r'^Axiom proof_of_(\w+)',s,re.M);items=[]
for i,f in enumerate(fs):
 if '_entail_'in f or'_return_'in f:continue
 m=re.search(r'^Definition '+re.escape(f)+r' := (.*?)(?=\nDefinition |\nModule Type )',s,re.M|re.S);t=m[1]
 if f.endswith('_pure'):body='left;hc_pixel_prepare;hc_pixel_frame.'if'\\/'in t else'hc_pixel_prepare;hc_pixel_frame.'
 elif re.match(r'\s*\w+_pure -> \w+_aux',t):body='intros Hpure;unfold HwcConv.neon_pixel_unit_goal.'+f+'_aux;hc_pixel_prepare;hc_pixel_frame.'
 else:body='hc_pixel_prepare;hc_pixel_frame.'
 n='NeonPixelCall'+str(i).zfill(3);out='From HwcConv Require Import NeonPixelCallsTactics.\nImport Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.\nLemma proof_of_'+f+':HwcConv.neon_pixel_unit_goal.'+f+'.\nProof. unfold HwcConv.neon_pixel_unit_goal.'+f+'.\n'+body+'\nQed.\nPrint Assumptions proof_of_'+f+'.\n';p=Q/(n+'.v')
 if not p.exists()or p.read_text()!=out:p.write_text(out)
 items.append({'module':n,'field':f,'goal_FQ':'HwcConv.neon_pixel_unit_goal.'+f,'source_sha256':sha(p)})
assert len(items)==379
out='From HwcConv Require Import neon_pixel_unit_goal '+' '.join(x['module']for x in items)+'.\nModule CheckedCalls.\n'
for x in items:out+='Definition proof_of_'+x['field']+':'+x['goal_FQ']+':=HwcConv.'+x['module']+'.proof_of_'+x['field']+'.\n'
out+='Record AllCallingFields:Prop:=makeAllCallingFields{\n'+';\n'.join(' checked_'+x['field']+':'+x['goal_FQ']for x in items)+'\n}.\nDefinition exact_calling_interface:AllCallingFields:={|\n'+';\n'.join(' checked_'+x['field']+':=proof_of_'+x['field']for x in items)+'\n|}.\nDefinition second_exact_calling_interface:AllCallingFields:=exact_calling_interface.\nEnd CheckedCalls.\n'
for x in items:out+='Print Assumptions HwcConv.NeonPixelCallsChecked.CheckedCalls.proof_of_'+x['field']+'.\n'
(Q/'NeonPixelCallsChecked.v').write_text(out);d={'whole_kernel_verified':False,'component_complete':False,'scope':'379 exact actual calling/safety fields; full396 helper requires separate16 stages+1return and full VC_Correct','goal_sha256':sha(g),'fields':items,'actual_C_fields':379,'aggregate':'HwcConv.NeonPixelCallsChecked.CheckedCalls','all_source_sha256':{str((Q/(x['module']+'.v')).relative_to(C)):sha(Q/(x['module']+'.v'))for x in items}};(P/'neon-pixel-caller-partition.json').write_text(json.dumps(d,indent=2)+'\n');print('exact379 public callers and typed379-record aggregate written')
