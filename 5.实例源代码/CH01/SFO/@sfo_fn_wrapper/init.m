% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
function F = init(F,A)
if ~isequal(A,get(F,'current_set'))
    v = F.fn(A);
    F = set(F,'current_val',v,'current_set',A);
end
