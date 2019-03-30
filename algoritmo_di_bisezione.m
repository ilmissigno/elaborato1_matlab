%% Algoritmo di Bisezione

%% Scopo
% Data una generica funzione f in un intervallo [a,b]. L'algoritmo di bisezione calcola approssimativamente un  punto in cui f(x)=0.
%% Sintassi
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
% - *_f_* = funzione di cui calcolare lo zero (espressa come function handle)
%%
% - *_x0_* = Intervallo iniziale (espresso con un vettore con estremi
% differenti
%%
% - *_TOL_* = facoltativo, accuratezza richiesta dall'utente, se omesso
% viene posto pari a eps
%%
% - *_NMAX_* = facoltativo, numero massimo di iterazioni, se omesso
% NMAX=500
%%
%% Parametri di Output
% - *_x_* = valore dell'approssimazione dello zero della funzione
%%
% - *_output_* = facoltativo,struttura con 2 campi:
%%
% - *_fx_* valore della funzione in *_x_*
%%
% - *_niter_* numero di iterazioni
%%
% - *_graf_* = facoltativo, variabile di tipo carattere, fa il grafico della
% funzione e dello zero trovato
%%

%% Descrizione
% L'algoritmo di Bisezione riceve obbligatoriamente in ingresso la funzione e l'intervallo altrimenti si arresta.Opzionalmente se l'utente � esperto pu� inserire i valori TOL ed NMAX.
%%

%% Firma della funzione

function [X,result,graf] = algoritmo_di_bisezione(f,x0,TOL,NMAX)

%% Controllo dei parametri di ingresso
if(nargin==0)
    error('Nessun valore in ingresso');
end
%Se inserisco un solo valore (funzione soltanto)
if(nargin==1)
    error('Inserire intervallo assieme alla funzione');
end
if(x0(1)==x0(2))
    %inserito verifica intervallo
    errordlg('Valori di a e b uguali','Errore');
   error('valori dell intervallo uguali');
end
if (nargin>=3)
  controllo_TOL(TOL);
                   
    else
        warning('settato eps');
        TOL=eps;
    end
    if(nargin==4)
        
  controllo_NMAX(NMAX);
    else NMAX=500;
    end


%% Inizializzazione delle variabili 
niter = 0;
a=x0(1);
b=x0(2);
c = (a+b)/2;
fa = f(a);
fb = f(b);
fc = f(c);
x=c;
%% Controllo il valore agli estremi dell'intervallo
if(abs(fa)<eps)
    x=a;
    fc=f(a);
end
if(abs(fb)<eps)
    x=b;
    fc=f(b);
else
%% Controllo il soddisfacimento del teorema degli zeri
    if(fa*fb>0)
        errordlg('La funzione non ha zeri nell intervallo specificato','Errore');
        error('La funzione non ha zeri nell intervallo specificato');
    end
 %% Parte iterativa ai fini della soluzione del problema
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
%% Controllo sui parametri di uscita ed eventuale creazione del grafico di output

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
    hold off
end
