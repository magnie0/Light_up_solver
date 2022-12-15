# Light_up_solver
Logic game Light up (Akari) solver 

https://en.wikipedia.org/wiki/Light_Up_(puzzle)

# Rules

As mentioned in wikipedia in short:
- no two bulb shine on each other
- all grid must be lit up
- bulb illuminates until edge of grid or dark cell (which blocks light)
- number on black cell says how many bulbs are neighbours to this black cell (neighbours max.4 diagonally isn't counting)

We search for placement of the bulbs

## Terms I will use
- Grid are the boxes (white or black) which are defined by coordinates X,Y which in my solution represents:
X - columns 
Y - rows 
point (1, 1) is in the upper left corner 
point (col, row) is in the lower right corner
- Bulb light source :P which can be placed only on white cells (not on block)
- Block which is a dark cell, blocks light (in code I use it as those with numbers)
- Block and Bulb are defined by a pair (X,Y)

# Usage
I use [clingo](https://github.com/potassco/clingo/releases)
>**Note:** Solver isn't (yet?) secured from wrong input !!!

There are two ways on using solver 
- requires a little bit of knowing asp
	>terminal: clingo light_up_solver.lp data.lp
	
	where file data.lp defines the grid by:
	- coordinates(X,Y,Block).
	Block = 1 when it's block if empty 0
	if nothing is said default is empty cell, so in this you have to write only placement of black cells
	X,Y are coordinates and Block = 1
	- block(X,Y,Neighbours).
	is identified by X,Y, black cells only if it has defined number of neighbours
	- col(N). ; row(N).
	number of columns and rows only one for each so like:
	col(10).
	row(10).
	
- reades from file
	>terminal: clingo light_up_solver.lp parse.lp
	
	Where input is in "data.txt" and output will be in "solve.txt" 
	It's possible to change that in parse.lp file at the beggining of main
	Input cells in file is specified by:
	- _ - empty cell
	- X - dark cell without defined neighbours
	- 1,2,3,4 - dark cell with defined neighbours
	Example input are in files data[n].lp where  [n] is number from 1 to 2
	
	 **File** in first line has number of rows and columns (in this order! ) two seperate numbers begause grid doesn't have to be square
	 Than in next rows it has values as defined above devided by
	 - spaces in columns
	 - endline in rows
	 
	 Example input are in files data[n].txt where  [n] is number from 1 to 3


# Usefull links for ASP (Answer Set Programming)

https://potassco.org/clingo/python-api/5.4/#clingo.Control.configuration

# You see errors?

Write to me ;)

## TODO explain files light_up_solver.lp and parse.lp   