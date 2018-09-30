set FroccsTypes :=
  kisfroccs
  nagyfroccs
  hosszulepes
  hazmester
  vicehazmester
  krudyfroccs
  soherfroccs
  puskasfroccs
  ;

param price :=
  kisfroccs     110
  nagyfroccs    200
  hosszulepes   120
  hazmester     260
  vicehazmester 200
  krudyfroccs   800
  soherfroccs   200
  puskasfroccs  550
  ;
  

param soda_stock := 1500;
param wine_stock := 1000;

param soda_content :=
  kisfroccs     1
  nagyfroccs    1
  hosszulepes   2
  hazmester     2
  vicehazmester 3
  krudyfroccs   1
  soherfroccs   9
  puskasfroccs  3
  ;

  
param wine_content :=
  kisfroccs     1
  nagyfroccs    2
  hosszulepes   1
  hazmester     3
  vicehazmester 2
  krudyfroccs   9
  soherfroccs   1
  puskasfroccs  6
  ;
