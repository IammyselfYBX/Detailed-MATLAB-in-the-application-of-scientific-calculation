% The submodular-supermodular procedure of Narasimhan & Bilmes 
% Implemented by Andreas Krause (krausea@gmail.com)
% This algorithm is guaranteed to converge to a local optimum
%
% function A = sfo_sssp(F,G,V)
% F: submodular function
% G: submodular function
% V: index set
% Returns a locally optimal solution to the problem A = argmin_A F(A)-G(A)
%
% Example: See sfo_tutorial.m

function A = sfo_sssp(F,G,V)
N = length(V);
pi = V(randperm(N));
bestVal = inf;
A = [];
TOL = 1e-6;
while 1
    H = sfo_sssp_modular_approx(G,pi);
    FM = @(A) F(A)-sum(H(A));
    A = sfo_min_norm_point(FM,V,A);
    curVal = FM(A);
    D = sfo_setdiff_fast(V,A);
    D = D(randperm(length(D)));
    pi = [A D];
    if curVal<bestVal-TOL
        bestVal = curVal;
    else
        break;
    end    
end

function H = sfo_sssp_modular_approx(G,pi)
H = zeros(1,max(pi(:)));
W = [];
oldVal = G(W);
for i = 1:length(pi)
    newVal = G([W pi(i)]);
    H(pi(i)) = newVal-oldVal;
    oldVal = newVal;
    W = [W pi(i)];
end

