function [R,OUT,IN] = PageRank(G)
% PageRank - calcola il PageRank secondo l'algoritmo di Google per l’ordinamento dei siti web.
%    - [R OUT IN] = PageRank(G) calcola il rank delle pagine web di cui G rappresenta la matrice di
%       adiacenza. Essa deve essere una matrice quadrata sparsa, costituita da elementi logical. La
%       funzione, inoltre, restituisce gli outdegree OUT e indegree IN delle pagine.
    
    n = size(G,1);
    
    if isempty(G) || ~issparse(G) || size(G,2)~=n
        error('PageRank:GNotValid','La struttura G non è valida');
    end
    
    if ~islogical(G)
        warning('PageRank:GNotLogical','I valori della matrice G saranno considerati LOGICAL.');
        G = logical(G);
    end
    
    TOL = 1e-7;
    p = 0.85;
    
    % Risolvo i self-loop
    if any(find(abs(diag(G)) ~= 0))
        G = spdiags(zeros(n,1),0,G);
    end

    % e: è il vettore unitario colonna per cui sarà moltiplicato il fattore
    % "correttivo" per i rank-sink
    e=ones(n,1);
    
    R=ones(n,1)/n; % Soluzione iniziale

    % Calcola tutti gli Nj, per ogni colonna,
    % determinando il vettore degli outdegree
    N = full(sum(G));

    % z_j = (1-p)/n se N_j ~= 0, 1/n se N_j = 0 (dangling nodes)
    z = (1-p)/n *(N~=0) + (N==0)/n;

    % Calcolo la matrice diagonale (la memorizzo come un vettore!)
    N(N~=0)=1./N(N~=0);

    TOLX = controllo_underflow(TOL,R);
    
    % L'espressione viene calcolata solo una volta
    pGD = p*G.*N;
    
    err=Inf; NITER=0;
    while err > TOLX || NITER == 100 % NITER=100 è l'uscita di sicurezza dal ciclo
        NITER=NITER+1;
        R_old = R; % Salvo il valore della R per poter calcolare l'errore

        R=pGD*R_old+e*z*R_old;

        err = norm(R-R_old,Inf); % Errore assoluto
        TOLX = controllo_underflow(TOL,R);
    end
    
    IN = full(sum(G,2));
    OUT = full(sum(G,1))';

end

function TOLX = controllo_underflow(TOL,x)
    TOLX = TOL*norm(x,Inf);
    if TOLX < realmin
        TOLX = realmin;
    end
end
