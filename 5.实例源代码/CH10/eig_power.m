function [lambda,u,M,iter,exitflag]=eig_power(A,u0,eps,iter_max)
% �����ݷ���������������ֵ
% ���������
%      ---A�������ľ���
%      ---u0����ʼ��������
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---iter_max��������������Ĭ��ֵΪ100
% ���������
%      ---lambda����ģ��������ֵ
%      ---u���������ֵ��Ӧ����������
%      ---M��ÿһ�������Ľ��
%      ---iter����������
%      ---exitflag�������ɹ����ı�־��exitflag=1��ʾ�����ɹ�
%                                    exitflag=0��ʾ����ʧ��
if nargin<2;error('�������������Ҫ2����'),end
if nargin<3|isempty(eps);eps=1e-6;end
if nargin<4|isempty(iter_max);iter_max=100;end
[m,n]=size(A);
if m~=n
    error('����A����Ϊ����')
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
