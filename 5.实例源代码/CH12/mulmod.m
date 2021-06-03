function r=mulmod(L,alpha,beta,n)
% 乘同余法产生随机数
% 输入参数：
%       ---L：模的幂参数
%       ---alpha：乘数的参数
%       ---beta：随机数种子的参数
%       ---n：需要产生的随机数的个数
% 输出参数：
%       ---r：产生的随机数序列
r=zeros(n,1);
x=zeros(n,1);
M=power(2,L);
a=8*alpha+5;
x(1)=4*beta+1;
r(1)=x(1)/M;
for i=2:n
    y=a*x(i-1);
    x(i)=mod(y,M);  % 乘同余法
    r(i)=x(i)/M;
end
