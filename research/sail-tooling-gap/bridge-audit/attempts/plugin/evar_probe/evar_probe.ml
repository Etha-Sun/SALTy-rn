open Proofview.Notations
module Seen = Hashtbl.Make(struct
  type t = Constr.t
  let equal a b = a == b
  let hash = Hashtbl.hash
end)
let probe () =
  Proofview.tclEVARMAP >>= fun sigma ->
  let out = open_out "logs/evar-graph.tsv" in
  output_string out "evar\tnodes\tdependencies\n";
  let total = ref 0 in
  let processed = ref 0 in
  Evd.fold (fun k (Evd.EvarInfo info) () ->
    match Evd.evar_body info with
    | Evd.Evar_empty -> ()
    | Evd.Evar_defined body ->
      incr processed;
      Printf.fprintf out "%d\t" (Evar.repr k); flush out;
      let seen = Seen.create 127 in
      let visited = ref 0 in
      let dependencies = ref Evar.Set.empty in
      let rec walk c =
        incr visited;
        if !visited > 100000 then raise Exit;
        if true then begin
          (match Constr.kind c with
          | Constr.Evar (v, _) -> dependencies := Evar.Set.add v !dependencies
          | _ -> ());
          Constr.iter walk c
        end
      in
      (try walk (EConstr.Unsafe.to_constr body) with Exit -> ());
      let count = !visited in total := !total + count;
      Printf.fprintf out "%d\t%s\n" count
        (String.concat "," (List.map (fun v -> string_of_int (Evar.repr v)) (Evar.Set.elements !dependencies))); flush out
  ) sigma ();
  close_out out;
  Feedback.msg_notice (Pp.str (Printf.sprintf "EVAR GRAPH: %d raw body nodes" !total));
  Proofview.tclUNIT ()
let () = Ltac_plugin.Tacentries.ml_tactic_extend
  ~plugin:"evar_probe.plugin" ~name:"dump_evar_graph" ~local:false
  Ltac_plugin.Tacentries.MLTyNil (probe ())

(* Construction-only experiment: normalize solved metavariable bodies in
   dependency order. The kernel still checks the resulting proof at Qed. *)
let memo_evar_bodies () =
  Proofview.tclEVARMAP >>= fun sigma ->
  let current = ref sigma in
  let finished = ref Evar.Set.empty in
  let visiting = ref Evar.Set.empty in
  let count = ref 0 in
  let rec visit k =
    if not (Evar.Set.mem k !finished) then begin
      if Evar.Set.mem k !visiting then () else begin
        visiting := Evar.Set.add k !visiting;
        (match Evd.find_defined !current k with
        | None -> ()
        | Some info ->
          let body = match Evd.evar_body info with Evd.Evar_defined b -> b in
          let rec deps c =
            (match Constr.kind c with Constr.Evar (d,_) -> visit d | _ -> ());
            Constr.iter deps c
          in
          deps (EConstr.Unsafe.to_constr body);
          let reduced = Evarutil.nf_evar !current body in
          let info' = Evd.map_evar_info
            (fun t -> if t == body then reduced else t) info in
          current := Evd.add !current k info';
          incr count;
          if !count mod 1000 = 0 then
            Feedback.msg_notice (Pp.str (Printf.sprintf "MEMO EVARS: %d" !count)));
        visiting := Evar.Set.remove k !visiting;
        finished := Evar.Set.add k !finished
      end
    end
  in
  Evd.fold (fun k _ () -> visit k) sigma ();
  Feedback.msg_notice (Pp.str (Printf.sprintf "MEMO EVARS DONE: %d" !count));
  Proofview.Unsafe.tclEVARS !current
let () = Ltac_plugin.Tacentries.ml_tactic_extend
  ~plugin:"evar_probe.plugin" ~name:"memo_evar_bodies" ~local:false
  Ltac_plugin.Tacentries.MLTyNil (memo_evar_bodies ())
