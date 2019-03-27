function compute_performance(fun,range,TOL)
% compute_performance   stampa su un istogramma i risultati, in termini di
% numero di iterazioni, relativi alle funzioni fzero e bisection_alorithm,
% per diversi valori di tolleranza.
    res_bisalgo = zeros(1,9);
    res_fzero = zeros(1,9);
    for i = 1:9
        [~, output] = bisection_algorithm(fun,range,TOL(i));
        res_bisalgo(i) = output.niter;
        options = optimset('TolX',TOL(i));
        [~, ~, ~, output] = fzero(fun,range,options);
        res_fzero(i) = output.iterations;
    end
    data = [res_bisalgo' res_fzero'];
    x = categorical(TOL);
    bar(x,data )
    set ( gca, 'xdir', 'reverse' )
    xlabel('TOL')
    ylabel('Numero di iterazioni')
    title('Confronto numero di iterazioni al variare di TOL')
    legend(gca, 'Location', 'northwest');
    legend('bisection\_algorithm','fzero')
end

