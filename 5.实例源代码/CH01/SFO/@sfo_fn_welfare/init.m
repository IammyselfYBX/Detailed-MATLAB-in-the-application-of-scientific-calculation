% Implementation by Andreas Krause (krausea@gmail.com)
% 
% Example: See sfo_fn.m and the tutorial script for more information
%% sums utility functions across buckets
function F = init(F,As)
if ~isequal(As,get(F,'current_set'))
    m = length(F.Fs);
    val = 0;
    A_part = partition(F,As);
    for i = 1:m
        F.Fs{i} = init(F.Fs{i},A_part{i});
        val = val + get(F.Fs{i},'current_val');
    end
    F = set(F,'current_set',As,'current_val',val);
end
