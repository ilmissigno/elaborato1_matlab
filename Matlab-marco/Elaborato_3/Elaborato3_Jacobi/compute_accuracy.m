function output = compute_accuracy(A,x,TOL,x0,MAXITER)
    switch nargin
        case 4  
            MAXITER = 2000;
        case 3
            x0 = zeros(size(A,1),1);
            MAXITER = 2000;
        case 2
            TOL = 1e-7;
            x0 = zeros(size(A,1),1);
            MAXITER = 2000;
    end
    b = A*x;
    [xc,jOut] = jacobi(A,b,TOL,x0,MAXITER);
    
    output.condizionamento = condest(A);
    output.errore_relativo = norm(x-xc,Inf)/norm(xc,Inf);
    output.niter = jOut.NITER;
    output.residuo_relativo = jOut.resrel;
    spy(A);
end

