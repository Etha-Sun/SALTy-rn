from pathlib import Path
import shutil,subprocess,difflib,json
R=Path(__file__).resolve().parent
repo=R.parents[2]; source=repo/'research/sol-pipeline-comparison-20261030/sources/SALTy-rn/src/verification_cvc5'
model=R/'diagnostic-model';shutil.copytree(source,model,dirs_exist_ok=True)
(R/'verification_bw').mkdir(exist_ok=True)
shutil.copyfile(source.parent/'verification_bw/xnn_minimal.h',R/'verification_bw/xnn_minimal.h')
p=model/'neon/ops/core.hpp';s=p.read_text()
needle='''        lanes[i] = store_fp32_as_bv(tm, res_fp);
    }
    return NeonVector<32, N>(tm, lanes);
}
inline float32x4_t vaddq_f32'''
replacement='''        if (op == Kind::FLOATINGPOINT_MAX || op == Kind::FLOATINGPOINT_MIN) {
            Term either_nan = tm.mkTerm(Kind::OR, {
                tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a_fp}),
                tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp})});
            res_fp = tm.mkTerm(Kind::ITE, {either_nan, tm.mkFloatingPointNaN(8, 24), res_fp});
        }
        lanes[i] = store_fp32_as_bv(tm, res_fp);
    }
    return NeonVector<32, N>(tm, lanes);
}
inline float32x4_t vaddq_f32'''
assert s.count(needle)==1
new=s.replace(needle,replacement);p.write_text(new)
(R/'diagnostic-neon-model.patch').write_text(''.join(difflib.unified_diff(s.splitlines(True),new.splitlines(True),fromfile='original/neon/ops/core.hpp',tofile='diagnostic/neon/ops/core.hpp')))
lib=repo/'research/sol-pipeline-comparison-20261030/tools/cvc5-Linux-x86_64-shared'
harness=R/'bounded-vmax/smt-build/harnesses/verify_f32-vmax.cpp'
cmd=['c++','-O2','-std=c++17','-fno-operator-names','-fpermissive','-I'+str(model),'-I'+str(lib/'include'),str(harness),'-L'+str(lib/'lib'),'-Wl,-rpath,'+str(lib/'lib'),'-lcvc5','-lpthread','-ldl','-lm','-o',str(R/'vmax-corrected-model.elf')]
p=subprocess.run(cmd,capture_output=True,text=True,timeout=60);(R/'diagnostic-compile.log').write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr
run=[str(R/'vmax-corrected-model.elf'),'1','1','512','20']
p=subprocess.run(run,capture_output=True,text=True,timeout=30);(R/'diagnostic-model.log').write_text(p.stdout+p.stderr)
(R/'diagnostic-model-result.json').write_text(json.dumps({'compile_command':cmd,'run_command':run,'returncode':p.returncode,'scope':'Only copied NEON min/max model changed; kernel and generated harness unchanged. Not full model validation.'},indent=2)+'\n')
print(p.stdout,p.stderr)
assert 'COUNTEREXAMPLE' in p.stdout
