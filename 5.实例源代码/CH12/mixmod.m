function r=mixmod(x0,n,type)
% 混合同余法产生随机数
% 输入参数：
%       ---x0：随机数种子
%       ---n：需要产生的随机数的个数
%       ---type：选取的公式类型，可选值为1和2，默认值为1
% 输出参数：
%       ---r：产生的随机数序列
if nargin<3,type=1;end
M=2.^[31,35];
a=[314159269,5^15];
c=[453806245,1];
r=zeros(n,1);
x=zeros(n+1,1);
x(1)=x0;
for i=2:n+1
    y=a(type)*x(i-1)+c(type);
    x(i)=mod(y,M(type));
    r(i-1)=x(i)/M(type);
end
