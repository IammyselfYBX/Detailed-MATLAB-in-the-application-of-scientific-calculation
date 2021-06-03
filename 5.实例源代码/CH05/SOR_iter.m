function [x,iter,exitflag]=SOR_iter(A,b,w,x0,eps,iter_max)
% ���Է������Gauss seidel�������(������ʽ)
% ���������
%      ---A�����Է������ϵ������
%      ---b�����Է�������Ҷ���
%      ---w�����ɳ����ӣ�Ĭ��ֵΪ1
%      ---x0����ʼ������Ĭ��ֵΪ������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---iter_max��������������Ĭ��ֵΪ100
% ���������
%      ---x�����Է�����Ľ��ƽ�
%      ---iter����������
%      ---exitflag�������ɹ����ı�־��exitflag=1��ʾ�����ɹ�
%                                         exitflag=0��ʾ����ʧ��
n=length(b);
if nargin<6|isempty(iter_max);iter_max=100;end
if nargin<5|isempty(eps);eps=1e-6;end
if nargin<4|isempty(x0);x0=zeros(n,1);end
if nargin<3|isempty(w);w=1;end
iter=0;exitflag=1;
D=diag(diag(A));L=tril(A,-1);U=triu(A,1);
S=inv(D+w*L)*((1-w)*D-w*U);f_w=w*inv(D+w*L)*b;
while iter<iter_max
    x=S*x0+f_w;
    if norm(x-x0,inf)<eps
        break
    end
    x0=x;iter=iter+1;
end
if iter==iter_max
    exitflag=0;
end
