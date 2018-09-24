var xKF >=0;
var xNF >=0;
var xHL >=0;
var xHM >=0;
var xVHM >=0;
var xKrF >=0;
var xSF >=0;
var xPF >=0;

s.t. Wine: 1*xKF + 2*xNF + 1*xHL + 3*xHM + 2*xVHM + 9*xKrF + 1*xSF + 6*xPF  <= 1000;

s.t. Soda: 1*xKF + 1*xNF + 2*xHL + 2*xHM + 3*xVHM + 1*xKrF + 9*xSF + 3*xPF  <= 1500;

maximize TotalIncome: 110*xKF + 200*xNF + 120*xHL + 260*xHM + 200*xVHM + 800*xKrF + 200*xSF + 550*xPF;
