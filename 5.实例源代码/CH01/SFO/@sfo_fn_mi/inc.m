% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information

function [newScore,F] = inc(F,A,el)
F = init(F,A);

if sum(A==el)>0
    newScore = get(F,'current_val');
    return;
end
n=size(F.sigma,1);
Ac = sfo_setdiff_fast(1:n,[A el]);
        
% need to update cholA and downdate cholAc

F.indsA = [F.indsA el];
pos = find(F.indsAc == el);
F.invAc = sfo_inv_downdate(F.invAc, pos);
F.indsAc = F.indsAc([1:(pos-1) (pos+1):length(F.indsAc)]);

if (isempty(A))
    sigmaXgA = F.sigma(el,el);
else
    sigmaXgA = F.sigma(el,el)-F.sigma(el,A)*(F.cholA\(F.cholA'\F.sigma(A,el)));
end
[F.cholA,rankok] = sfo_chol_update(F.sigma, A, el, F.cholA, 1e-10);
if (~rankok)
    error('matrix singular');
end

sigmaXgAc = F.sigma(el,el)-F.sigma(el,Ac)*(F.invAc*F.sigma(Ac,el));
%sigmaXgAc = sigma(el,el)-sigma(el,Ac)*(F_state.cholAc\(F_state.cholAc'\sigma(Ac,el)));

H = 1/2*log2(2*pi*exp(1)) + 1/2*sum(log2(sigmaXgA));
Hcond = 1/2*log2(2*pi*exp(1)) + 1/2*sum(log2(sigmaXgAc));

mi = H-Hcond;

newScore = get(F,'current_val')+mi;
F = set(F,'current_val',newScore,'current_set',[A el]); %REALLY?
