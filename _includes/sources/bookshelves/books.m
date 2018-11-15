# Input data declaration

set BookSets;
param width{BookSets};
param height{BookSets};

param shelfCount;
set Shelves:=1..shelfCount;

param shelfWidth;
param shelfHeight;

param minDistance;
param minPosition;

param M:=500;


# Variables
var use{Shelves} binary; 
var position{Shelves} >= minPosition;
var put{BookSets,Shelves} binary;

var maxbookheight{Shelves}>=0;
var maxusedshelf;



# Constraints

# If a shelf is used all the shelves below it are used
s.t. ShelfUsage {s in Shelves : s!=1}:
  use[s] <= use[s-1];


# If a shelf is used, it should be higher then the one below it (maxbook + 7cm)

s.t. MaxBookHeightSetter{b in BookSets, s in Shelves}:
  maxbookheight[s] >= height[b] * put[b,s];
  
s.t. ShelfPositioning{s in Shelves: s!=1}:
  position[s] >= position[s-1]+maxbookheight[s-1]+shelfHeight+minDistance;


# Only put booksets on used shelves
# Only put as many booksets on shelves as they can hold

s.t. ShelfCapacity{s in Shelves}:
  sum{b in BookSets} put[b,s] * width[b] <= shelfWidth * use[s];

# Each booksets must be put on exactly one shelf
s.t. BookSetAssignment{b in BookSets}:
  sum{s in Shelves} put[b,s] = 1;

# Set max used shelf
s.t. MaxUsedShelf{s in Shelves}:
  maxusedshelf >= position[s] - M *(1 - use[s]);

# Objective function

minimize topShelfHeight: maxusedshelf;

# Display statements
solve;


printf "<svg width='%d' height='%d'>",shelfWidth+20,(sum{ss in Shelves: (ss==shelfCount && use[ss]==1) || (use[ss]==1 && use[ss+1]==0)} (position[ss] + maxbookheight[ss]+shelfHeight)-position[1])+20; # <-- s/500/totalheight
for {s in Shelves : use[s]==1}
{

printf "<rect x='%d' y='%d' width='%d' height='%d' style='fill:rgb(214, 119, 36)' />",10,10+sum{ss in Shelves: (ss==shelfCount && use[ss]==1) || (use[ss]==1 && use[ss+1]==0)} (position[ss] + maxbookheight[ss]+shelfHeight)-position[s]-shelfHeight,shelfWidth,shelfHeight; # <-- s/500/totalheight
 for {b in BookSets : put[b,s]==1}
 {
    
    printf "<rect  x='%d' y='%d' width='%d' height='%d'"
    ,10+sum{b2 in BookSets : b2<b && put[b2,s]}width[b2]
    ,10+sum{ss in Shelves: (ss==shelfCount && use[ss]==1) || (use[ss]==1 && use[ss+1]==0)} (position[ss] + maxbookheight[ss]+shelfHeight)-(position[s]+shelfHeight)-height[b] # <-- s/500/totalheight
    ,width[b]
    ,height[b]
    ;
    printf " style='fill:rgb(%d,%d,80);stroke:black;stroke-width:1' />"
    ,(1-height[b]/maxbookheight[s])*100+155
    ,50+200*width[b]/shelfWidth
    ;

    printf "<text x='%d' y='%d' font-family='Verdana' font-size='6' fill='white'>%s</text>"    
    ,15+sum{b2 in BookSets : b2<b && put[b2,s]}width[b2]
    ,23+sum{ss in Shelves: (ss==shelfCount && use[ss]==1) || (use[ss]==1 && use[ss+1]==0)} (position[ss] + maxbookheight[ss]+shelfHeight)-(position[s]+shelfHeight)-height[b] # <-- s/500/totalheight
    ,b
    ;
 }
 

}
printf "</svg>";

