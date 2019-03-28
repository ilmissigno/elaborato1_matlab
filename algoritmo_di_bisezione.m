function [X,result,graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX)
%% Funzione che implementa l'algoritmo di bisezione per il calcolo dello zero di una funzione
% Sintassi:
% [x,result,graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX)
%
% Parametri di ingresso:
%   f = funzione di cui calcolare lo zero (function handle)
%   x0  =   intervallo iniziale
%   TOL =   facoltativo, accuratezza richiesta dall'utente, se omesso viene posto pari a eps
%   NMAX =  facoltativo, numero massimo di iterazioni, se omesso NMAX=500
% Parametri di output
%
%   X = valore dell'approssimazione dello zero
%   result = facoltativo,struttura con 2 campi:
%            - fx = valore della funzione in x
%            - niter = numero di iterazioni
%   graf = facoltativo, variabile tipo carattere, fa il grafico della funzione e dello zero trovato
%
%
% Diagnostica:
%   Il programma si arresta se non riceve in ingresso un opportuno
%   intervallo (es. estremi uguali)
%   Nel caso in cui il valore di TOL in ingresso
%   non sia un valore intero, viene effettuato un arrotondamento.
%
% Esempi di Utilizzo
%
% f = @(x) 2-exp(-x)-sqrt(x);
% x0 = [0 4];
% TOL = 10^-10;
% NMAX = 1000;
% [x uscita graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX);
%
% x = 3.937500000058208e+00
% f(x) = -3.810379420573051e-03
%
% --------------------------------------------------------------------
%
% f = @(x) x.^2 - 2;
% x0 = [0 2];
% TOL = 10^-6;
% NMAX = 1000;
% [x uscita graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX);
%
% x = 1.500000953674316e+00
% f(x) = 2.500028610238587e-01
%
% --------------------------------------------------------------------
%
% f = @(x) exp(x) - 2;
% x0 = [0 2];
% TOL = 10^-8;
% NMAX = 1000;
% [x uscita graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX);
%
% x = 4.999999925494194e-01
% ans = -3.512787415838026e-01
%
%
if(nargin==0)
    error('Nessun valore in ingresso');
end
%Se inserisco un solo valore (funzione soltanto)
if(nargin==1)
    error('Inserire intervallo assieme alla funzione');
end
if(x0(1)==x0(2))
   error('valori dell intervallo uguali');
else
  controllo_TOL(TOL);
  controllo_NMAX(NMAX);
end 
%Inizializzazione variabili
niter = 0;
%Funzione effettiva
a=x0(1);
b=x0(2);
c = (a+b)/2;
fa = f(a);
fb = f(b);
fc = f(c);
x=c;
if(abs(fa)<eps)
    x=a;
    fc=f(a);
end
if(abs(fb)<eps)
    x=b;
    fc=f(b);
else
    if(fa*fb>0)
        error('La funzione non ha zeri nell intervallo specificato');
    end
    while((abs(b-a))>=(TOL*max(abs(a),abs(b))) && abs(fc)>=eps && niter<NMAX)
        niter = niter + 1;
        if((fa*fc)<0)
            b=c;
            fb=fc;
        else
            a=c;
            fa=fc;
        end
        c=(a+b)/2;
        fc = f(c);
        x=c;
    end
end
if(nargout==1)
   X = x;
elseif(nargout==2)
    X = x;
    result.fx = fc;
    result.numiter = niter;
elseif(nargout==3)
    X = x;
    result.fx = fc;
    result.numiter = niter;
    inter = -1:0.001:5;
    graf = plot(inter,f(inter));
    hold on
    plot(X,f(X),'ro');
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    box off
end
