% Finding the minimum of a submodular function using Wolfe's min norm point
% algorithm [Fujishige '91]
% Implementation by Andreas Krause (krausea@gmail.com)
%
% function A = sfo_min_norm_point(F,V, Ainit)
% F: Submodular function
% V: index set
% Ainit (optional): starting point for search
% eps (optional): tolerance on suboptimality for stopping search
% Returns: optimal solution A, bound on suboptimality
%
% Example: A = sfo_min_norm_point(@sfo_fn_example,1:2);

function [A,subopt] = sfo_min_norm_point(F,V, Ainit,eps, callback)
if ~exist('Ainit','var')
    Ainit = [];
end
if ~exist('eps','var')
    eps = 0;
end
TOL = 1e-10;


% step 1: initialize by picking a point in the polytope
wA = sfo_charvector(V,Ainit);
xw = sfo_polyhedrongreedy(F,V,wA);
S = xw';
xhat = xw';
Abest = -1;
Fbest = inf;
while 1
    % step 2: 
    if (norm(xhat)<TOL) %snap to zero
        xhat = zeros(size(xhat));
    end

    % get phat by going from xhat towards the origin until we hit
    % boundary of polytope P
    phat = sfo_polyhedrongreedy(F,V,-xhat)';
    S = [S phat];
    
    % check current function value
    Fcur = F(V(xhat<0));
    if Fcur<Fbest
        Fbest = Fcur;
        Abest = V(xhat<0); %this gives the unique minimal minimizer
    end
    % get suboptimality bound
    subopt = Fbest-sum(xhat(xhat<0));
    disp(sprintf('suboptimality bound: %f <= min_A F(A) <= F(A_best) = %f; delta<=%f',Fbest-subopt,Fbest,subopt));
    
    if abs(xhat'*phat - xhat'*xhat)<TOL || (subopt<eps)
        % we are done: xhat is already closest norm point
        if abs(xhat'*phat - xhat'*xhat)<TOL
            subopt = 0;
        end
        A = Abest; 
        break;
    end
    
    % here's some code just for outputting the current state
    % can be used to visualize progress in the Ising model (tutorial)
    if exist('callback','var') %do something with current state
        if isa(callback,'function_handle')
            callback(Abest);
        else
            img = callback;
            img(Abest)=1;
            imshow(img)
            pause(.1);
        end
    end
    
    [xhat,S] = sfo_min_norm_point_update_xhat(xhat, S, TOL);
end
disp(sprintf('suboptimality bound: %f <= min_A F(A) <= F(A_best) = %f; delta<=%f',Fbest-subopt,Fbest,subopt));


%% Helper function for updating xhat

function [xhat,S] = sfo_min_norm_point_update_xhat(xhat, S, TOL)

while 1
    % step 3: Find minimum norm point in affine hull spanned by S

    S0 = S(:,2:end)-S(:,ones(1,size(S,2)-1)); % subspace after translating by S(:,1)

    y = S(:,1)- S0*((S0'*S0)\(S0'*S(:,1))); %now y is min norm

    %get representation of y in terms of S. Enforce
    %affine combination (i.e., sum(mu)==1)
    mu = [S;ones(1,size(S,2))]\[y;1];

    % y is written as positive convex combination of S <==> y in
    % conv(S)
    if (sum(mu < -TOL)==0) && (abs( sum(mu)-1 ) < TOL )
       % y is in the relative interior of S
        xhat = y; 
        break
    end

    % step 4: %project y back into polytope

    %get representation of xhat in terms of S; enforce that we get
    %affine combination (i.e., sum(lambda)==1)
    lambda = [S;ones(1,size(S,2))]\[xhat;1];

    % now find z in conv(S) that is closest to y
    bounds = lambda./(lambda-mu); bounds = bounds(bounds>TOL);
    beta = min(bounds);
    z = (1-beta) * xhat + beta * y;

    gamma = (1-beta) * lambda + beta * mu; % find relevant coordinates
    S = S(:,(gamma)>TOL);
    xhat = z;
end    
