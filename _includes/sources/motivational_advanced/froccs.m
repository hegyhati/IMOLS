set FroccsTypes;

param price{FroccsTypes};

param soda_stock; 
param wine_stock; 

param soda_content{FroccsTypes};
param wine_content{FroccsTypes};

var quantity{FroccsTypes}>=0;

s.t. SodaUsage:
  sum{f in FroccsTypes} quantity[f] * soda_content[f] <= soda_stock;

s.t. WineUsage:
  sum{f in FroccsTypes} quantity[f] * wine_content[f] <= wine_stock;

maximize Income:
  sum{f in FroccsTypes} price[f] * quantity[f];

end;
