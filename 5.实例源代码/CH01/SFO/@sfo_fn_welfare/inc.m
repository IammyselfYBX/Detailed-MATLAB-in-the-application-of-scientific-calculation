% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
%% sums utility functions across buckets
function [val,F] = inc(F,As,el)
m = length(F.Fs);
val = 0;
A_part = partition(F,As);
bucket = mod(el,m)+1;
sensor = floor(el/m);
for i = 1:m
    if i == bucket
        [score, F.Fs{i}] = inc(F.Fs{i},A_part{i},sensor);
        val = val + score;
    else
        val = val + get(F.Fs{i},'current_val');
    end
end
F = set(F,'current_set',[As el],'current_val',val);
