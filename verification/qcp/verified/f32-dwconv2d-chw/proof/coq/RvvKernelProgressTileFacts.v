From Coq Require Import ZArith List Lia FunctionalExtensionality.
From DwChw Require Export RvvKernelWriteRowFacts.
Local Open Scope Z_scope.

(* The original kernels store row2, row1, row0.  Clipped last rows may alias;
   the lowest numbered row wins.  Both list values and every unwritten option
   value are kept exact, without any floating-point algebra. *)
Lemma dw_progress_write_tile:forall R O output H N y x n V0 V1 V2,
 0<N->0<=y<H->0<=x->0<=n->x+n<=N->
 Z.of_nat(length V0)=n->Z.of_nat(length V1)=n->Z.of_nat(length V2)=n->
 (forall i,0<=i<n->nth(Z.to_nat i)V0 fp32_zero=R(y*N+x+i))->
 (forall i,0<=i<n->nth(Z.to_nat i)V1 fp32_zero=R((y+1)*N+x+i))->
 (forall i,0<=i<n->nth(Z.to_nat i)V2 fp32_zero=R((y+2)*N+x+i))->
 dw_write_values
  (dw_write_values
   (dw_write_values(dw_progress R O output H N y x)
    (output+4*(dw_store_row H y 2*N+x))V2)
   (output+4*(dw_store_row H y 1*N+x))V1)
  (output+4*(dw_store_row H y 0*N+x))V0=
 dw_progress R O output H N y(x+n).
Proof.
 intros R O output H N y x n V0 V1 V2 HN Hy Hx Hn Hend HL0 HL1 HL2 HV0 HV1 HV2.
 assert(S0:dw_store_row H y 0=y).
 { unfold dw_store_row;rewrite Z.add_0_r;apply Z.min_l;lia. }
 assert(S1:y<=dw_store_row H y 1<Z.min H(y+3)).
 { split;[unfold dw_store_row;apply Z.min_glb;lia|apply dw_store_row_in_tile;assumption||lia]. }
 assert(S2:y<=dw_store_row H y 2<Z.min H(y+3)).
 { split;[unfold dw_store_row;apply Z.min_glb;lia|apply dw_store_row_in_tile;assumption||lia]. }
 pose proof(Z.le_min_l H(y+3))as HminH.
 pose proof(Z.le_min_r H(y+3))as HminY.
 apply functional_extensionality;intro q.
 destruct(andb(andb(output<=?q)(q<?output+4*H*N))(Z.eqb((q-output)mod 4)0))eqn:Einside.
 - apply Bool.andb_true_iff in Einside;destruct Einside as[Ebounds Ealign].
   apply Bool.andb_true_iff in Ebounds;destruct Ebounds as[Elo Ehi].
   apply Z.leb_le in Elo;apply Z.ltb_lt in Ehi;apply Z.eqb_eq in Ealign.
   pose proof(dw_output_index_split output H N q HN ltac:(lia)Ealign)as Hsplit.
   cbn zeta in Hsplit.
   set(k:=(q-output)/4)in *;set(r:=k/N)in *;set(c:=k mod N)in *.
   destruct Hsplit as[Hr[Hc Hq]];rewrite Hq.
   destruct(Z_lt_dec c x)as[Hbefore|Hbefore].
   + repeat rewrite dw_write_row_outside_columns with(n:=n)by(eauto;lia).
     rewrite !dw_progress_cell by assumption.
     assert(Ex:(c<?x)=true)by(apply Z.ltb_lt;lia).
     assert(Exn:(c<?x+n)=true)by(apply Z.ltb_lt;lia).
     rewrite Ex,Exn;reflexivity.
   + destruct(Z_le_dec(x+n)c)as[Hafter|Hafter].
     * repeat rewrite dw_write_row_outside_columns with(n:=n)by(eauto;lia).
       rewrite !dw_progress_cell by assumption.
       assert(Ex:(c<?x)=false)by(apply Z.ltb_ge;lia).
       assert(Exn:(c<?x+n)=false)by(apply Z.ltb_ge;lia).
       rewrite Ex,Exn;reflexivity.
     * assert(Hcol:x<=c<x+n)by lia.
       assert(Ex:(c<?x)=false)by(apply Z.ltb_ge;lia).
       assert(Exn:(c<?x+n)=true)by(apply Z.ltb_lt;lia).
       destruct(Z.ltb_spec r y)as[Hprev|Hprev].
       -- repeat rewrite dw_write_row_different with(n:=n)by(eauto;rewrite ?S0;lia).
          rewrite !dw_progress_cell by assumption.
          assert(Er:(r<?y)=true)by(apply Z.ltb_lt;lia).
          rewrite Er;reflexivity.
       -- assert(Er:(r<?y)=false)by(apply Z.ltb_ge;lia).
          destruct(Z.ltb_spec r(Z.min H(y+3)))as[Hcurrent|Hcurrent].
          ++ assert(Em:(r<?Z.min H(y+3))=true)by(apply Z.ltb_lt;lia).
             rewrite(dw_progress_cell R O output H N y(x+n)r c HN Hr Hc).
             rewrite Er,Em,Exn;cbn[orb andb].
             assert(Hrows:r=y \/ r=y+1 \/ r=y+2)by lia.
             destruct Hrows as[Heq|[Heq|Heq]];rewrite Heq.
             ** rewrite S0;rewrite dw_write_row_hit with(n:=n)by assumption.
                rewrite HV0 by lia;f_equal;f_equal;ring.
             ** assert(S1eq:dw_store_row H y 1=y+1).
                { unfold dw_store_row;apply Z.min_l;lia. }
                rewrite S0,S1eq.
                rewrite dw_write_row_different with(n:=n)by(eauto;lia).
                rewrite dw_write_row_hit with(n:=n)by assumption.
                rewrite HV1 by lia;f_equal;f_equal;ring.
             ** assert(S1eq:dw_store_row H y 1=y+1).
                { unfold dw_store_row;apply Z.min_l;lia. }
                assert(S2eq:dw_store_row H y 2=y+2).
                { unfold dw_store_row;apply Z.min_l;lia. }
                rewrite S0,S1eq,S2eq.
                repeat rewrite dw_write_row_different with(n:=n)by(eauto;lia).
                rewrite dw_write_row_hit with(n:=n)by assumption.
                rewrite HV2 by lia;f_equal;f_equal;ring.
          ++ repeat rewrite dw_write_row_different with(n:=n)by(eauto;rewrite ?S0;lia).
             rewrite !dw_progress_cell by assumption.
             assert(Em:(r<?Z.min H(y+3))=false)by(apply Z.ltb_ge;lia).
             rewrite Er,Em;reflexivity.
 - assert(Houtside:~(output<=q<output+4*H*N /\ (q-output)mod 4=0)).
   { intros[[Hlo Hhi]Ha].
     assert(Elo:(output<=?q)=true)by(apply Z.leb_le;lia).
     assert(Ehi:(q<?output+4*H*N)=true)by(apply Z.ltb_lt;lia).
     rewrite Elo,Ehi,Ha in Einside;discriminate. }
   repeat rewrite dw_write_row_outside_matrix with(H:=H)(n:=n)by(eauto;rewrite ?S0;lia).
   unfold dw_progress;rewrite Einside;reflexivity.
Qed.
Print Assumptions dw_progress_write_tile.
