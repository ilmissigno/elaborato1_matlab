classdef TEST_RICHIAMA_PARAMETRI < matlab.unittest.TestCase
    
    methods(Test)
        
        function TestCase2(testCase)
            %% TEST FUNCTION HANDLE
            %Verifica se la funzione immessa � una funzione handle
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            f = 'a'; %valore di errore
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,NMAX),'Err:FunzHandle');
        end
        
        function TestCase3(testCase)
            %% TEST INTERVALLO VUOTO
            %verifica l'errore nel caso in cui l'intervallo � vuoto
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f),'Err:IntevalloVuoto');
            
            
        end
        
        
        
        function TestCase4(testCase)       
            %% TEST ESTREMI INTERVALLO
            %verifica l'errore nel caso in cui il secondo estremo dell'intervallo inserito
            %non � un numero
            
            [f, x0, TOL, NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[0 'a'],TOL,NMAX),'Err:NonunNumero');
            
            
        end
        
        function TestCase5(testCase)
            %% TEST LUNGHEZZA INTERVALLO
            %verifica l'errore nel caso in cui i valori dell'intervallo non
            %sono validi, poich� o inseriamo un numero di elementi diverso
            %da 2 come lunghezza dell'intervallo
            [f, x0, TOL, NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[ 1 2 3],TOL,NMAX),'Err:LungInter');
        end
        
        function TestCase6(testCase)
            %% TEST ESTREMI INTERVALLO UGUALI
            %verifica l'errore nel caso in cui entrambi i valori
            %dell'intervallo sono uguali
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[3 3],TOL,NMAX),'Err:EstremiIntervallo');
            
            
        end
        
        function TestCase7(testCase)
            %% TEST ESTREMI INTERVALLO
            %verifica l'errore nel caso in cui non � soddisfatto il teorema
            %degli zeri
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,[-3 3],TOL,NMAX),'Err:TeoremaDegliZeriNonSoddisfatto');
            
            
        end
        
        function TestCase8(testCase)
            %% TEST TOLLERANZA NON INSERITA
            %Verifica il warning nel caso in cui la tollerenza non �
            %inserita dall'utente
            [f,x0,~,~] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0),'WARN:TolleranzaNonInserita');
            
        end
        function TestCase9(testCase)
            %% TEST TOLLERANZA MINORE DI EPS
            %Verifica l'errore nel caso in cui il valore di TOL inserito �
            %minore di eps
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,-1,NMAX),'Err:TolleranzaMINESP');
            
            
        end
        
        function TestCase10(testCase)
            %% TEST TOLLERANZA NON NUMERICA
            %Verifica l'errore nel caso in cui il valore di TOL inserito �
            %un carattere
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,'a',NMAX),'Err:TolleranzaNumReale');
            
        end
        function TestCase11(testCase)
            %% TEST NMAX NON NUMERICO
            %Verifica l'errore nel caso in cui il valore di NMAX inserito �
            %non � un numero, in particolare � un carattere
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,'a'),'Err:NMAXINTEROPOsitivo');
            
            
        end
        
        function TestCase12(testCase)
            %% TEST NMAX NEGATIVO
            % Verifica l'errore nel caso in cui il valore di NMAX inserito �
            %minore di 0
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,-1),'Err:NMAXINTEROPOsitivo');
        end
        
        function TestCase13(testCase)
            %% TEST NMAX MINORE DI 2
            %Verifica l'errore nel caso in cui il valore di NMAX inserito �
            %minore di 2
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyError(testCase,@()algoritmo_di_bisezione(f,x0,TOL,1), 'Error:NMAXMin');
            
        end
        
        function TestCase14(testCase)
            %% TEST NMAX MAGGIORE DI 1000
            %Verifica un Warning nel caso in cui il valore di NMAX inserito
            %� maggiore di 1000
            
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0,TOL,1500),'Warning:NMAX1000');
            
        end
        
        function TestCase15(testCase)
            %% TEST NUM.ITERAZIONI
            %verifica se il numero di iterazioni dell'algoritmo supera il
            %valore di NMAX
            [f,x0,TOL,NMAX] = Richiama_Parametri();
            f = @(x) 2-exp(-x)-sqrt(x);
            x0 = [0 4];
            verifyWarning(testCase,@()algoritmo_di_bisezione(f,x0,eps,5),'WARN:OverflowIterations' );
            
        end
        
        
        
        function TestCase16(testCase)
            %% TEST ACCURATEZZA
            %verifica se l'accuratezza � adeguata con TOL inserito da Utente
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
