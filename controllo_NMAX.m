function controllo_NMAX(NMAX)
%% Funzione che controlla che i valori del numero massimo di iterazione immessi dall'utente siano corretti


    % Verifico che NMAX sia un intero positivo
        if (~isscalar(NMAX) || ~isnumeric(NMAX) || isinf(NMAX) || isnan(NMAX) || NMAX <= 0)
              errordlg('NMAX deve essere un numero intero positivo','Errore');
              error('Err:NMAXINTEROPOsitivo','NMAX deve essere un numero intero positivo');
        end
    
    % Errore se NMAX � piccolo, cio� se indichiamo come valore minimo di
    % NMAX 1
         if (NMAX < 2)
             errordlg('Il numero di iterazioni inserito � troppo piccolo, il numero minimo di iterazioni � 2 ','Errore');
             error('Error:NMAXMin','Il numero di iterazioni inserito � troppo piccolo, il numero minimo di iterazioni � 2 ');
         end
    
    % Segnalo se NMAX � grande
         if (NMAX > 1000)
            warndlg('Il numero di iterazioni inserito � molto alto, l''esecuzione potrebbe essere pi� lenta','Attenzione');
                 warning('Warning:NMAX1000','Il numero di iterazioni inserito � molto alto');
           uiwait(gcf);
         end
    end
