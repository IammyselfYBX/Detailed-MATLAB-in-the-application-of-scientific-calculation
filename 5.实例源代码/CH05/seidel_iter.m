function [x,iter,exitflag]=seidel_iter(A,b,x0,eps,iter_max)
% 线性方程组的Gauss seidel迭代求解(向量形式)
% 输入参数：
%      ---A：线性方程组的系数矩阵
%      ---b：线性方程组的右端项
%      ---x0：初始向量，默认值为零向量
%      ---eps：精度要求，默认值为1e-6
%      ---iter_max：最大迭代次数，默认值为100
% 输出参数：
%      ---x：线性方程组的近似解
%      ---iter：迭代次数
%      ---exitflag：迭代成功与否的标志：exitflag=1表示迭代成功
%                                         exitflag=0表示迭代失败
n=length(b);
if nargin<5|isempty(iter_max);iter_max=100;end
if nargin<4|isempty(eps);eps=1e-6;end
if nargin<3|isempty(x0);x0=zeros(n,1);end
iter=0;exitflag=1;
D=diag(diag(A));L=tril(A,-1);U=triu(A,1);
G=-inv(D+L)*U;f_G=inv(D+L)*b;
while iter<iter_max
    x=G*x0+f_G;
    if norm(x-x0,inf)<eps
        break
    end
    x0=x;iter=iter+1;
end
if iter==iter_max
    exitflag=0;
end
