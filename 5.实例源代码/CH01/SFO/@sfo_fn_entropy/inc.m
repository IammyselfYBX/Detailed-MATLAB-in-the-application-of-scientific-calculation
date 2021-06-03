% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information

function [newScore,F] = inc(F,A,el)
F = init(F,A);

if sum(A==el)>0
    newScore = get(F,'current_val');
    return;
end
        
% need to update cholA
F.indsA = [F.indsA el];

if (isempty(A))
    sigmaXgA = F.sigma(el,el);
else
    sigmaXgA = F.sigma(el,el)-F.sigma(el,A)*(F.cholA\(F.cholA'\F.sigma(A,el)));
end
[F.cholA,rankok] = sfo_chol_update(F.sigma, A, el, F.cholA, 1e-10);
if (~rankok)
    error('matrix singular');
end

H = 1/2*log2(2*pi*exp(1)) + 1/2*sum(log2(sigmaXgA));

newScore = get(F,'current_val')+H;
F = set(F,'current_val',newScore,'current_set',[A el]); 
