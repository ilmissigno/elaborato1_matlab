% Calcolo l'andamento dell'algoritmo 'PageRank' al variare del numero di
% input.

N=1000;
T=zeros(1,N);

for i=1:N
     G = rand(i);
     G(G<0.5) = 0;
     G = sparse(logical(G));
     tic;
     PageRank(G);
     T(i)=toc;
end

x = linspace(1,N,N);

c=polyfit(x,T,2);
t=10:0.001:N;
v=polyval(c,t);
p = plot(x,T,'o',t,v);
p(2).LineWidth = 2;