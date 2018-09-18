* Problem:    helloworld
* Class:      LP
* Rows:       3
* Columns:    2
* Non-zeros:  6
* Format:     Free MPS
*
NAME helloworld
ROWS
 L Constraint1
 L Constraint2
 N Objective
COLUMNS
 x Constraint1 1 Constraint2 3
 x Objective 1
 y Constraint1 2 Constraint2 1
 y Objective 1
RHS
 RHS1 Constraint1 15 Constraint2 20
ENDATA
