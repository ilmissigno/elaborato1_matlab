classdef exec_tests < matlab.unittest.TestCase
    
  properties
      f
      x0
     TOL
      NMAX
  end 
  
  methods
      
      function obj=exec_tests(f,x0,TOL,NMAX)
          obj.f =f;
           obj.x0=x0;
           obj.TOL=TOL;
           obj.NMAX=NMAX;
          
          
          
      end
      end
 
  
    methods(Test) 
            
  
              function TestCase2(testCase)
           %verifica l'errore nel caso in cui il primo estremo o il secondo estremo dell'intervallo inserito
           %non � un numero
                
                %[f,x0] = Richiama_Parametri();
                testCase.x0(1)
                testCase.x0(2)
                 testCase.TOL
                    testCase.NMAX
                    testCase.f
                    
                 
                if(~isnumeric(testCase.x0(1)) || ~isnumeric(testCase.x0(2)))
                verifyReturnsTrue(testCase,@false);
                else 
                verifyReturnsTrue(testCase,@true);
                end
            
              end
        
             
            function TestCase3(testCase)
           %verifica l'errore nel caso in cui entrambi i valori
           %dell'intervallo sono vuoti
          
          % [f,x0] = Richiama_Parametri();
            
                if(isempty(testCase.x0(1)) && isempty(testCase.x0(2)))
                    verifyReturnsTrue(testCase,@false);
                else 
                    verifyReturnsTrue(testCase,@true);
                end
            
            end  
             
            
            
       function TestCase4(testCase)
           %verifica l'errore nel caso in cui entrambi i valori
           %dell'intervallo sono uguali
          
           %[f,x0] = Richiama_Parametri();
           verifyNotEqual(testCase,testCase.x0(1),testCase.x0(2));
            
       end       
        
       
       function TestCase5(testCase)
           %verifica l'errore nel caso in cui i valori dell'intervallo non
           %sono validi, poich� o inseriamo un numero di elementi diverso
           %da 2 come lunghezza dell'intervallo
          
           %[f,x0] = Richiama_Parametri();
            if(length(testCase.x0)~=2)
                verifyReturnsTrue(testCase,@false);
            else 
                verifyReturnsTrue(testCase,@true);
            end
            
       end 
        
       
       function TestCase6(testCase)
           %verifica l'errore nel caso in cui non � soddisfatto il teorema
           %degli zeri
          
           %[f,x0] = Richiama_Parametri();
            if(testCase.f(testCase.x0(1))*testCase.f(testCase.x0(2)) > 0)
                verifyReturnsTrue(testCase,@false);
            else 
                verifyReturnsTrue(testCase,@true);
            end
            
       end
        
         function TestCase7(testCase)
            %verifica se l'accuratezza � adeguata con TOL=eps
            %[f,x0] = Richiama_Parametri();
            [x, ~, ~]= algoritmo_di_bisezione(testCase.f,testCase.x0);
            actSolution=x;
            expSolution= fzero(testCase.f,testCase.x0);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            
         end
        
        function TestCase8(testCase)
            %verifica se l'accuratezza � adeguata con TOL inserito da Utente
           % [f,x0,TOL] = Richiama_Parametri();
            [x, ~, ~]= algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL);
            actSolution=x;
            options = optimset('TolX',testCase.TOL);
            expSolution=fzero(testCase.f,testCase.x0,options);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            
        end
        
        function TestCase9(testCase)
            %Il test non passa se la tolleranza non � inserita dall'utente
            %[f,x0,TOL] = Richiama_Parametri();
            verifyNotEmpty(testCase,testCase.TOL);
            
        end
        
       
       
       
              function TestCase10(testCase)
           %Caso 10 : Verifica se la funzione � Handle
           %Richiamo i parametri
            %[f,~,~,~] = Richiama_Parametri();

                if(isa(testCase.f,'function_handle'))
                   %passato
                    verifyReturnsTrue(testCase,@true);
                else
                    %non passato
                    verifyReturnsTrue(testCase,@false);
                end
           end
           
           function TestCase11(testCase)
               %Caso 11 : Verifica se la funzione non � presente
               %Richiamo i parametri
                %[f,~,~,~] = Richiama_Parametri();
                verifyNotEmpty(testCase,testCase.f);
           end
           
           function TestCase12(testCase)
               %Caso 12 : Verifica se il valore di NMAX 
               %non � numerico, non � scalare, � infinito
               %oppure � NaN
               %Richiamo i parametri
                %[~,~,~,NMAX] = Richiama_Parametri();
                if(~isscalar(testCase.NMAX) || ~isnumeric(testCase.NMAX) || isinf(testCase.NMAX) || isnan(testCase.NMAX))
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase13(testCase)
               %Caso 13 : Verifica se il valore di NMAX 
               %� minore o uguale a 0
               %Richiamo i parametri
                %[~,~,~,NMAX] = Richiama_Parametri();
                if(testCase.NMAX<=0)
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase14(testCase)
               %Caso 14 : Verifica se il valore di NMAX 
               %� minore o uguale a 2
               %Richiamo i parametri
                [~,~,~,NMAX] = Richiama_Parametri();
                if(testCase.NMAX<=2)
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
           function TestCase15(testCase)
               %Caso 15 : Verifica se il valore di NMAX 
               %� maggiore o uguale a 1000
               %Richiamo i parametri
                %[~,~,~,NMAX] = Richiama_Parametri();
                if(testCase.NMAX>=1000)
                    warning('Il numero di iterazioni inserito � molto alto, l''esecuzione potrebbe essere pi� lenta'); 
                    verifyReturnsTrue(testCase,@false)
                else
                    verifyReturnsTrue(testCase,@true)
                end
           end
           
            function TestCase16(testCase)
            %Il test non passa se la tolleranza inserita dall'utente �
            %minore di eps
           % [f,x0,TOL] = Richiama_Parametri();
            
                if(testCase.TOL < eps)
              verifyReturnsTrue(testCase,@false) 
                else
               verifyReturnsTrue(testCase,@true)
                end
            
            end
            
           function TestCase17(testCase)
            %Il test non passa se la tolleranza inserita dall'utente non �
            %un numero
           % [f,x0,TOL] = Richiama_Parametri();
            
                  if(~isscalar(testCase.TOL) || ~isnumeric(testCase.TOL) || isinf(testCase.TOL) || isnan(testCase.TOL) )
              verifyReturnsTrue(testCase,@false) 
                  else
               verifyReturnsTrue(testCase,@true)
                  end
            
           end 
        
            
    end
end


