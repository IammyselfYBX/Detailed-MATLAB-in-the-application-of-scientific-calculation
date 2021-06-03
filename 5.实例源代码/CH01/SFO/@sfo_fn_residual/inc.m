% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
function [new_val,F] = inc(F,A,el)
if ~isa(F,'sfo_fn_residual')
    error('invalid type!');
end
[new_val,F.oldF] = inc(F.oldF,sfo_unique_fast([A F.sset]),el);
new_val = new_val-F.ssetVal;
Ai = [A el];

F = set(F,'current_val',new_val,'current_set',Ai);
