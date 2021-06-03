% Andreas Krause (krausea@cs.cmu.edu)
% outer binary search loop for saturate algorithm
%
% function [ssetMax,ssetMin,maxc,minc] = sfo_saturate(F,V,k,maxc,direction)
% F: thresholdable submodular function (takes set and threshold)
% V: index set
% k: #elements to pick
% maxc (optional): upper bound on function value
% direction (opt): 1 tries to minimize threshold; -1 tries to maximize
%
% Example: (also see sfo_tutorial.m)
%   F = @(A,thr) sfo_fn_sat_varred(0.5*eye(10)+0.5*ones(10),A,thr)
%   A = sfo_saturate(F,1:10,3)

function [ssetMax,ssetMin,maxc,minc] = sfo_saturate(F,V,k,maxc,direction,coverFn)
if ~exist('maxc','var')
    maxc = sfo_maxbound(F,V); % compute unconstrained bound
end
if ~exist('direction','var')
    direction = 1;
end
if ~exist('coverFn','var')
    coverFn = @(F, V, B) sfo_greedy_lazy(F, V, B);
end

TOL = 1e-6;

minc = 0;
ssetMin = [];
ssetMax = [];
maxiter = 50;

iter = 0;
while ~((length(ssetMax)<=k && iter>=maxiter) || abs(maxc-minc)<TOL)
    iter = iter+1;
    testc = mean([minc,maxc]);
    disp(sprintf('interval [%f,%f], size(ssetMax,Min)=%d,%d',minc,maxc,length(ssetMax),length(ssetMin)));

    satF = trunc(F,testc); %@(A) F(A,testc);
    sset = coverFn(satF,V,k+1);
    
    if direction*length(sset)>direction*k
        minc = testc;
        ssetMin = sset;
    else
        maxc = testc;
        ssetMax = sset;
    end
    if (iter>maxiter && direction==-1 && length(ssetMin)<=k)
        ssetMax = ssetMin;
        break;
    end
end
