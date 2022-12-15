%hardcode for now n -size in command line
%coordinates(X,Y,Block) is Block = 1 when it's block if empty 0
coordinates(1,1,1).
coordinates(3,2,1).
coordinates(5,1,1).
coordinates(1,4,1).
coordinates(5,5,1).
%block(X,Y,Neighbors)
block(1,1,0).
block(3,2,1).
block(5,1,2).
block(1,4,2).
block(5,4,0).
%hardcode for now


%all coords for page
coords(1..n,1..n).
must_be_light(X,Y) :- coords(X,Y), not coordinates(X,Y,1).
coordinates(X,Y,0) :- must_be_light(X,Y), not coordinates(X,Y,1). %pottrzebujemy żeby zdefiniować do tego zapalania

{ bulb(X,Y) : must_be_light(X,Y) }.
:- not 6 { bulb(X,Y) } 6. % jak bez tego to robi się minimum
%lights(XBulb_id,YBulb_id,)
lights_row(XB,YB,X,Y) :- bulb(X,Y), X = XB, Y = YB.
lights_col(XB,YB,X,Y) :- bulb(X,Y), X = XB, Y = YB.
%lights_col(XB,YB,X,Y) :- lights_col(XB,YB, X1,Y), X=X1+1, X<= n, not coordinates(X,Y,1).
%lights_col(XB,YB,X,Y) :- lights_col(XB,YB, X1,Y), X=X1-1, X>= 1, not coordinates(X,Y,1).
%lights_row(XB,YB,X,Y) :- lights_row(XB,YB, X,Y1), Y=Y1+1, Y<= n, not coordinates(X,Y,1).
%lights_row(XB,YB,X,Y) :- lights_row(XB,YB, X,Y1), Y=Y1-1, Y>= 1, not coordinates(X,Y,1).
lights_col(XB,YB,X,Y) :- lights_col(XB,YB, X1,Y), X=X1+1, X<= n, coordinates(X,Y,0).
lights_col(XB,YB,X,Y) :- lights_col(XB,YB, X1,Y), X=X1-1, X>= 1, coordinates(X,Y,0).
lights_row(XB,YB,X,Y) :- lights_row(XB,YB, X,Y1), Y=Y1+1, Y<= n, coordinates(X,Y,0).
lights_row(XB,YB,X,Y) :- lights_row(XB,YB, X,Y1), Y=Y1-1, Y>= 1, coordinates(X,Y,0).
lights(XB,YB,X,Y) :- lights_col(XB,YB,X,Y).
lights(XB,YB,X,Y) :- lights_row(XB,YB,X,Y).


unique(XB,YB,X,Y):-lights(XB,YB,X,Y),lights(XB2,YB2,X1,Y1), XB1 = XB2, YB1 = YB2,X = X1, Y=Y1.

%error the same are lighting by different bulbs
%error(X,Y) :- lights(XB1, YB1, X,Y), lights(XB2,YB2,X,Y), XB1 != XB2, YB1 = YB2.
%error(X,Y) :- lights(XB1, YB1, X,Y), lights(XB2,YB2,X,Y), XB1 != XB2, YB1 != YB2.
%error(X,Y) :- lights(XB1, YB1, X,Y), lights(XB2,YB2,X,Y), XB1 = XB2, YB1 != YB2.

error(X,Y) :- lights(XB,YB,X,Y), bulb(XB1,YB1), X=XB1, Y=YB1, XB=XB1, YB!=YB1.
error(X,Y) :- lights(XB,YB,X,Y), bulb(XB1,YB1), X=XB1, Y=YB1, XB!=XB1, YB=YB1.
error(X,Y) :- lights(XB,YB,X,Y), bulb(XB1,YB1), X=XB1, Y=YB1, XB!=XB1, YB!=YB1.
#show error/2.
:- not 0{error(X,Y)}0.
%#show coordinates/3.
%#show unique/4. 
#show bulb/2.

%#show must_be_light/2.

%#show lights/4.


