function [A,B,F]=fseriessym(f,x,n,a,b)
% fourier级数符号求解
% 输入参数：
%      ---f：给定的待展开函数
%      ---x：自变量
%      ---n：展开项数
%      ---a,b： 的区间（缺省值为 ）
% 输出参数：
%      ---A,B：Fourier系数
%      ---F：Fourier展开式
if nargin==3
    a=-pi;b=pi; 
end
L=(b-a)/2; 
A=int(f,x,-L,L)/L;
B=[];F=A/2;
for k=1:n
   ak=int(f*cos(k*pi*x/L),x,-L,L)/L;
   bk=int(f*sin(k*pi*x/L),x,-L,L)/L;
   A=[A,ak];
   B=[B,bk];
   F=F+ak*cos(k*pi*x/L)+bk*sin(k*pi*x/L);
end
