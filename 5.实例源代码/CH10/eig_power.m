function [lambda,u,M,iter,exitflag]=eig_power(A,u0,eps,iter_max)
% 利用幂法求解矩阵的最大特征值
% 输入参数：
%      ---A：给定的矩阵
%      ---u0：初始迭代向量
%      ---eps：精度要求，默认值为1e-6
%      ---iter_max：最大迭代次数，默认值为100
% 输出参数：
%      ---lambda：按模最大的特征值
%      ---u：最大特征值对应的特征向量
%      ---M：每一步迭代的结果
%      ---iter：迭代次数
%      ---exitflag：迭代成功与否的标志：exitflag=1表示迭代成功
%                                    exitflag=0表示迭代失败
if nargin<2;error('输入参数至少需要2个！'),end
if nargin<3|isempty(eps);eps=1e-6;end
if nargin<4|isempty(iter_max);iter_max=100;end
[m,n]=size(A);
if m~=n
    error('矩阵A必须为方阵！')
end
iter=0;exitflag=1;m1=0;u=u0;
while iter<iter_max
    v=A*u;[m,I]=max(abs(v));
    m=v(I(1));u=v/m;
    if abs(m-m1)<eps
        break
    end
    m1=m;iter=iter+1;
    M(iter)=m;
end
if iter==iter_max
    exitflag=0;
end
lambda=m;M=M';
