let () =
 Printf.printf "OCaml=%s int_size=%d word_size=%d\n" Sys.ocaml_version Sys.int_size Sys.word_size;
 List.iter (fun k -> let old = 1 lsl k in let exact = Z.shift_left Z.one k in Printf.printf "k=%d old=%d exact=%s equal=%b\n" k old (Z.to_string exact) (Z.equal (Z.of_int old) exact)) [0;31;32;61;62;63]
