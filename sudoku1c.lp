% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

#const n = 2.



{ sudoku(X, Y, 1..4) } = 1 :- X = 1..4, Y = 1..4.
{ subgrid(X, Y, G) } = 1 :- X = 1..4, Y = 1..4, G = ( 1 + ((( X - 1) / n) * n + (Y - 1) / n)).


:- sudoku(X, Y, N), sudoku(X, Y', N'), Y != Y', N = N'. 
:- sudoku(X, Y, N), sudoku(X', Y, N'), X != X', N = N'. 
:- not sudoku(X, Y, N), initial(X, Y, N'), N = N'. 
:- sudoku(X, Y, N), sudoku(X', Y', N'), subgrid(X, Y, G), subgrid(X', Y', G'), G = G', N = N', X != X', Y != Y'.


#show sudoku/3.
% #show subgrid/3.