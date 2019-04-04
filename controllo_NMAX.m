function controllo_NMAX(NMAX)
%% Funzione che controlla che i valori del numero massimo di iterazione immessi dall'utente siano corretti


% Verifico che NMAX sia un intero positivo
if (~isscalar(NMAX) || ~isnumeric(NMAX) || isinf(NMAX) || isnan(NMAX) || NMAX <= 0)
    error('Err:NMAXINTEROPOsitivo','NMAX deve essere un numero intero positivo');
end

% Errore se NMAX è piccolo, cioè se indichiamo come valore minimo di
% NMAX 1
if (NMAX < 2)
    error('Error:NMAXMin','Il numero di iterazioni inserito è troppo piccolo, il numero minimo di iterazioni è 2 ');
end

% Segnalo se NMAX è grande
if (NMAX > 1000)
    warning('Warning:NMAX1000','Il numero di iterazioni inserito è molto alto');
    uiwait(gcf);
end
end
