from pathlib import Path
import shutil,difflib,json,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
old=HERE.parent/'environment-recovery-local/.build/source/frama-c-33.0-Arsenic'
new=HERE/'.build/source';new.parent.mkdir(exist_ok=True)
shutil.copytree(old,new,ignore=shutil.ignore_patterns('_build','.git'),symlinks=True)
p=new/'src/plugins/wp/CodeSemantics.ml';before=p.read_text()
a='''  let exp_unop env typ unop e =
    let v =
      match Ctypes.object_of typ , unop with'''
b='''  let exp_unop env typ unop e =
    (* Logical negation has an integer result even for pointer/float operands.
       Select its semantics from the operand type; arithmetic unary operators
       retain the C expression result type (including integer promotions). *)
    let operation_typ = if unop = LNot then Cil.typeOf e else typ in
    let v =
      match Ctypes.object_of operation_typ , unop with'''
assert before.count(a)==1;after=before.replace(a,b)
a='''      | C_float _ , LNot -> Cvalues.bool_eq (val_of_exp env e) F.e_zero_real'''
b='''      | C_float f , LNot ->
        Cvalues.is_true
          (Cfloat.feq f (val_of_exp env e)
             (Cfloat.float_of_real f F.e_zero_real))'''
assert after.count(a)==1;after=after.replace(a,b);p.write_text(after)
(HERE/'logical-not.patch').write_text(''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='a/src/plugins/wp/CodeSemantics.ml',tofile='b/src/plugins/wp/CodeSemantics.ml')))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
(HERE/'source-provenance.json').write_text(json.dumps({'base_head':'3b96d1a','old_source':str(old),'base_code_semantics_sha256':sha(old/'src/plugins/wp/CodeSemantics.ml'),'new_code_semantics_sha256':sha(p),'patch_sha256':sha(HERE/'logical-not.patch'),'status':'independent build candidate; unqualified'},indent=2)+'\n')
