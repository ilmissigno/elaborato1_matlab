classdef Missigno_Test < matlab.unittest.TestCase
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
   
   
    methods(Test)
           function TestCase10(testCase)
           %Caso 10 : Verifica se la funzione è Handle
           %Richiamo i parametri
            [f,~,~,~] = Richiama_Parametri();
           %testa l'errore
                if(isa(f,'function_handle'))
                   %passato
                    verifyReturnsTrue(testCase,@true);
                else
                    %non passato
                    verifyReturnsTrue(testCase,@false);
                end
           end
           
           function TestCase11(testCase)
               %Caso 11 : Verifica se la funzione non è presente
               %Richiamo i parametri
                [f,~,~,~] = Richiama_Parametri();
                verifyNotEmpty(testCase,f);
           end
           
           function TestCase12(testCase)
               %Caso 12 : Verifica se il valore di NMAX 
               %non è numerico, non è scalare, è infinito
               %oppure è NaN
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(~isscalar(NMAX) || ~isnumeric(NMAX) || isinf(NMAX) || isnan(NMAX))
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase13(testCase)
               %Caso 13 : Verifica se il valore di NMAX 
               %è minore o uguale a 0
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(NMAX<=0)
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase14(testCase)
               %Caso 14 : Verifica se il valore di NMAX 
               %è minore o uguale a 2
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(NMAX<=2)
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase15(testCase)
               %Caso 14 : Verifica se il valore di NMAX 
               %è minore o uguale a 2
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(NMAX>=1000)
                    warning('Il numero di iterazioni inserito è molto alto, l''esecuzione potrebbe essere più lenta'); 
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
    end
end


