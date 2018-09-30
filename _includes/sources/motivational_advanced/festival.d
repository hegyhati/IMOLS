set Bands :=
  Haggard
  Stratovarius
  Epica
  Dalriada
  Apocalyptica
  Liva
  Eluveitie
  ;

set Festivals := F1 F2 F3 F4 F5;

param performs:
                  F1  F2  F3  F4  F5 :=
    Haggard       1   0   1   1   0
    Stratovarius  1   1   1   0   1
    Epica         1   1   0   1   1
    Dalriada      0   0   1   0   1
    Apocalyptica  0   0   0   1   0
    Liva          0   1   1   1   1
    Eluveitie     0   0   1   0   1
    ;
