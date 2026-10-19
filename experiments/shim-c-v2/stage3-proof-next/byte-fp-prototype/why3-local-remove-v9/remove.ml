(* Proof-task weakening only: never edits a goal, memory premise or definition.
   The exact four already-proved support premises are optional, not semantics. *)
open Why3
let names = ["checked_decodeencode32"; "checked_encoderange32";
             "checked_decodeencode64"; "checked_encoderange64"]
let transform = Trans.decl (fun d ->
  match d.Decl.d_node with
  | Decl.Dprop (Decl.Paxiom, pr, _) when List.mem pr.Decl.pr_name.Ident.id_string names -> []
  | _ -> [d]) None
let () = Trans.register_transform ~desc:"Remove exactly four optional proved codec facts; keep goal and all other declarations unchanged" "local_codec_remove_only_v9" transform
