function x=Daffodils(m,n)
% 求解任意两个正整数间的水仙花数
% 输入参数：
%       ---m,n(m<n)：任意给定的两个正整数
% 输出参数：
%       ---x：返回的水仙花数
if nargin<1|(isempty(m)&isempty(n))
    m=100;n=999;
end
x=[];
fprintf('区间[%d,%d]内的水仙花数为：\n',m,n)
for i=m:n
    ii=num2str(i);  % 将x转化为字符串
    ii=ii-'0';
    ii=double(ii);
    ii=sum(ii.^length(ii));
    D=ii-i;
    if D==0
        x=[x,i];
    end
end
