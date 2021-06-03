function [Lambda,u,M,iter,exitflag]=eig_lupower(A,u0,eps,iter_max)
% ���÷��ݷ����������С����ֵ�����Ӧ����������
if nargin<2;error('�������������Ҫ2����'),end
if nargin<3|isempty(eps);eps=1e-6;end
if nargin<4|isempty(iter_max);iter_max=100;end
[m,n]=size(A);
if m~=n
    error('����A����Ϊ����')
end
iter=0;exitflag=1;Lambda1=0;u=u0;
[L,U,P]=lu(A);
while iter<iter_max
    z=L\(P*u); v=U\z;
    [Lambda,I]=max(abs(v));
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
