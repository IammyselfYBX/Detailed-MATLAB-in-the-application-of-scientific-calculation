% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
function F = init(F,sset)
if ~isequal(sset,get(F,'current_set'))
    if isempty(sset)
        F.curmax = zeros(1,size(F.detmat,1));
    else
        F.curmax = max(F.detmat(:,sset),[],2);        
    end
    F = set(F,'current_val',full(sum(F.curmax)),'current_set',sset);
end
