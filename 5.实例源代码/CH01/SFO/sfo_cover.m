% Andreas Krause (krausea@gmail.com)
% solve the submodular coverage problem using greedy algorithm
%
% function [A, stat] = sfo_cover(F,V,Q,C)
% F: submodular function
% V: index set
% Q: quota to achieve
% C: Cost vector (optional). C(i) is cost of element V(i)
%
% returns solution sset with F(sset)>=Q, or sset = V
% stat == 1 iff F(sset)>=Q, 0 otherwise
%
% Example: A = sfo_cover(@sfo_fn_example,1:2,2);

function [A, stat] = sfo_cover(F,V,Q,C,maxCost)
% if no argument specified, assume unit cost
if ~exist('C','var') 
    C = ones(1,length(V));
end
if ~exist('maxCost','var') 
    maxCost = inf;
end
TOL = 1e-6;

%Fc = @(A) min(F(A),Q); %truncate the function
Fc = sfo_fn_trunc(F,Q);


% use the greedy algorithm on the truncated function
A = sfo_greedy_lazy(Fc,V,maxCost,C,1);
if F(A)<Q-TOL
    stat = 0;
else
    stat = 1;
end
