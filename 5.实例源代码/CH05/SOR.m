function [x,iter,exitflag]=SOR(A,b,w,x0,eps,iter_max)
% 线性方程组的超松弛(SOR)迭代求解(分量形式)
% 输入参数：
%      ---A：线性方程组的系数矩阵
%      ---b：线性方程组的右端项
%      ---x0：初始向量，默认值为零向量
%      ---w：超松弛因子，默认值为1
%      ---eps：精度要求，默认值为1e-6
%      ---iter_max：最大迭代次数，默认值为100
% 输出参数：
%      ---x：线性方程组的近似解
%      ---iter：迭代次数
%      ---exitflag：迭代成功与否的标志：exitflag=1表示迭代成功
%                                      exitflag=0表示迭代失败
n=length(b);
if nargin<6;iter_max=100;end
if nargin<5;eps=1e-6;end
if nargin<4;x0=zeros(n,1);end
if nargin<3;w=1;end
x=zeros(n,1);iter=0;exitflag=1;
while iter<iter_max
    for i=1:n
        if i==1
            x(1)=(b(1)-A(1,2:n)*x0(2:n))/A(1,1);
        else 
            if i==n
                x(n)=(b(n)-A(n,1:n-1)*x(1:n-1))/A(n,n);
            else
                x(i)=b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n);
                x(i)=x(i)/A(i,i);
            end
        end
        x(i)=(1-w)*x0(i)+w*x(i);
    end
    if norm(x-x0,inf)<eps
        break
    end
    x0=x;iter=iter+1;   
end
if iter==iter_max
    exitflag=0;
end
