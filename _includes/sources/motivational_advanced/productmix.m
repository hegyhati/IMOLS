set Products;
set Ingredients;

param price{Products};
param stock{Ingredients};
param content{Products,Ingredients};

var quantity{Products}>=0;

s.t. IngredientUsage{i in Ingredients}:
  sum{p in Products} quantity[p] * content[p,i] <= stock[i];

maximize Income:
  sum{p in Products} price[p] * quantity[p];

data;

set Products :=
  kisfroccs
  nagyfroccs
  hosszulepes
  hazmester
  vicehazmester
  krudyfroccs
  soherfroccs
  puskasfroccs
  ;

set Ingredients :=
  soda
  wine
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
  

param stock :=
  soda 1500
  wine 1000
  ;


param content :
                soda  wine  :=
  kisfroccs     1     1  
  nagyfroccs    1     2
  hosszulepes   2     1
  hazmester     2     3
  vicehazmester 3     2
  krudyfroccs   1     9
  soherfroccs   9     1
  puskasfroccs  3     6
  ;

end;
