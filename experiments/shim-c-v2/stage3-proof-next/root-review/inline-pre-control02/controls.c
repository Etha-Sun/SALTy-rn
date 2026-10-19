void probe_pre(int x) { /*@ assert unchanged_pre: x == \at(x,Pre); */ }
void probe_label(int x) { /*@ ghost ProbeEntry: ; */ /*@ assert unchanged_label: x == \at(x,ProbeEntry); */ }
void probe_false(int x) { /*@ assert negative_false: \false; */ }
void caller(int x) { probe_pre(x); probe_label(x); probe_false(x); }
