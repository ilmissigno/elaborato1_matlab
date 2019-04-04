function controllo_TOL(TOL)
%% Funzione che controlla che i valori di tolleranza immessi dall'utente siano corretti
if(TOL>0 && TOL<eps)
    error('Err:TolleranzaMINESP','TOL deve rientrare nei valori ammissibili');
elseif(TOL<0)
    error('Err:TolleranzaMINESP','TOL deve rientrare nei valori ammissibili');
elseif(~isscalar(TOL))
    error('Err:TolleranzaNumReale','TOL deve essere settata come un numero reale');
elseif(~isfinite(TOL) ||  ~isreal(TOL) || ischar(TOL))
    error('Err:TolleranzaNumReale','TOL deve essere settata come un numero reale');
end

end

