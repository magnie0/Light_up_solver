%   number of columns and rows
col(10).
row(10).
%   coordinates(X,Y,Block) is Block = 1 when it's block if empty 0
coordinates(1,4,1).
coordinates(1,8,1).
coordinates(2,5,1).
coordinates(2,8,1).
coordinates(3,1,1).
coordinates(3,6,1).
coordinates(3,10,1).
coordinates(5,2,1).
coordinates(5,5,1).
coordinates(5,7,1).
coordinates(6,2,1).
coordinates(6,9,1).
coordinates(6,10,1).
coordinates(7,1,1).
coordinates(7,7,1).
coordinates(7,10,1).
coordinates(8,2,1).
coordinates(8,9,1).
coordinates(9,3,1).
coordinates(9,4,1).
coordinates(9,7,1).
coordinates(10,1,1).
coordinates(10,8,1).
%   block(X,Y,Neighbours) is identified by X,Y, only if it has a number
block(1,4,1).
block(1,8,0).
block(2,8,0).
block(3,1,0).
block(3,6,4).
block(3,10,1).
block(5,2,2).
block(5,5,0).
block(5,7,1).
block(6,2,0).
block(6,9,2).
block(6,10,0).
block(7,1,0).
block(7,7,1).
block(7,10,2).
block(8,2,0).
block(8,9,4).
block(9,4,0).
block(9,7,1).
block(10,1,1).