classdef TEST_RICHIAMA_PARAMETRI < matlab.unittest.TestCase
    
    
    
    methods(Test)
        
        function TestCase1(testCase)
            %Verifica se la funzione non � presente
            
            [f] = Richiama_Parametri();
            %Ho problemi ad implementarla nel test
            verifyNotEmpty(testCase,f);
        end
        
        function TestCase2(testCase)
            % Verifica se la funzione � Handle
            
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            %IMPLEMENTATA
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:FunzHandle');
        end
        
        function TestCase3(testCase)
            %verifica l'errore nel caso in cui entrambi i valori
            %dell'intervallo sono vuoti
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:IntevalloVuoto');
            
            
        end
        
        function TestCase4(testCase)
            %verifica l'errore nel caso in cui il primo estremo o il secondo estremo dell'intervallo inserito
            %non � un numero
            
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            
            
            
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:NonunNumero');
            
            
        end
        
        function TestCase5(testCase)
            %verifica l'errore nel caso in cui i valori dell'intervallo non
            %sono validi, poich� o inseriamo un numero di elementi diverso
            %da 2 come lunghezza dell'intervallo
            %DA TOGLIERE O RIMANERE COSI
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:LungInter');
        end
        
        function TestCase6(testCase)
            %verifica l'errore nel caso in cui entrambi i valori
            %dell'intervallo sono uguali
            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:EstremiIntervallo');
            
            
        end
        
        function TestCase7(testCase)
            %verifica l'errore nel caso in cui non � soddisfatto il teorema
            %degli zeri
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:TeoremaDegliZeriNonSoddisfatto');
            
            
        end
        
        function TestCase8(testCase)
            %Il test non passa se la tolleranza non � inserita dall'utente
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'WARN:TolleranzaNonInserita');
            
        end
        function TestCase9(testCase)
            %Il test non passa se la tolleranza inserita dall'utente �
            %minore di eps
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:TolleranzaMINESP');
            
            
        end
        
        function TestCase10(testCase)
            %Il test non passa se la tolleranza inserita dall'utente non �
            %un numero
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:TolleranzaNumReale');
            
        end
        function TestCase11(testCase)
            %Caso 12 : Verifica se il valore di NMAX
            %non � numerico, non � scalare, � infinito
            %oppure � NaN
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:NMAXINTEROPOsitivo');
            
            
        end
        
        function TestCase12(testCase)
            % Verifica se il valore di NMAX
            %� minore o uguale a 0
            %Richiamo i parametri
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:NMAXINTEROPOsitivo');
        end
        
        function TestCase13(testCase)
            %Verifica se il valore di NMAX
            %� minore o uguale a 2
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX), 'Err:NMAXI<2');
            
        end
        
        function TestCase14(testCase)
            %Verifica se il valore di NMAX
            %� maggiore o uguale a 1000
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX), 'WARN:NMAXI>1000');
            
        end
        
        function TestCase15(testCase)
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:Superato il numero massimo di Iterazioni-SOluzione non determinata' );
            
        end
        
        %{
function TestCase16(testCase)
%verifica se l'accuratezza � adeguata con TOL=eps
[f,x0] = Richiama_Parametri();
[x, ~, ~]= algoritmo_di_bisezione(f,x0);
actSolution=x;
expSolution= fzero(f,x0);
abs_error = abs(actSolution - expSolution)/abs(expSolution);
verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
%FATTA BENE forse poco utile
end
        %}
        
        function TestCase16(testCase)
            %verifica se l'accuratezza � adeguata con TOL inserito da Utente
            [f,x0] = Richiama_Parametri();
            [x, ~, ~]= algoritmo_di_bisezione(f,x0,TOL);
            actSolution=x;
            options = optimset('TolX',TOL);
            expSolution=fzero(f,x0,options);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            %FATTA BENE
        end
        
        
        function TestCase17(testCase)
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'WARN:Numero di iterazioni alte,prestazioni non ottimali');
            
        end
        
    end
    
    
end



function [f,x0,TOL,NMAX] = Richiama_Parametri()


f =  @(x) x.^2-4;
x0 =[0 4];
TOL = 10^-15;
NMAX = 600;



end
