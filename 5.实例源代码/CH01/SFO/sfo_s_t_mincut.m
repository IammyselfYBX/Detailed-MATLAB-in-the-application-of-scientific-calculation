% Finding the minimum A of a submodular function such that s in A and t not in A
% Implementation by Andreas Krause (krausea@gmail.com)
%
% function A = sfo_s_t_mincut(F,V,s,t)
% F: Submodular function
% V: index set
% A: starting point for search; can be left
%
% Example: 
%   G = [1 1 0; 1 0 1; 0 1 1]; F = @(A) sfo_fn_cutfun(G,A)
%   A = sfo_s_t_mincut(F,1:3,2,1)


function A = sfo_s_t_mincut(F,V,s,t)
% F2 guarantees we pick s
F2 = @(A) F([A s]);
% V2 guarantees we can't pick s and t
V2 = setdiff(V,[s,t]);
A = sfo_min_norm_point(F2,V2);
A = [A s];
