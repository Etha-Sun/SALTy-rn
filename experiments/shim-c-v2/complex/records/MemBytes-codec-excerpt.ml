module CODEC_FLOAT = WpContext.Generator(Float)
    (struct
      let name = "MemBytes.LOAD_FLOAT"
      type key = Float.t
      type data = Lang.lfun * Lang.lfun

      let decode ft =
        let result = Cfloat.tau_of_float ft in
        let f = Lang.freshvar ~basename:"f" Lang.t_int in
        let decode =
          Lang.generated_f ~result "int_to_%a" Float.pretty ft in
        Definitions.define_symbol {
          d_lfun = decode ;
          d_cluster = float_cluster () ; d_types = 0 ;
          d_params = [ f ] ;
          d_definition = Logic result ;
        } ;
        decode

      let encode ft =
        let result = Lang.t_int in
        let f = Lang.freshvar ~basename:"f" @@ Cfloat.tau_of_float ft in
        let encode =
          Lang.generated_f ~result "%a_to_int" Float.pretty ft in
        Definitions.define_symbol {
          d_lfun = encode ;
          d_cluster = float_cluster () ; d_types = 0 ;
          d_params = [ f ] ;
          d_definition = Logic result ;
        } ;
        encode

      let add_decode_encode ft encode decode =
        let f = Lang.freshvar ~basename:"f" @@ Cfloat.tau_of_float ft in
        let tf = e_var f in
        let name = Format.asprintf "decode_encode_%a" Float.pretty ft in
        let lemma =
          p_equal tf (e_fun decode [e_fun encode [tf]]) in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ;
          l_triggers = [] ;
          l_forall = [f] ;
          l_cluster = float_cluster () ;
          l_lemma = lemma
        }

      let add_encode_decode ft encode decode =
        let i = Lang.freshvar ~basename:"i" Lang.t_int in
        let ti = e_var i in
        let name = Format.asprintf "encode_decode_%a" Float.pretty ft in
        let lemma =
          p_equal ti (e_fun encode [e_fun decode [ti]]) in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ;
          l_triggers = [] ;
          l_forall = [i] ;
          l_cluster = float_cluster () ;
          l_lemma = lemma
        }

      let add_encode_bounds ft encode =
        let f = Lang.freshvar ~basename:"f" @@ Cfloat.tau_of_float ft in
        let tf = e_var f in
        let name = Format.asprintf "encode_bounds_%a" Float.pretty ft in
        let lemma = Cint.range (Float.ikind ft) @@ e_fun encode [ tf ] in
        Definitions.define_lemma {
          l_kind = Admit ;
          l_name = name ;
          l_triggers = [] ;
          l_forall = [f] ;
          l_cluster = float_cluster () ;
          l_lemma = lemma
        }

      let compile ft =
        let encode = encode ft in
        let decode = decode ft in
        add_encode_decode ft encode decode ;
        add_decode_encode ft encode decode ;
        add_encode_bounds ft encode ;
        encode, decode
    end)

let float_to_int fkind f =
  e_fun (fst @@ CODEC_FLOAT.get fkind) [ f ]
