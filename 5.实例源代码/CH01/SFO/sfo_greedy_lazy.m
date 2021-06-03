% Andreas Krause (krausea@gmail.com)
% compute the greedy subset selection using lazy evaluations
%
% function [sset,scores,evalNum] = sfo_greedy_lazy(F,V,B,C,useCB) 
% F: submodular function
% V: index set
% B: budget 
% C: Cost vector (optional). C(i) is cost of element V(i)
% useCB (optional): use cost benefit rule to select element
% checkIndep (optional): function to check if a set is independent
%   for optimizing F subject to a matroid constraint
%
% returns solution sset with C(sset)<=B
% scores(i) is the greedy score after element i was added
% evalNum(i) is the # of function evaluations in iteration i
%
% Example: A = sfo_greedy_lazy(@sfo_fn_example,1:2,1)

function [sset,scores,evalNum] = sfo_greedy_lazy(F,V,B,C,useCB,checkIndep) 
n=length(V);
if ~exist('C','var')
    C = ones(1,n); %assume unit cost
    useCB = 0;
end
deltas = inf*ones(1,length(V)); %initialize optimistically

TOL = 1e-6;

sset = []; %start with empty set

curVal = 0;
curCost = 0; %no cost

evalNum = []; scores = []; %keep track of statistics
i = 0;
%Fstart = F;
while 1
    i = i+1;
    bestimprov = 0;
    evalNum(i) = 0;
    
%     if mod(i,252)==0
%         F = init(Fstart,sset);
%     else
%     end
    %save sfo_greedy_lazy_tmp_sol sset
    F = init(F,sset);
    
    deltas(curCost+C>B) = -inf; %cannot afford
    [tmp,order] = sort(deltas,'descend');
    
    % Now let's lazily update the improvements
    for test = order
        if exist('checkIndep','var') %check if the set is independent
            if ~checkIndep([sset V(test)])
                deltas(test) = -inf;
            end
        end
        if deltas(test)>=bestimprov % test could be a potential best choice
            evalNum(i) = evalNum(i) + 1;
            improv = inc(F,sset,V(test))-curVal;
            if useCB
                improv = improv/C(test);
            end
            deltas(test)=improv;
            bestimprov = max(bestimprov,improv);
        elseif deltas(test)>-inf
            break;
        end
    end
    argmax = find(deltas==max(deltas),1); % find best delta
    if deltas(argmax)>TOL % nontrivial improvement by adding argmax
        if isstruct(F)
            [tmp,F] = inc(F,sset,V(argmax));
        end
        sset = [sset,V(argmax)];
        if (useCB) %need to account for cost-benefit ratio
            curVal = curVal + deltas(argmax)*C(argmax);
        else
            curVal = curVal + deltas(argmax);
        end
        curCost = curCost + C(argmax);
        scores(i) = curVal;
    else 
        break
    end
end
