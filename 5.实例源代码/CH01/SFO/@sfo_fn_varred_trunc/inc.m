% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
function [scoreNew,F] = inc(F,A,el)

F = init(F,A);

oldScore = get(F,'current_val');

if sum(A == el)>0
    scoreNew = oldScore;
    return
end
comp = sfo_setdiff_fast(F.V,[A el]);


F.Ainv = sfo_inv_update( F.Ainv, F.sigma(A,el), F.sigma(el,el));

sset = [A el];
varPost = 0;
for i = 1:length(comp)
    s = comp(i);
    v = F.sigma(s,s)-F.sigma(s,sset)*F.Ainv*F.sigma(sset,s);
    varPost = varPost + max(v-F.trunc_thresh,0);
end       
scoreNew = (F.varPrior-varPost)/length(F.V);

F = set(F,'current_val',scoreNew,'current_set',sset);
