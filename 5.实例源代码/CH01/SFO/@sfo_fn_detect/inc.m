% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information

function [newScore,F] = inc(F,A,el)
F = init(F,A);

if sum(A==el)>0
    newScore = get(F,'current_val');
    return;
end

if isempty(A)
    newScore = F.marginals(el);
else
    F.curmax = max(F.curmax,F.detmat(:,el));
    newScore = full(sum(F.curmax));
    F = set(F,'current_val',newScore,'current_set',[A el]);
end

