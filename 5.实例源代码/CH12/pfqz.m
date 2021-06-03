function r=pfqz(k,x0,n)
% 平方取中法产生随机数
% 输入参数：
%       ---k：随机数种子位数的一半
%       ---x0：随机数种子
%       ---n：需要产生的随机数的个数
% 输出参数：
%       ---r：产生的随机数序列
r=zeros(n,1);
x=zeros(n,1);
x(1)=x0;
r(1)=x(1)/(100^k);
for i=2:n
    x(i)=mod(floor(x(i-1)^2/(10^k)),100^k);  % 平方取中法
    r(i)=x(i)/(100^k);
end
