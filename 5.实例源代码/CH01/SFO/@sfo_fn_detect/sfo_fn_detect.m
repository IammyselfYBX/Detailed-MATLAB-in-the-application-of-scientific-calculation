% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
%
% detmat is a N x D (sparse) matrix where N is #sensors, D is #scenarios;
% detmat(i,j) is benefit if sensor i detects scenario j
function F = sfo_fn_detect(detmat,V)
F.detmat = detmat';

F.V = V;

F.curmax = zeros(1,size(F.detmat,1));
F.marginals = sum(F.detmat);

F = class(F,'sfo_fn_detect',sfo_fn);
F = set(F,'current_set',-1);
