function [U,x]=Catch_up(a,b,c,d)
% 追赶法求解三对角方程组
% 输入参数：
%      ---a：次下对角线元素向量
%      ---b：主对角元素向量
%      ---c：次上对角线元素向量
%      ---d：右端向量
% 输出参数：
%      ---U：消元后的上三角方程组的增广矩阵
%      ---x：三对角方程组的解
n=length(d);
% 消元
for i=2:n
    l(i)=a(i-1)/b(i-1);
    b(i)=b(i)-l(i)*c(i-1);
    d(i)=d(i)-l(i)*d(i-1);
end
U=[diag(b)+diag(c,1),d];
% 回代
x(n)=d(n)/b(n);
for i=n-1:-1:1
    x(i)=(d(i)-c(i)*x(i+1))/b(i);
end
