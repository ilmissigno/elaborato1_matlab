classdef exec_tests < matlab.unittest.TestCase

    %NB i test  vanno in ordine!
    %forse testare una funz alla volta
    properties
        f
        x0
        TOL
        NMAX
    end

    methods


        function obj=exec_tests(f,x0,TOL,NMAX)

            if(nargin==4)
                obj.f =f;
                obj.x0=x0;
                obj.TOL=TOL;
                obj.NMAX=NMAX;
            else if (nargin==3)
                    obj.f =f;
                    obj.x0=x0;
                    obj.TOL=TOL;
                else if(nargin==2)
                        obj.f =f;
                        obj.x0=x0;
                    else (nargin==1)
                        obj.f =f;
                    end

                end
            end
        end
    end

    methods(Test)
        function TestCase1(testCase)
            %Verifica se la funzione non � presente


            %Ho problemi ad implementarla nel test
            verifyNotEmpty(testCase,testCase.f);
        end

        function TestCase2(testCase)
          % Verifica se la funzione � Handle

            %SI DEVE IMPLEMENTARE COME CONTROLLO SU F NEL PROGRAMMA
            %PRINCIPALE
            if(isa(testCase.f,'function_handle'))
                %passato
                verifyReturnsTrue(testCase,@true);
            else
                %non passato
                verifyReturnsTrue(testCase,@false);
            end
        end

        function TestCase3(testCase)
            %verifica l'errore nel caso in cui entrambi i valori
            %dell'intervallo sono vuoti


            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:IntevalloVuoto');

            verifyReturnsTrue(testCase,@true);


        end

         function TestCase4(testCase)
            %verifica l'errore nel caso in cui il primo estremo o il secondo estremo dell'intervallo inserito
            %non � un numero


            testCase.x0(1)
            testCase.x0(2)
            testCase.TOL
            testCase.NMAX
            testCase.f



            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:NonunNumero');


         end

         function TestCase5(testCase)
            %verifica l'errore nel caso in cui i valori dell'intervallo non
            %sono validi, poich� o inseriamo un numero di elementi diverso
            %da 2 come lunghezza dell'intervallo
            %DA TOGLIERE O RIMANERE COSI

            if(length(testCase.x0)~=2)
                verifyReturnsTrue(testCase,@false);
            else
                verifyReturnsTrue(testCase,@true);
            end

         end

        function TestCase6(testCase)
            %verifica l'errore nel caso in cui entrambi i valori
            %dell'intervallo sono uguali
            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'algoritmo_di_bisezione:EstremiIntervallo');


        end

        function TestCase7(testCase)
            %verifica l'errore nel caso in cui non � soddisfatto il teorema
            %degli zeri
            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:TeoremaDegliZeriNonSoddisfatto');


        end

         function TestCase8(testCase)
            %Il test non passa se la tolleranza non � inserita dall'utente

            verifyWarning(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'WARN:TolleranzaNonInserita');

         end
         function TestCase9(testCase)
            %Il test non passa se la tolleranza inserita dall'utente �
            %minore di eps

            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:TolleranzaMINESP');


        end

        function TestCase10(testCase)
            %Il test non passa se la tolleranza inserita dall'utente non �
            %un numero

            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:TolleranzaNumReale');

        end
         function TestCase11(testCase)
            %Caso 12 : Verifica se il valore di NMAX
            %non � numerico, non � scalare, � infinito
            %oppure � NaN

            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:NMAXINTEROPOsitivo');


        end

        function TestCase12(testCase)
            % Verifica se il valore di NMAX
            %� minore o uguale a 0
            %Richiamo i parametri

            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:NMAXINTEROPOsitivo');
        end

        function TestCase13(testCase)
            %Verifica se il valore di NMAX
            %� minore o uguale a 2


            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX), 'Err:NMAXI<2');

        end

        function TestCase14(testCase)
            %Verifica se il valore di NMAX
            %� maggiore o uguale a 1000
            

            verifyWarning(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX), 'WARN:NMAXI>1000');

        end

         function TestCase15(testCase)

            verifyError(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'Err:Superato il numero massimo di Iterazioni-SOluzione non determinata' );

         end

        function TestCase16(testCase)
            %verifica se l'accuratezza � adeguata con TOL=eps

            [x, ~, ~]= algoritmo_di_bisezione(testCase.f,testCase.x0);
            actSolution=x;
            expSolution= fzero(testCase.f,testCase.x0);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            %FATTA BENE forse poco utile
        end

        function TestCase17(testCase)
            %verifica se l'accuratezza � adeguata con TOL inserito da Utente

            [x, ~, ~]= algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL);
            actSolution=x;
            options = optimset('TolX',testCase.TOL);
            expSolution=fzero(testCase.f,testCase.x0,options);
            abs_error = abs(actSolution - expSolution)/abs(expSolution);
            verifyLessThan(testCase,abs_error,eps*max(actSolution,expSolution),'Risultato poco accurato');
            %FATTA BENE
        end

























        function TestCase18(testCase)

            verifyWarning(testCase,@()algoritmo_di_bisezione(testCase.f,testCase.x0,testCase.TOL,testCase.NMAX),'WARN:Numero di iterazioni alte,prestazioni non ottimali');

        end

    end


end
