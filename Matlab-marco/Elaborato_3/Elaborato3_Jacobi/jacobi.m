function [x,output] = jacobi(A,b,TOL,x0,MAXITER)
% jacobi - Risoluzione di un sistema lineare Ax = b con A sparsa.
%   -   x = jacobi(A,b) risolve il sistema di equazioni lineari A*x = b. 
%         A deve essere una matrice quadrata sparsa, b deve essere un vettore 
%         colonna avente lo stesso numero di righe di A. La soluzione è corretta 
%         a meno di un errore dovuto al malcondizionamento della matrice A.
%   -   x = jacobi(A,b,TOL) usa TOL per determinare l'accuratezza della 
%         soluzione. Se non specificato, TOL=1e-7.
%   -   x = jacobi(A,b,TOL,x0) usa TOL per determinare l'accuratezza della 
%         soluzione e x0 come soluzione di partenza per le iterazioni 
%         dell'algoritmo. x0 deve essere specificato come un vettore colonna 
%         avente lo stesso numero di righe di A. Se non specificati, 
%         TOL=1e-7 e x0 è un vettore nullo.
%   -   x = jacobi(A,b,TOL,x0,MAXITER) usa TOL per determinare l'accuratezza 
%         della soluzione, x0 come soluzione di partenza per le iterazioni 
%         dell'algoritmo e MAXITER per individuare il numero massimo di 
%         iterazioni che l'algoritmo può compiere. Se non specificati, 
%         TOL=1e-7, x0 è un vettore nullo e MAXITER=200.
    
    n = controllo_A(A);
    controllo_vett_col(b,n);
    switch nargin
        case 5
            TOL = controllo_TOL(TOL);       
            controllo_vett_col(x0,n);
            controllo_MAXITER(MAXITER);
        case 4  
            % setto MAXITER di default
            MAXITER = 2000;
            TOL = controllo_TOL(TOL);         
            controllo_vett_col(x0,n);
        case 3
            % setto x0, MAXITER di default
            x0 = zeros(n,1);
            MAXITER = 2000;
            controllo_TOL(TOL);
        case 2
            % setto TOL, x0, MAXITER di default
            TOL = 1e-7;
            x0 = zeros(n,1);
            MAXITER = 2000;
        otherwise
            error('jacobi:Nargin','Il numero di parametri di input inseriti non è valido.');
    end
    
    x = x0;
    dA = diag(A); 
    % Inversa sparsa della matrice diag(A)
    dAinv = sparse(1:n,1:n,1./dA); 
    % Matrice di iterazione sparsa
    Bj = speye(n,n) - dAinv*A;
    
    % Controllo sull'underflow alla prima iterazione del ciclo
    TOLX = controllo_underflow(TOL,x);
    
    NITER=0; err=Inf;
    while err > TOLX && NITER < MAXITER
        x_old = x; % Salvo il valore della x per poter calcolare l'errore
        
        % x = (b-((A-diag(dA))*x))./dA;  % Formula scalare, timeit = 5.1754
        x = Bj*x + dAinv*b; % Formula matriciale, timeit = 2.0132
        
        err = norm(x-x_old,Inf); % Errore assoluto
        TOLX = controllo_underflow(TOL,x);
        NITER = NITER + 1;
    end

    % Il residuo relativo viene calcolato solo se l'utente specifica il
    % parametro di output oppure se l'algoritmo raggiunge il massimo numero
    % di iterazioni.
    if (MAXITER==NITER)
        resrel = norm(b-A*x,Inf)/norm(b,Inf);
        warning('jacobi:NonConvergence','Il numero di iterazioni effettuate non è sufficiente per raggiungere l''accuratezza desiderata. NITER=%d, RESIDUO=%s',NITER,resrel);
    end
    
    if nargout == 2
        output.NITER = NITER;
        output.resrel = norm(b-A*x,Inf)/norm(b,Inf); 
    end
end

function TOLX = controllo_underflow(TOL,x)
    TOLX = TOL*norm(x,Inf);
    if TOLX < realmin
        TOLX = realmin;
    end
end

function n = controllo_A(A)
    % A deve essere una matrice sparsa, quadrata, composta da numeri reali.
    % A non deve contenere elementi nulli sulla diagonale.
    n = size(A,1);
    
    if ~issparse(A)
        error('jacobi:ANotSparse','Matrice A non sparsa.');
    end
    
    if n ~= size(A,2)
        error('jacobi:ANotSquare','Matrice A non quadrata.');
    end
    
    if ~isnumeric(A) || any(find(isinf(A))) || any(find(isnan(A))) || ~isreal(A) || isempty(A)
        error('jacobi:AInvalidValue','Uno o più valori inseriti in A non sono validi');
    end
    
    if any(find(abs(diag(A)) < eps(norm(A,Inf))))==1
        error('jacobi:AZeroOnDiag','Non ci possono essere elementi nulli sulla diagonale di A.');
    end
    
end

function controllo_vett_col(vett,n)
    % vett deve essere un vettore colonna contenente numeri reali. Il numero
    % di righe deve essere pari al numero di righe di A, il numero di
    % colonne deve essere unitario.
    
    if size(vett,1) ~= n || size(vett,2)~=1
        error('jacobi:vettDimension','Dimensione del vettore errata.');
    end
    
    if ~isnumeric(vett) || any(find(isinf(vett))) || any(find(isnan(vett))) || ~isreal(vett) || isempty(vett)
        error('jacobi:vettInvalidValue','Uno o più valori inseriti nel vettore non sono validi');
    end
end

function TOL = controllo_TOL(TOL)
    % TOL è un intero positivo
    if ~isscalar(TOL) || ~isnumeric(TOL) || isinf(TOL) || isnan(TOL) || TOL <= 0
        error('jacobi:ErrorTOL','TOL deve essere un numero positivo');
    end

    % Segnalo (eventualmente) che il TOL specificato è troppo piccolo
    if TOL < eps
        warning('jacobi:TOLminEPS','Il valore di TOL specificato è troppo piccolo. Verrà usato il valore di default TOL = 1e-7');
        TOL = 1e-7;
    end
    
    if TOL >= 1
        warning('jacobi:TOLtooHigh','Il valore di TOL specificato è troppo grande. Il risultato fornito potrebbe essere molto inaccurato. Si guardi la documentazione.');
    end
end

function MAXITER = controllo_MAXITER(MAXITER)
    % MAXITER deve essere un intero positivo
    if ~isscalar(MAXITER) || ~isnumeric(MAXITER) || isinf(MAXITER) || isnan(MAXITER) || MAXITER <= 0 || mod(MAXITER,1) > eps
    	error('jacobi:ErrorMAXITER','MAXITER deve essere un intero positivo');
    end
    
    % Segnalo se NMAX è piccolo
    if MAXITER < 10
        warning('jacobi:WarningMinMAXITER','Il numero di iterazioni specificato è molto piccolo, l''errore di calcolo potrebbe essere elevato');
    end
    
    % Segnalo se NMAX è grande
    if MAXITER > 10000
    	warning('jacobi:WarningMaxMAXITER','Il numero di iterazioni specificato è molto alto, l''esecuzione potrebbe essere più lenta');
    end
    
end
