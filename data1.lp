%   coordinates(X,Y,Block) is Block = 1 when it's block if empty 0
coordinates(1,1,1).
coordinates(3,2,1).
coordinates(5,1,1).
coordinates(1,4,1).
coordinates(5,5,1).
%   block(X,Y,Neighbours) is identified by X,Y, only if it has a number
block(1,1,0).
block(3,2,1).
block(5,1,2).
block(1,4,2).
block(5,5,0).
%   number of columns and rows
col(5).
row(5).