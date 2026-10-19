(* Read-only WPO metadata observer. Never resolves or computes a proof goal. *)
let path = Sys.getenv "WP_OBSERVER_JSONL"
let channel = open_out_gen [Open_wronly; Open_creat; Open_excl; Open_text] 0o600 path
let emit json =
  output_string channel (String.trim (Json.save_string ~pretty:false json));
  output_char channel '\n';
  flush channel
let record event g =
  let property = Wp.Wpo.get_target g in
  let source = fst (Property.location property) in
  let index = match Wp.Wpo.get_index g with
    | Wp.Wpo.Axiomatic None -> []
    | Wp.Wpo.Axiomatic (Some name) -> ["axiomatic", `String name]
    | Wp.Wpo.Function (kf,bhv) ->
      ["function", `String (Kernel_function.get_name kf)] @
      (match bhv with None -> [] | Some name -> ["behavior", `String name])
  in
  let results = List.map
      (fun (prover,(result:Wp.VCS.result)) ->
         `Assoc ["prover", `String (Wp.Prover.ident prover);
                 "verdict", `String (Wp.VCS.name_of_verdict result.verdict)])
      (Wp.Wpo.get_results g)
  in
  emit (`Assoc (["event", `String event;
                 "goal", `String (Wp.Wpo.get_gid g);
                 "property", `String (Property.Names.get_prop_name_id property);
                 "file", `String (Filepath.to_string_abs (Filepos.path source));
                 "line", `Int (Filepos.line source);
                 "results", `List results;
                 "smoke", `Bool (Wp.Wpo.is_smoke_test g);
                 "trivial", `Bool (Wp.Wpo.is_trivial g)] @ index))
let () = Wp.Wpo.add_modified_hook (record "modified")
let finish () =
  let count = ref 0 in
  Wp.Wpo.iter_on_goals (fun g -> incr count; record "final" g);
  emit (`Assoc ["event", `String "normal_exit"; "goal_count", `Int !count]);
  close_out channel
let () = Boot.Main.extend finish
