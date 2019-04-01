function [f,x0,TOL,NMAX] = Richiama_Parametri()

f =  @(x) 2-exp(-x)-sqrt(x);
x0 =[0 4];
TOL = 10^-15;
NMAX = 1001;

end

