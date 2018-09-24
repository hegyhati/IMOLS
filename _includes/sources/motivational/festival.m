var y1 binary;
var y2 binary;
var y3 binary;
var y4 binary;
var y5 binary;

s.t. Haggard: y1 + y3 + y4 >= 1;
s.t. Stratovarius: y1 + y2 + y3 + y5 >= 1;
s.t. Epica: y1 + y2 + y4 + y5 >= 1;
s.t. Dalriada: y3 + y4 >= 1;
s.t. Apocalyptica: y4 >= 1;
s.t. Liva: y2 + y3 + y4 +y5 >= 1;
s.t. Eluveitie: y3 + y5 >= 1;

minimize NumberOfFestivals: y1 + y2 + y3 + y4 + y5;
