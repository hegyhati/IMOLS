set Bands;
set Festivals;

param performs{Bands,Festivals};

var go{Festivals};

s.t. ListenToAllBandsAtLeastOnce {b in Bands}:
  sum{f in Festivals} performs[b,f] * go[f] >= 1;

minimize FestivalsWentTo:
  sum{f in Festivals} go[f];
