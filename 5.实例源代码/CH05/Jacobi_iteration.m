function [x,iter,exitflag]=Jacobi_iteration(A,b,x0,eps,iter_max)
% ���Է������Jacobi�������(������ʽ)
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
%      ---x0����ʼ������Ĭ��ֵΪ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---iter_max��������������Ĭ��ֵΪ100
% ���������
%      ---x�����Է�����Ľ��ƽ�
%      ---iter����������
%      ---exitflag�������ɹ����ı�־��exitflag=1��ʾ�����ɹ�
%                                      exitflag=0��ʾ����ʧ��
n=length(b);
if nargin<5;iter_max=100;end
if nargin<4;eps=1e-6;end
if nargin<3;x0=zeros(n,1);end
x=zeros(n,1);iter=0;exitflag=1;
while iter<iter_max
    for i=1:n
        x(i)=(b(i)-A(i,[1:i-1,i+1:n])*x0([1:i-1,i+1:n]))/A(i,i);
    end
    if norm(x-x0,inf)<eps
        break
    end
    x0=x;iter=iter+1;   
end
if iter==iter_max
    exitflag=0;
end
