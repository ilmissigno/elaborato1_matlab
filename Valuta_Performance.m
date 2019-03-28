function Valuta_Performance(f,x0,TOL,NMAX)
% Valuta_Performance stampa su un istogramma i risultati, sull'asse delle ordinate 
%troviamo il numero di iteazioni relativi alle funzioni fzero e algoritmo_di_bisezione,
% per diversi valori di tolleranza rappresentati sull'asse delle ascisse.
  
    
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


