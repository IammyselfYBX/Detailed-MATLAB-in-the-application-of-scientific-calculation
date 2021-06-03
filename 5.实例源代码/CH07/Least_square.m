function [A,b,p]=Least_square(wfun,phifun,x,y)
% 最小二乘拟合
% 输入参数：
%      ---wfun：权系数
%      ---phifun：拟合基函数
%      ---x,y：已知数据的x,y坐标
%      ---n：数据拟合的次数，默认值为1
% 输出参数：
%      ---A：法方程组的系数矩阵
%      ---b：法方程组的右端向量
%      ---p：最小二乘拟合系数
phifun=phifun(x);
n=size(phifun,1);
A=zeros(n);
for i=1:n
    for j=1:n
        A(i,j)=sum(wfun(i).*phifun(i,:).*phifun(j,:));
    end
    b(i)=sum(wfun(i).*phifun(i,:).*y);
end
b=b';
a=A\b;p= a';
