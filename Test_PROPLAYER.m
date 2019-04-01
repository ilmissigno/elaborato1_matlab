classdef Test1 < matlab.unittest.TestCase
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
   
   
    methods(Test)
        
       
            function TestCase1(testCase)
           %verifica l'errore nel caso in cui le soluzioni dell'algoritmo
           %sono uguali
          
           [f,x0] = Richiama_Parametri();
             [x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
            verifyEqual(testCase,0,uscita.fx,'soluzione uguali');
            
             
            end
             
            
              function TestCase2(testCase)
           %verifica l'errore nel caso in cui il primo estremo o il secondo estremo dell'intervallo inserito
           %non � un numero
          
           [f,x0] = Richiama_Parametri();
             %[x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
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
             %[x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
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
             %[x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
            verifyNotEqual(testCase,x0(1),x0(2));
            
       end       
        
       
       function TestCase5(testCase)
           %verifica l'errore nel caso in cui i valori dell'intervallo non
           %sono validi, poich� o inseriamo un numero di elementi diverso
           %da 2 come lunghezza dell'intervallo
          
           [f,x0] = Richiama_Parametri();
             %[x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
            if(length(x0)~=2)
                verifyReturnsTrue(testCase,@false);
            else 
                verifyReturnsTrue(testCase,@true);
            end
            
       end 
        
       
       function TestCase6(testCase)
           %verifica l'errore nel caso in cui non � soddisfatto il teorema
           %degli zeri
          
           [f,x0] = Richiama_Parametri();
             %[x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
            if(f(x0(1))*f(x0(2)) > 0)
                verifyReturnsTrue(testCase,@false);
            else 
                verifyReturnsTrue(testCase,@true);
            end
            
              end
        
    end
end


