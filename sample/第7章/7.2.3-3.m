% 该函数用于演示if-else-end语句的用法，
% 有三种或者三种以上选择的情况下if-else-end选择语句的使用。
function ifthree(x)
if x>100
    fprintf('%f is a great positive number\n',x)
elseif x>=10
    fprintf('%f is a big positive number\n',x)
elseif x>10
fprintf('%f is a small positive number\n',x)
elseif x==0
	fprintf(‘%f is zero\n’, x)
else 
    fprintf('%f is a minus number\n',x)
end
