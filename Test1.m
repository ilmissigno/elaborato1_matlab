classdef Test1 < matlab.unittest.TestCase
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
   
   
    methods(Test)
        
       
            function TestCase1(testCase)
           %verifica l'errore nel caso in cui il valore della funz inserito
           %non � valido
          
           [f,x0] = Richiama_Parametri();
             [x, uscita, graf]= algoritmo_di_bisezione(f,x0);
            %testa l'errore
            verifyEqual(testCase,0,uscita.fx,'soluzione uguali');
            %import matlab.unittest.constraints.IsEmpty
           
            %x0 = testCase.TestFigure.CurrentObject;
            
             
        end
        
        
    end
end


