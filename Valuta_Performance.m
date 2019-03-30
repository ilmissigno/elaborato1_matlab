function Valuta_Performance(f,x0,TOL,NMAX)
% Valuta_Performance stampa su un grafico i risultati, sull'asse delle ordinate 
%troviamo il numero di iteazioni relativi alle funzioni fzero e algoritmo_di_bisezione,
% per diversi valori di tolleranza rappresentati sull'asse delle ascisse.
  
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
     
else
    if(nargin<3)
  error('Inserire i valori di tolleranza!');
end
                   
    if(nargin==4)
        
  controllo_NMAX(NMAX);
    else NMAX=500;
    end
end 
    
 %inizializzazione delle variabil contenenti i risultati
RisultatiBisezione = zeros(1,10);
RisultatiFzero = zeros(1,10);

for i = 1:14
        [~, uscita,~] = algoritmo_di_bisezione(f,x0,TOL(i),NMAX);
        RisultatiBisezione(i) = uscita.numiter;
        options = optimset('TolX',TOL(i));
      [~, ~, ~, uscitaFzero] = fzero(f,x0,options);
       RisultatiFzero(i) = uscitaFzero.iterations;
       
end
 



plot(categorical(TOL),(RisultatiBisezione),'r--*',categorical(TOL),(RisultatiFzero),'b--*');
hold on;

grid on;
title('Algoritmo di Bisezione VS FZero');
legend('Risultati Bisezione','Risultati Fzero','Location','northwest');
% il successivo comando cambia la direzione dell'asse x
set(gca,'Xdir','reverse');
xlabel('TOL') ;
ylabel('Numero di iterazioni') 
%RAFFAELE : una volta stampato il grafico effettuo un hold off per attivare
%l'altro grafico del calcolo in algoritmo_di_bisezione
hold off
