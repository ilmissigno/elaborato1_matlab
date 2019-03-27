%% Main function to generate tests
function tests = test_suite
    tests = functiontests(localfunctions);
end
% Lanciare la simulazione con l'istruzione:
% results = runtests('test_suite.m');

%% Test Functions
function testFunctionCase1(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  non sparsa
%   - b ->  valido
%   - TOL -> don't care
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    A = rand(10);
    x= ones(10,1);
    b = A*x;
    
    testCase.verifyError(@()jacobi(A,b),'jacobi:ANotSparse')
end

function testFunctionCase2(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  non quadrata
%   - b ->  valido
%   - TOL -> don't care
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    A = sprand(10,15,0.1);
    x= ones(15,1);
    b = A*x;
    
    testCase.verifyError(@()jacobi(A,b),'jacobi:ANotSquare')
end

%% Test Functions
function testFunctionCase3(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  non sparsa
%   - b ->  valido
%   - TOL -> don't care
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    A = sprand(10,10,0.1);
    A(1,1) = 0;
    x= ones(10,1);
    b = A*x;
    
    testCase.verifyError(@()jacobi(A,b),'jacobi:AZeroOnDiag')
end

function testFunctionCase4(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  valido
%   - TOL -> TOL < eps
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    
    A = sprand(10,10,0.1) + speye(10,10);
    x= ones(10,1);
    b = A*x;
    TOL = 1*10^-18;
    testCase.verifyWarning(@()jacobi(A,b,TOL),'jacobi:TOLminEPS')
end

function testFunctionCase5(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  valido
%   - TOL -> TOL < 0
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    A = sprand(10,10,0.1) + speye(10,10);
    x= ones(10,1);
    b = A*x;
    TOL = -1;
    testCase.verifyError(@()jacobi(A,b,TOL),'jacobi:ErrorTOL')
end

function testFunctionCase6(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  valido
%   - TOL -> TOL > 1
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    A = sprand(10,10,0.1) + speye(10,10);
    x= ones(10,1);
    b = A*x;
    TOL = 10;
    testCase.verifyWarning(@()jacobi(A,b,TOL),'jacobi:TOLtooHigh')
end

function testFunctionCase7(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  valido
%   - TOL -> valido
%   - x0 -> valido
%   - MAXITER -> valido
%   L'algoritmo raggiunge il max numero di iterazioni

% Test specific code
    
    A = sprand(10,10,0.1) + speye(10,10) ;
    x= ones(10,1);
    b = A*x;
    TOL = 1e-7;
    x0 = zeros(10,1);
    MAXITER = 5;
    testCase.verifyWarning(@()jacobi(A,b,TOL,x0,MAXITER),'jacobi:WarningMinMAXITER')
end

function testFunctionCase8(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  valido
%   - TOL -> valido
%   - x0 -> valido
%   - MAXITER -> non valido

% Test specific code
    
    A = sprand(10,10,0.1) + speye(10,10) ;
    x= ones(10,1);
    b = A*x;
    TOL = 1e-7;
    x0 = zeros(10,1);
    MAXITER = -1;
    testCase.verifyError(@()jacobi(A,b,TOL,x0,MAXITER),'jacobi:ErrorMAXITER')
end

function testFunctionCase9(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  non valido
%   - TOL -> don't care
%   - x0 -> don't care
%   - MAXITER -> don't care

% Test specific code
    
    A = sprand(10,10,0.1) + speye(10,10) ;
    b = rand(10);
    
    testCase.verifyError(@()jacobi(A,b),'jacobi:vettDimension')
end

function testFunctionCase10(testCase)
% Configurazione parametri bisection_algorithm
%   - A ->  valida
%   - b ->  valido
%   - TOL -> valido
%   - x0 -> non valido
%   - MAXITER -> don't care

% Test specific code
    
    A = sprand(10,10,0.1) + speye(10,10) ;
    b = rand(10);
    TOL = 1e-7;
    x0 = zeros(9,1);
  
    testCase.verifyError(@()jacobi(A,b,TOL,x0),'jacobi:vettDimension')
end




