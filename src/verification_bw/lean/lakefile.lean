import Lake
open Lake DSL

package SALT where
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib SALT where
  srcDir := "."
