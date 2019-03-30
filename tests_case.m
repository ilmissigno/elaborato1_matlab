classdef tests_case < matlab.unittest.TestCase %definisce una classe di Test
    
    properties
    end
    
    methods(TestMethodSetup) %metodo della classe per inizializzare
        
         function setup(testCase)  % do not change function name
                 setGlobalParameter(@(x)(x.^2-2),[0,4]);
         end
        
    end
   
   methods(TestMethodTeardown) %metodo della classe per distruggere
   
   end
   
    methods(Test) %metodi di test della classe
      
    
        function TestCase1(testCase)
            %verifica se l'accuratezza è buona, nel caso in cui l'errore
            %relativo sia minore di un certo valore.
            [f,x0] = getGlobalParameter;
            actSolution= algoritmo_di_bisezione(f,x0);
            expSolution= fzero(f,x0);
            abs_error= abs(actSolution-expSolution);
            %assert(isequal(actSolution,expSolution));
            testCase.verifyLessThan(abs_error,eps*max(actSolution,expSolution));
           %verifyEqual(testCase,actSolution,expSolution); OPPURE
        end
        
        
        function TestCase2(testCase)
           %verifica l'errore nel caso in cui il valore della funz inserito
           %non è valido
            [~,x0] = getGlobalParameter;
            f=[];
            testCase.verifyError(@()algoritmo_di_bisezione(f,x0),'algoritmo_di_bisezione:EmptyFun')
        end
        
        function TestCase3(testCase)
            %testa l'errore in caso in cui il valore di x0 è vuoto
            import matlab.unittest.constraints.IsEmpty
            [~,x0] = getGlobalParameter;
            %x0 = testCase.TestFigure.CurrentObject;
            testCase.verifyError(x0, IsEmpty, 'Non è possibile calcolare gli zeri della funzione senza inserire l intervallo')

        end
        
        function TestCase4(testCase)
             %testa l'errore in caso in cui il valore di f è vuoto
            import matlab.unittest.constraints.IsEmpty
            [f,~] = getGlobalParameter;
            %x0 = testCase.TestFigure.CurrentObject;
            testCase.verifyError(f, IsEmpty, 'Non è possibile calcolare gli zeri della funzione senza inserire la funzione')
    
        end
        
        function TestCase5(testCase)
            %valori dell'intervallo inseriti NON VALIDI
            %import matlab.unittest.constraints.*
            [f,~] = getGlobalParameter;
            x0 = 1;
            testCase.verifyError(@()algoritmo_di_bisezione(f,x0),'algoritmo_di_bisezione:ErrorX0')
            %testCase.verifyError(x0,'Valori dell intervallo inseriti non validi')
        end
        
        function TestCase6(testCase)
            [f,~] = getGlobalParameter;     
            x0 = [1 'A'];
            testCase.verifyError(@()algoritmo_di_bisezione(f,x0),'algoritmo_di_bisezione:ErrorX0')
    
        end
    end
end




%% Function to access global parameter
       function setGlobalParameter(f,r)
            global x; global y;
            x = f;
            y = r;
       end

        function [f,x0] = getGlobalParameter
            global x; global y;
            f = x;
            x0 = y;
        end

