function [f,x0,TOL,NMAX] = Richiama_Parametri()


f =  @(x) x.^2;
x0 =[-1 4];
TOL = eps;
NMAX = 500;



end

