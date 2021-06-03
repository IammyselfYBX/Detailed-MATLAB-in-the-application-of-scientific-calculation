% Andreas Krause (krausea@cs.cmu.edu)
% balanced submodular coverage. Gives a 6 approximation to the problem of
% finding a collection of disjoint sets A1...Am, together containing at
% most k elements, that maximize min_i F(A_i)
%
% function [A_res,scores] = sfo_balance(F,V,m,k,maxc)
% F: monotonic submodular function
% V: index set
% m: number of buckets
% k (optional): #elements to pick
% maxc (optional): upper bound on function value
%
% Example: (also see sfo_tutorial.m)
%   F = @(A) sfo_fn_sat_varred(0.5*eye(10)+0.5*ones(10),A)
%   A = sfo_balance(F,1:10,3)

function [A_res,scores] = sfo_balance(F,V,m,k,dorebalance,maxc)
n = length(V);
scores = zeros(1,m);

if ~exist('k','var') %allow to partition the entire set
    k = n;
end
if ~exist('dorebalance','var') %allow to partition the entire set
    dorebalance = 1;
end

% beta is the approximation guarantee
beta = 1/6; 


if ~exist('maxc','var') % get an upper bound on function value
    %maxc = sfo_maxbound(F,V); FIXME
    maxc = F(V);
end
%TOL = 1e-2;
TOL = maxc*(1e-5);

maxc = maxc/beta; % maximum value for binary search
minc = 0; % minimum value for binary search

% compute all singleton values
vals = zeros(1,n);
F = init(F,[]);
for i = 1:n
    vals(i) = F(V(i));
end

iter = 0;

A_res = repmat({{}},1,m); % empty partition
if (k<m)
    scores = zeros(1,m);
    return
end

bestScore = minc;
while abs(maxc-minc)>TOL %while not converged
    iter = iter+1;
    % new guess for optimal value
    testc = mean([minc,maxc]);
    disp(sprintf('interval [%f,%f]',minc*beta,maxc*beta));

    % find big, "satisfied" buckets
    big = find(vals>=beta * testc);
    A_part_big = {};
    if (length(big)>0)
        [tmp,I] = sort(vals,'descend');
        for i = 1:min(length(big),m);
            A_part_big{i}=V(I(i));
        end
    end
    
    %now we restrict our choice to "small" elements
    Vi = V(vals<beta * testc); %remaining elements
    mi = max(m-length(big),0); %remaining #buckets
    ki = max(k-length(big),0); %remaining #elements to pick
    
    Fs = {};
    for i = 1:mi
        % define truncated utility function
        Ftrunc = sfo_fn_trunc(F,testc);
        Fs{i} = Ftrunc;
    end
    % run submodular welfare algorithm
    if (mi>0)
        A_part = sfo_greedy_welfare(Fs,Vi,ki);
    else
        A_part = {};
    end
    [A_part] = sfo_balance_reallocate(F,A_part,beta*testc);

    % construct our test solution by combining "big" with "small" buckets
    A_test = {A_part{:} A_part_big{:}};
    % heuristically improve solution by rebalancing
    [A_test,scores_test] = sfo_balance_rebalance(F,A_test,dorebalance);
    
    % now check for number of satisfied clusters
    if sum(scores_test>=beta * testc) == m
        % successfully satisfied all m buckets
        minc = testc;
        if min(scores_test)>bestScore %improved solution
            A_res = A_test; %store current solution
            scores = scores_test;
        end
    else
        % need to choose more conservative value for c
        maxc = testc;
    end
end


%% Helper function that steals from the big buckets and gives to the small buckets
% this algorithm will take enough "small" elements from "oversatisfied"
% buckets to satisfy an unsatisfied bucket
function [Ap,scores] = sfo_balance_reallocate(F,Ap,thresh)
m = length(Ap); % compute scores for current solution
scores = zeros(1,m);

for i = 1:length(Ap)
    scores(i) = F(Ap{i});
end

while 1
    unsat = find(scores<thresh); %unsatisfied buckets
    oversat = find(scores>=3*thresh); %oversatisfied buckets
    if isempty(oversat) || isempty(unsat) % no reallocation move possible
        break;
    end
    disp('yey!')
    i = oversat(1); j = unsat(1);
    packet = sfo_cover(F,Ap{i},thresh);
    Ap{j} = [Ap{j} packet]; scores(j) = F(Ap{j});
    Ap{i} = sfo_setdiff_fast(Ap{i},packet); scores(i) = F(Ap{i});
end


%% Helper function that steals from the big buckets and gives to the small buckets
% this algorithm will take all elements that "preserve" minimum score
% then greedily allocates these elements to those buckets "most in need"
% This is an optional heuristic, not improving the approximation guarantee
function [Ap,scores] = sfo_balance_rebalance(F,Ap,dorebalance)
m = length(Ap); % compute scores for current solution
scores = zeros(1,m);

for i = 1:length(Ap)
    scores(i) = F(Ap{i});
end

if ~dorebalance
    return;
end

% now we use a heuristic to rebalance and improve the scores further

oldScore = -inf;
while min(scores)>oldScore*1.001 %require to ensure polytime performance
    oldScore = min(scores);
    avail = []; % keeps track of elements to reallocate
    for i = 1:m
        bound = [];
        while ~isempty(Ap{i})
            Ai = Ap{i}; %set of i-th bucket
            Fi = scores(i); %function value
            [argmax,maxval,bound] = sfo_max_delta_lazy(F,[],Ai,-1,bound);

            if Fi+maxval >=min(scores) %aha! can remove element
                avail = [avail argmax];
                Ap{i} = sfo_setdiff_fast(Ap{i},argmax);
                scores(i) = Fi+maxval; %update scores
                bound(argmax)=-inf;
            else
                break
            end
        end
    end

    % now we have a set of available elements, avail, and want to give them
    % back to the buckets most in need
    while ~isempty(avail)
        % find the poorest bucket
        lowest = find(scores==min(scores),1);
        % compute the scores for adding each element
        [addEl,maxval] = sfo_max_delta_lazy(F,Ap{lowest},[Ap{lowest} avail],1,[]);
        Ap{lowest}=[Ap{lowest} addEl];
        avail = sfo_setdiff_fast(avail,addEl);
        scores(lowest) = scores(lowest)+maxval;
    end
    
end
%%
% function [ordering,score] = sfo_balance_collect(F,Ai,thresh)
% ordering = [];
% bound = [];
% Fi = F(Ai);
% while 1
%     [argmax,maxval,bound] = sfo_max_delta_lazy(F,[],Ai,-1,bound);
%     if Fi+maxval>=thresh %can remove element
%         ordering = [ordering argmax];
%         Ai = sfo_setdiff_fast(Ai,argmax);
%         Fi = Fi+maxval;
%     else
%         break;
%     end
% end
% score = Fi;
