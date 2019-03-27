%% Main function to generate tests
function tests = test_suite
    tests = functiontests(localfunctions);
end
% Lanciare la simulazione con l'istruzione:
% results = runtests('test_suite.m');

%% Test Functions
function testFunctionCase1(testCase)
% Configurazione parametri bisection_algorithm
%   - G -> vuota

% Test specific code
    G = [];
    testCase.verifyError(@()PageRank(G),'PageRank:GNotValid')
end

function testFunctionCase2(testCase)
% Configurazione parametri bisection_algorithm
%   - G -> non sparsa

% Test specific code
    G = rand(10,10);
    testCase.verifyError(@()PageRank(G),'PageRank:GNotValid')
end

function testFunctionCase3(testCase)
% Configurazione parametri bisection_algorithm
%   - G -> non quadrata

% Test specific code
    G = rand(10,15);
    testCase.verifyError(@()PageRank(G),'PageRank:GNotValid')
end

function testFunctionCase4(testCase)
% Configurazione parametri bisection_algorithm
%   - G -> not logical

% Test specific code
    G = round(sprand(10,10,0.2)*10);
    testCase.verifyWarning(@()PageRank(G),'PageRank:GNotLogical')  
end

function testFunctionCase5(testCase)
% Configurazione parametri bisection_algorithm
%   - G -> valido
% Verifico che i self loop non influenzano l'esecuzione dell'algoritmo
    
    G_loop = round(sprand(10,10,0.2)*10) + spdiags(ones(10,1),0,10,10);
    G = G_loop - spdiags(G_loop,0,10,10);

    R_loop = PageRank(G_loop);
    R = PageRank(G);
    
    if abs(R_loop-R)<eps
        % passed
        verifyReturnsTrue(testCase,@true);
    else
        % not passed
        verifyReturnsTrue(testCase,@false);
    end
end

