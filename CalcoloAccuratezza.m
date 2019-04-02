function erroreRelativo = CalcoloAccuratezza(f,x0,TOL,NMAX)

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
        %
  controllo_NMAX(NMAX);
    else NMAX=500;
    end


% Questa funzione confronta i risultati degli algoritmi di bisezione e
% fzero restituendone l'errore relativo
    RisultatoCorrente = algoritmo_di_bisezione(f,x0,TOL,NMAX);
    options = optimset('TolX',TOL);
    SoluzioneOttima = fzero(f,x0,options);
    erroreRelativo = abs(RisultatoCorrente - SoluzioneOttima)/abs(SoluzioneOttima);
