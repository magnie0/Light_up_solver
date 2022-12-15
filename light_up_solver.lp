%   https://en.wikipedia.org/wiki/Light_Up_(puzzle)
%   bulb and block are identified by a pair (X,Y) where X is for column, Y for row

%   all coords for grid
coords(1..X,1..Y) :- col(X), row(Y).
%   coordinates that aren't black must be lighted
coordinates(X,Y,0) :- must_be_lighted(X,Y), not coordinates(X,Y,1).
must_be_lighted(X,Y) :- coords(X,Y), not coordinates(X,Y,1).

%   bulb can only be at places too light up but we don't know how many we need
{ bulb(X,Y) : must_be_lighted(X,Y) }.

% 1. from rules in readme
%   lights(XBulb,YBulb, X,Y) where Bulb(XBulb,YBulb) lights coords X,Y
lights_row(XB,YB,X,Y) :- bulb(X,Y), X = XB, Y = YB.
lights_col(XB,YB,X,Y) :- bulb(X,Y), X = XB, Y = YB.
lights_col(XB,YB,X,Y) :- lights_col(XB,YB, X1,Y), X=X1+1, X<= C, col(C), coordinates(X,Y,0).
lights_col(XB,YB,X,Y) :- lights_col(XB,YB, X1,Y), X=X1-1, X>= 1, coordinates(X,Y,0).
lights_row(XB,YB,X,Y) :- lights_row(XB,YB, X,Y1), Y=Y1+1, Y<= R, row(R), coordinates(X,Y,0).
lights_row(XB,YB,X,Y) :- lights_row(XB,YB, X,Y1), Y=Y1-1, Y>= 1, coordinates(X,Y,0).
lights(XB,YB,X,Y) :- lights_col(XB,YB,X,Y).
lights(XB,YB,X,Y) :- lights_row(XB,YB,X,Y).

% 2. from rules in readme
%   error(X,Y) is when coordinates X,Y are lit by more than one bulb
error(X,Y) :- lights(XB,YB,X,Y), bulb(XB1,YB1), X=XB1, Y=YB1, XB=XB1, YB!=YB1.
error(X,Y) :- lights(XB,YB,X,Y), bulb(XB1,YB1), X=XB1, Y=YB1, XB!=XB1, YB=YB1.
error(X,Y) :- lights(XB,YB,X,Y), bulb(XB1,YB1), X=XB1, Y=YB1, XB!=XB1, YB!=YB1.
%   there should not be any errors
:- not 0{error(X,Y)}0.

% 3. from rules in readme
%   all coords that are lighted
lighted_coords (X,Y) :- lights(_,_,X,Y).
%   checking if all board is lit up
:- lighted_coords(X,Y), not must_be_lighted(X,Y).
:- not lighted_coords(X,Y), must_be_lighted(X,Y).



% usefull for 4. from rules in readme
%   XBlock, YBlock has neighbour XBulb, YBulb.
neighbours(XBlock,YBlock,XBulb,YBulb) :- block(XBlock, YBlock,_),bulb(XBulb,YBulb), XBlock + 1 = XBulb, YBlock = YBulb, XBulb <= C, col(C).
neighbours(XBlock,YBlock,XBulb,YBulb) :- block(XBlock,YBlock,_),bulb(XBulb,YBulb), XBlock - 1 = XBulb, YBlock = YBulb, XBulb >= 1.
neighbours(XBlock,YBlock,XBulb,YBulb) :- block(XBlock,YBlock,_),bulb(XBulb,YBulb), XBlock = XBulb, YBlock + 1 = YBulb, YBulb <= R, row(R).
neighbours(XBlock,YBlock,XBulb,YBulb) :- block(XBlock,YBlock,_),bulb(XBulb,YBulb), XBlock = XBulb, YBlock - 1 = YBulb, YBulb >= 1.

% 4. from rules in readme
%   neighbours_count(XBl,YBl,N) how many Block Xbl, Ybl has bulbs (N)
neighbours_count(XBl,YBl,N):- block(XBl,YBl,_), #count{bulb(XBulb,YBulb) :neighbours(X,Y,XBulb, YBulb), X = XBl, Y = YBl} = N.
%   it has be equal to number in block
:- neighbours_count(X,Y,N1), block(X,Y,N2), N1 != N2.


#show bulb/2.