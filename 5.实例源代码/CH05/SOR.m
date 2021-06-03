function [x,iter,exitflag]=SOR(A,b,w,x0,eps,iter_max)
% ���Է�����ĳ��ɳ�(SOR)�������(������ʽ)
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
%      ---x0����ʼ������Ĭ��ֵΪ������
%      ---w�����ɳ����ӣ�Ĭ��ֵΪ1
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---iter_max��������������Ĭ��ֵΪ100
% ���������
%      ---x�����Է�����Ľ��ƽ�
%      ---iter����������
%      ---exitflag�������ɹ����ı�־��exitflag=1��ʾ�����ɹ�
%                                      exitflag=0��ʾ����ʧ��
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
