function [D,V]=eig_Jocabi(A,eps)
% 利用Jocabi法求解对称矩阵的全部特征值和特征向量
% 输入参数：
%      ---A：给定的矩阵
%      ---eps：精度要求，默认值为1e-6
% 输出参数：
%      ---D：n阶对角矩阵，其对角元为矩阵A的n个特征值
%      ---V：特征向量矩阵
if nargin<2;eps=1e-6;end
[m,n]=size(A);
if m~=n
    error('矩阵A必须为方阵！')
end
if A~=A'
    error('矩阵A应该为对称矩阵！')
end
V=eye(m);
[M1,I]=max(abs(A-diag(diag(A))));
[M2,j]=max(M1); i=I(j);
while 1
    d=(A(j,j)-A(i,i))/(2*A(i,j));
    if abs(d)<1e-10
        t=1;
    else
        t=sign(d)/(abs(d)+sqrt(1+d^2));
    end
    c=1/sqrt(t^2+1); s=c*t;
    R=[c s; -s c];
    A([i j],:)=R'*A([i j],:);
    A(:,[i j])=A(:,[i j])*R;
    V(:,[i j])=V(:,[i j])*R;
    [M1,I]=max(abs(A-diag(diag(A))));
    [M2,j]=max(M1); i=I(j);
    if abs(sum(sum(A-diag(diag(A)))))<=eps
        break;
    end
end
D=diag(diag(A));
