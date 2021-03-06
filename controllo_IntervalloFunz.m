function controllo_IntervalloFunz(f,x0)
%% Funzione che controlla se l'intervallo inserito e corretto assieme alla funzione f

if(isempty(x0))
    error('Err:IntevalloVuoto','Inserire intervallo assieme alla funzione');
end

if(x0(1)==x0(2))
    %verifica intervallo inserito
    error('Err:EstremiIntervallo','Estremi dell Intervallo Uguali.') ;
    
end

if (~isscalar(x0(1)) || ~isnumeric(x0(1)) || isinf(x0(1)) || isnan(x0(1)))
    error('Err:NonunNumero','a deve essere un numero');
elseif (~isscalar(x0(2)) || ~isnumeric(x0(2)) || isinf(x0(2)) || isnan(x0(2)))
    error('Err:NonunNumero','b deve essere un numero');
end

if(~isa(f,'function_handle'))
    error('Err:FunzHandle','Inserire la funzione come handle.');
end

if(length(x0)~=2)
    error('Err:LungInter','Inserire intervallo composto da 2 estremi.');
end

end