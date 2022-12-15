#script (python)

#very helpful source https://potassco.org/clingo/python-api/5.4/

import clingo

def get(val, default):
    return val if val != None else default


def main(prg):
    input = "data.txt"
    output = "solve.txt"


    f = open(input, "r")
    grid = f.read().split("\n")
    dimensions = grid[0].split(" ")
    row = int(dimensions[0])
    col = int(dimensions[1])

    with prg.backend() as backend:
        sym_a = clingo.Function("row",[row])
        atm_a = backend.add_atom(sym_a)
        backend.add_rule([atm_a])
        sym_a = clingo.Function("col",[col])
        atm_a = backend.add_atom(sym_a)
        backend.add_rule([atm_a])
        grid.remove(grid[0])
        for i in range(row):
            grid[i] = grid[i].split(" ")

        for y in range(row):
            for x in range(col):
                element = grid[y][x]
                if element == "_":
                    continue
                if element != "X":
                    neighbour = int(element)
                    sym_a = clingo.Function("block",[x+1,y+1,neighbour])
                    atm_a = backend.add_atom(sym_a)
                    backend.add_rule([atm_a])
                sym_a = clingo.Function("coordinates",[x+1,y+1,1])
                atm_a = backend.add_atom(sym_a)
                backend.add_rule([atm_a])
    f.close()


    prg.ground([("base", [])])
    with prg.solve(yield_=True) as h:
        bulbs = [] # ADDED
        for m in h:
            for atom in m.symbols(atoms=True):
                if (atom.name == "bulb" and len(atom.arguments) == 2): # ADDED
                    bulbs.append(atom) #ADDED
            break

        #solution to file
        for element in bulbs:
            #element solveHandle
            x = element.arguments[0].number
            y = element.arguments[1].number
            #place bulb
            grid[y-1][x-1] = "B" #indexces from 0 to n-1
        toFile = open(output, 'w')
        for r in grid:
            for c in r:
                print(c, file = toFile, end =" ")
            print("\n", file = toFile, end ="")
        toFile.close()

        
        
#end.