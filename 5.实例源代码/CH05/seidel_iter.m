function [x,iter,exitflag]=seidel_iter(A,b,x0,eps,iter_max)
% ���Է������Gauss seidel�������(������ʽ)
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
%                                         exitflag=0��ʾ����ʧ��
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
