param totalDistance; #km
param fuelConsumption; # l / 100 km 
param tankCapacity; # l
param initialTank, default tankCapacity; # l
param safetyMeasure; # km

set Stations;
param distance{Stations}; # km
param fuelPrice{Stations}; # Dh / l


var fill{Stations} >= 0;

s.t. Has_to_meet_safety_measure {s in Stations}:
  (initialTank + sum {s2 in Stations: distance[s2] < distance[s]} fill[s2]) * (100 / fuelConsumption) >= distance[s]+safetyMeasure;

s.t. Can_not_overfill{s in Stations}:
  initialTank + sum {s2 in Stations: distance[s2] < distance[s]} fill[s2] - distance[s] * (fuelConsumption / 100) + fill[s] <= tankCapacity;

s.t. Need_to_reach_final_destination:
  (initialTank + sum {s in Stations} fill[s]) * (100 / fuelConsumption) >= totalDistance;

minimize TotalCost:
  sum{s in Stations} fill[s]*fuelPrice[s];

solve;

printf "Total cost: %g\n\n",TotalCost;

for{s in Stations}
{
  printf "%14s  (%5g km, %3g Dh/l): %5.2g + %5.2g ---> %5.2g l\n",s,distance[s],fuelPrice[s],
  initialTank + sum {s2 in Stations: distance[s2] < distance[s]} fill[s2] - distance[s] * (fuelConsumption / 100),
  fill[s],
  initialTank + sum {s2 in Stations: distance[s2] < distance[s]} fill[s2] - distance[s] * (fuelConsumption / 100) + fill[s]
  ; 
}
