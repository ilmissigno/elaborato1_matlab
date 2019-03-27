function x = back_substitution(A,b)
    % Verifico che la matrice è non singolare
    if any(find(abs(diag(A)) < eps(norm(A))))==1
        error('risolve:ASingular','Matrice A singolare.');
    end
    
    n=size(A,1);
    x = zeros(n,1);
    
    x(n,1)=b(n)/A(n,n);
    for i=n-1:-1:1
        x(i,1) = (b(i)- A(i,i+1:n)*x(i+1:n,1))/A(i,i);
    end
end

