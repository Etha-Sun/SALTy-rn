(* Diagnostic stack sampling only; no proof-state or kernel changes. *)
open Proofview.Notations
let start () =
  Proofview.tclEVARMAP >>= fun _ ->
  let started = Unix.gettimeofday () in
  let samples = ref 0 in
  Sys.set_signal Sys.sigalrm (Sys.Signal_handle (fun _ ->
    let stack = Printexc.get_callstack 96 in
    incr samples;
    let out = open_out_gen [Open_creat; Open_append; Open_text] 0o644 "logs/qed-stack.log" in
    Printf.fprintf out "\nSAMPLE %d elapsed %.3f\n%s\n" !samples
      (Unix.gettimeofday () -. started) (Printexc.raw_backtrace_to_string stack);
    close_out out));
  ignore (Unix.setitimer Unix.ITIMER_REAL {Unix.it_interval=30.; it_value=30.});
  Proofview.tclUNIT ()
let () = Ltac_plugin.Tacentries.ml_tactic_extend
  ~plugin:"qed_profile.plugin" ~name:"start_qed_profile" ~local:false
  Ltac_plugin.Tacentries.MLTyNil (start ())
