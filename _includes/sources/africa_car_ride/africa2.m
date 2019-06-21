param totalDistance; #km
param fuelConsumption; # l / 100 km 
param tankCapacity; # l
param initialTank, default tankCapacity; # l
param safetyMeasure; # km

set Stations;
param distance{Stations}; # km
param fuelPrice{Stations}; # Dh / l


var fill{Stations} >= 0;
var fuelAtArrival{Stations} >= safetyMeasure / 100 * fuelConsumption;

s.t. set_fuelAtArrival{s in Stations}:
      fuelAtArrival[s] = initialTank + sum {s2 in Stations: distance[s2] < distance[s]} fill[s2] - distance[s]/100*fuelConsumption;

s.t. Can_not_overfill{s in Stations}:
  fuelAtArrival[s] + fill[s] <= tankCapacity;

s.t. Need_to_reach_final_destination:
  (initialTank + sum {s in Stations} fill[s]) * (100 / fuelConsumption) >= totalDistance;

minimize TotalCost:
  sum{s in Stations} fill[s]*fuelPrice[s];

solve;

printf "Total cost: %g\n\n",TotalCost;

for{s in Stations}
{
  printf "%14s  (%5g km, %3g Dh/l): %6.3f + %6.3f ---> %6.3f l\n",s,distance[s],fuelPrice[s],
  fuelAtArrival[s], fill[s], fuelAtArrival[s] + fill[s]
  ; 
}
