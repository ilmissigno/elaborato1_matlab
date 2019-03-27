%% Algoritmo di Bisezione
%%
% Autori : Giuseppe Napolano M63000856 Raffaele Formisano M63000912
%% Scopo
% L'algoritmo di Bisezione calcola un'approssimazione del valore in 
% cui si annulla la funzione, utilizzando l'algoritmo stabile ed il 
% criterio di arresto con la tolleranza gestita dall'utente.
%% Specifiche
% x = algoritmo_di_bisezione(f,x0)
%%
% x = algoritmo_di_bisezione(f,x0,TOL);
%%
% x = algoritmo_di_bisezione(f,x0,TOL,NMAX);
%%
% [x uscita] = algoritmo_di_bisezione(f,x0);
%%
% [x uscita] = algoritmo_di_bisezione(f,x0,TOL);
%%
% [x uscita] = algoritmo_di_bisezione(f,x0,TOL,NMAX);
%%
% [x uscita graf] = algoritmo_di_bisezione(f,x0);
%%
% [x uscita graf] = algoritmo_di_bisezione(f,x0,TOL);
%%
% [x uscita graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX);
%% Parametri di Input
% *_f_* = funzione di cui calcolare lo zero (espressa in function handle)
%%
% *_x0_* = Intervallo iniziale (espresso con un vettore con estremi
% differenti
%%
% *_TOL_* = facoltativo, accuratezza richiesta dall'utente, se omesso
% viene posto pari a eps
%%
% *_NMAX_* = facoltativo, numero massimo di iterazioni, se omesso
% NMAX=500
%%
%% Parametri di Output
% *_x_* = valore dell'approssimazione dello zero della funzione
%%
% *_output_* = facoltativo,struttura con 2 campi:
%%
% - *_fx_* valore della funzione in *_x_*
%%
% - *_niter_* numero di iterazioni
%%
% *_graf_* = facoltativo, variabile tipo carattere, fa il grafico della
% funzione e dello zero trovato
%%
%% Descrizione
% L'algoritmo di Bisezione riceve in ingresso la funzione e l'intervallo in
% cui deve calcolare il valore di annullamento della stessa. 
format long e
f = @(x) 2-exp(-x)-sqrt(x);
x0 = [0 4];
TOL = 10^-15;
NMAX = 1000;
[x uscita graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX);