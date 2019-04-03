function controllo_TOL(TOL)
%% Funzione che controlla che i valori di tollerenza immessi dall'utente siano corretti
if(TOL>0 && TOL<eps || TOL<0)
    errordlg('TOL deve rientrare nei valori di eps','Errore');
    error('Err:TolleranzaMINESP','TOL deve rientrare nei valori ammissibili');
elseif(~isscalar(TOL))
    errordlg('TOL deve essere uno scalare','Errore');
    error('Err:TolleranzaNumReale','TOL deve essere settata come un numero reale');
elseif(~isfinite(TOL) ||  ~isreal(TOL) || ischar(TOL))
    errordlg('TOL deve essere settata come un numero reale.','Errore');
    error('Err:TolleranzaNumReale','TOL deve essere settata come un numero reale');
end

end

