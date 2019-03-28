function controllo_TOL(TOL)
%% Funzione che controlla che i valori di tollerenza immessi dall'utente siano corretti

   if(isempty(TOL))
       TOL = eps;
   else
       if(TOL>0 && TOL<eps)
           error('TOL deve rientrare nei valori di eps');
       elseif(~isscalar(TOL))
            error('TOL deve essere uno scalare');
       elseif(~isfinite(TOL) ||  ~isreal(TOL) || ischar(TOL))
            error('TOL deve essere settata come un numero reale.')
       end
       if (TOL < 0)
            error('TOL non puo essere minore di zero.')
       end
       %TOLF = eps;
   end
end
