function erroreRelativo = CalcoloAccuratezza(f,x0,TOL,NMAX)
% Questa funzione confronta i risultati degli algoritmi di bisezione e
% fzero restituendone l'errore relativo
    RisultatoCorrente = algoritmo_di_bisezione(f,x0,TOL,NMAX);
    options = optimset('TolX',TOL);
    SoluzioneOttima = fzero(f,x0,options);
    erroreRelativo = abs(RisultatoCorrente - SoluzioneOttima)/abs(SoluzioneOttima);
end

