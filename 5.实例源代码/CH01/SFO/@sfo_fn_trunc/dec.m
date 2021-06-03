% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
function [new_val,F] = dec(F,A,el)
if ~isa(F,'sfo_fn_trunc')
    error('invalid type!');
end
[new_val,F.oldF] = dec(F.oldF,A,el);
Ar = sfo_setdiff_fast(A,el);

if F.thresh>=0
    new_val = min(F.thresh,new_val);
end

F = set(F,'current_val',new_val,'current_set',Ar);
