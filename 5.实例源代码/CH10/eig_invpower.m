function [Lambda,u,M,iter,exitflag]=eig_invpower(A,u0,eps,iter_max)
% 利用反幂法求解矩阵的最小特征值及其对应的特征向量
% 输入参数：
%      ---A：给定的矩阵
%      ---u0：初始迭代向量
%      ---eps：精度要求，默认值为1e-6
%      ---iter_max：最大迭代次数，默认值为100
% 输出参数：
%      ---Lambda：按模最小的特征值
%      ---u：最小特征值对应的特征向量
%      ---M：每一步迭代的结果
%      ---iter：迭代次数
%      ---exitflag：迭代成功与否的标志：exitflag=1表示迭代成功
%                                      exitflag=0表示迭代失败
if nargin<2;error('输入参数至少需要2个！'),end
if nargin<3|isempty(eps);eps=1e-6;end
if nargin<4|isempty(iter_max);iter_max=100;end
[m,n]=size(A);
if m~=n
    error('矩阵A必须为方阵！')
end
iter=0;exitflag=1;Lambda1=0;u=u0;
while iter<iter_max
    v=inv(A)*u;[Lambda,I]=max(abs(v));
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
Lambda=1/Lambda;M=1./M';
