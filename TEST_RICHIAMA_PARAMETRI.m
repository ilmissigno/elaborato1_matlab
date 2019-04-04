classdef TEST_RICHIAMA_PARAMETRI < matlab.unittest.TestCase
    
    
    
    methods(Test)
        
        function TestCase3(testCase)
            %verifica l'errore nel caso in cui l'intervallo è vuoto
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            
            verifyError(testCase,@()algoritmo_di_bisezione(f),'Err:IntevalloVuoto');
            
            
        end
        
        function TestCase4(testCase)
            %verifica l'errore nel caso in cui il secondo estremo dell'intervallo inserito
            %non ï¿½ un numero
            
            
            [f, x0, TOL, NMAX] = Richiama_Parametri();
            
            
            
            verifyError(testCase,@()algoritmo_di_bisezione(f,[0 'a'],TOL,NMAX),'Err:NonunNumero');
            
            
        end
        
        function TestCase5(testCase)
            %verifica l'errore nel caso in cui i valori dell'intervallo non
            %sono validi, poichï¿½ o inseriamo un numero di elementi diverso
            %da 2 come lunghezza dell'intervallo
            [f, x0, TOL, NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[ 1 2 3],TOL,NMAX),'Err:LungInter');
        end
        
        function TestCase6(testCase)
            %verifica l'errore nel caso in cui entrambi i valori
            %dell'intervallo sono uguali
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[3 3],TOL,NMAX),'Err:EstremiIntervallo');
            
            
        end
        
        function TestCase7(testCase)
            %verifica l'errore nel caso in cui non ï¿½ soddisfatto il teorema
            %degli zeri
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[-3 3],TOL,NMAX),'Err:TeoremaDegliZeriNonSoddisfatto');
            
            
        end
        
        function TestCase8(testCase)
            %Verifica il warning nel caso in cui la tollerenza non è
            %inserita dall'utente
            [f,x0,~,~] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0),'WARN:TolleranzaNonInserita');
            
        end
        function TestCase9(testCase)
            %Verifica l'errore nel caso in cui il valore di TOL inserito è
            %minore di eps
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,-1,NMAX),'Err:TolleranzaMINESP');
            
            
        end
        
        function TestCase10(testCase)
            %Verifica l'errore nel caso in cui il valore di TOL inserito è
            %un carattere
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,'a',NMAX),'Err:TolleranzaNumReale');
            
        end
        function TestCase11(testCase)
            %Verifica l'errore nel caso in cui il valore di NMAX inserito è
            %non è un numero, in particolare è un carattere
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,'a'),'Err:NMAXINTEROPOsitivo');
            
            
        end
        
        function TestCase12(testCase)
            % Verifica l'errore nel caso in cui il valore di NMAX inserito è
            %minore di 0
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,-1),'Err:NMAXINTEROPOsitivo');
        end
        
        function TestCase13(testCase)
            %Verifica l'errore nel caso in cui il valore di NMAX inserito è
            %minore di 2
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,1), 'Error:NMAXMin');
            
        end
        
        function TestCase14(testCase)
            %Verifica un Warning nel caso in cui il valore di NMAX inserito
            %è maggiore di 1000
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0,TOL,1500),'Warning:NMAX1000');
            
        end
        
        function TestCase15(testCase)
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            f = @(x) 2-exp(-x)-sqrt(x);
            x0 = [0 4];
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,eps,5),'Err:OverflowIterations' );
            
        end
        
        
        
        function TestCase16(testCase)
            %verifica se l'accuratezza ï¿½ adeguata con TOL inserito da Utente
            [f,x0,TOL] = Richiama_Parametri();
            [x, ~, ~]= algoritmo_di_bisezione(f,x0,TOL);
            actSolution=x;
            options = optimset('TolX',TOL);
            expSolution=fzero(f,x0,options);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            
        end
        
    end
    
    
end



function [f,x0,TOL,NMAX] = Richiama_Parametri()

f =  @(x) x.^2-4;
x0 =[0 4];
TOL = 10^-15;
NMAX = 600;

end
