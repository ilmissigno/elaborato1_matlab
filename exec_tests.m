classdef exec_tests < matlab.unittest.TestCase
    
   
   
    methods(Test) 
            
              function TestCase2(testCase)
           %verifica l'errore nel caso in cui il primo estremo o il secondo estremo dell'intervallo inserito
           %non ï¿½ un numero
          
                [f,x0] = Richiama_Parametri();
                if(~isnumeric(x0(1)) || ~isnumeric(x0(2)))
                verifyReturnsTrue(testCase,@false);
                else 
                verifyReturnsTrue(testCase,@true);
                end
            
              end
        
             
            function TestCase3(testCase)
           %verifica l'errore nel caso in cui entrambi i valori
           %dell'intervallo sono vuoti
          
           [f,x0] = Richiama_Parametri();
            
                if(isempty(x0(1)) && isempty(x0(2)))
                    verifyReturnsTrue(testCase,@false);
                else 
                    verifyReturnsTrue(testCase,@true);
                end
            
            end  
             
            
            
       function TestCase4(testCase)
           %verifica l'errore nel caso in cui entrambi i valori
           %dell'intervallo sono uguali
          
           [f,x0] = Richiama_Parametri();
           verifyNotEqual(testCase,x0(1),x0(2));
            
       end       
        
       
       function TestCase5(testCase)
           %verifica l'errore nel caso in cui i valori dell'intervallo non
           %sono validi, poichï¿½ o inseriamo un numero di elementi diverso
           %da 2 come lunghezza dell'intervallo
          
           [f,x0] = Richiama_Parametri();
            if(length(x0)~=2)
                verifyReturnsTrue(testCase,@false);
            else 
                verifyReturnsTrue(testCase,@true);
            end
            
       end 
        
       
       function TestCase6(testCase)
           %verifica l'errore nel caso in cui non ï¿½ soddisfatto il teorema
           %degli zeri
          
           [f,x0] = Richiama_Parametri();
            if(f(x0(1))*f(x0(2)) > 0)
                verifyReturnsTrue(testCase,@false);
            else 
                verifyReturnsTrue(testCase,@true);
            end
            
       end
        
         function TestCase7(testCase)
            %verifica se l'accuratezza ï¿½ adeguata con TOL=eps
            [f,x0] = Richiama_Parametri();
            [x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            actSolution=x;
            expSolution= fzero(f,x0);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            
         end
        
        function TestCase8(testCase)
            %verifica se l'accuratezza ï¿½ adeguata con TOL inserito da Utente
            [f,x0,TOL] = Richiama_Parametri();
            [x, uscita, graf]= algoritmo_di_bisezione(f,x0,TOL);
            actSolution=x;
            options = optimset('TolX',TOL);
            expSolution=fzero(f,x0,options);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            
        end
        
        function TestCase9(testCase)
            %Il test non passa se la tolleranza non ï¿½ inserita dall'utente
            [f,x0,TOL] = Richiama_Parametri();
            verifyNotEmpty(testCase,TOL);
            
        end
        
       
       
       
              function TestCase10(testCase)
           %Caso 10 : Verifica se la funzione ï¿½ Handle
           %Richiamo i parametri
            [f,~,~,~] = Richiama_Parametri();

                if(isa(f,'function_handle'))
                   %passato
                    verifyReturnsTrue(testCase,@true);
                else
                    %non passato
                    verifyReturnsTrue(testCase,@false);
                end
           end
           
           function TestCase11(testCase)
               %Caso 11 : Verifica se la funzione non ï¿½ presente
               %Richiamo i parametri
                [f,~,~,~] = Richiama_Parametri();
                verifyNotEmpty(testCase,f);
           end
           
           function TestCase12(testCase)
               %Caso 12 : Verifica se il valore di NMAX 
               %non ï¿½ numerico, non ï¿½ scalare, ï¿½ infinito
               %oppure ï¿½ NaN
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
               %ï¿½ minore o uguale a 0
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
               %ï¿½ minore o uguale a 2
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(NMAX<=2)
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase15(testCase)
               %Caso 15 : Verifica se il valore di NMAX 
               %ï¿½ maggiore o uguale a 1000
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(NMAX>=1000)
                    warning('Il numero di iterazioni inserito ï¿½ molto alto, l''esecuzione potrebbe essere piï¿½ lenta'); 
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
            function TestCase16(testCase)
            %Il test non passa se la tolleranza inserita dall'utente è
            %minore di eps
            [f,x0,TOL] = Richiama_Parametri();
            
                if(TOL < eps)
              verifyReturnsTrue(testCase,@false) 
                else
               verifyReturnsTrue(testCase,@true)
                end
            
            end
            
           function TestCase17(testCase)
            %Il test non passa se la tolleranza inserita dall'utente non è
            %un numero
            [f,x0,TOL] = Richiama_Parametri();
            
                  if(~isscalar(TOL) || ~isnumeric(TOL) || isinf(TOL) || isnan(TOL) )
              verifyReturnsTrue(testCase,@false) 
                  else
               verifyReturnsTrue(testCase,@true)
                  end
            
           end 
        
            
    end
end


