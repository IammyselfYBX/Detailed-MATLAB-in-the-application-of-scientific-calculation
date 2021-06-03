% The CELF algorithm from Leskovec et al, KDD '07
% Author: Andreas Krause (krausea@gmail.com)
%
% function A = sfo_celf(F,V,B,C)
% F: submodular function
% V: index set
% B: budget 
% C: Cost vector. C(i) is cost of element V(i)
%
% Example: A = sfo_celf(@sfo_fn_example,1:2,1, ones(1,2))

function A = sfo_celf(F,V,B,C)
[A1,S1] = sfo_greedy_lazy(F,V,B,C,0);
[A2,S2] = sfo_greedy_lazy(F,V,B,C,1);
disp(sprintf('Unit cost solution = %f, Cost-benefit solution = %f',S1(end),S2(end)));
if S1(end)>S2(end)
    A = A1;
else
    A = A2;
end
