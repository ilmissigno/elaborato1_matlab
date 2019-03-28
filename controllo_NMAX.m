function controllo_NMAX(NMAX)


    if(isempty(NMAX))
       NMAX = 500; %valore di default se non lo inseriamo in ingresso
    else
    % Verifico che NMAX sia un intero positivo
        if ~isscalar(NMAX) || ~isnumeric(NMAX) || isinf(NMAX) || isnan(NMAX) || NMAX <= 0 %|| mod(NMAX,1) == 0
              errordlg('NMAX deve essere un numero intero positivo','Errore');
              error('NMAX deve essere un numero intero positivo');
        end
    
    % Errore se NMAX � piccolo, cio� se indichiamo come valore minimo di
    % NMAX 1
         if NMAX < 2
             errordlg('Il numero di iterazioni inserito � troppo piccolo, il numero minimo di iterazioni � 2 ','Errore');
             error('Il numero di iterazioni inserito � troppo piccolo, il numero minimo di iterazioni � 2 ');
         end
    
    % Segnalo se NMAX � grande
         if NMAX > 1000
            warndlg('Il numero di iterazioni inserito � molto alto, l''esecuzione potrebbe essere pi� lenta','Attenzione');
            uiwait(gcf);
         end
    end
end