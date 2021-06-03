function [Lambda,u,M,iter,exitflag]=eig_powershift(A,u0,p,eps,iter_max)
% 利用原点位移幂法求解矩阵的最大特征值及其对应的特征向量
% 输入参数：
%      ---A：给定的矩阵
%      ---u0：初始迭代向量
%      ---p：原点位移参数
%      ---eps：精度要求，默认值为1e-6
%      ---iter_max：最大迭代次数，默认值为100
% 输出参数：
%      ---Lambda：按模最大的特征值
%      ---u：最大特征值对应的特征向量
%      ---M：每一步的迭代结果
%      ---iter：迭代次数
%      ---exitflag：迭代成功与否的标志：exitflag=1表示迭代成功
%                                      exitflag=0表示迭代失败
if nargin<3;error('输入参数至少需要3个！'),end
if nargin<4|isempty(eps);eps=1e-6;end
if nargin<5|isempty(iter_max);iter_max=100;end
[m,n]=size(A);
if m~=n
    error('矩阵A必须为方阵！')
end
iter=0;exitflag=1;Lambda1=0;u=u0;
A=A-p*eye(m);
while iter<iter_max
    v=A*u;[Lambda,I]=max(abs(v));
    Lambda=v(I);u=v/Lambda;
    if abs(Lambda-Lambda1)<eps
        break
    end
    Lambda1=Lambda;iter=iter+1;
    M(iter)=Lambda;
end
if iter==iter_max
    exitflag=0;
end
Lambda=Lambda+p;M=M'+p;
