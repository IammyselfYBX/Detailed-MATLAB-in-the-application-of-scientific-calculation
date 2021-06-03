function [Lambda,u,M,iter,exitflag]=eig_powershift(A,u0,p,eps,iter_max)
% ����ԭ��λ���ݷ���������������ֵ�����Ӧ����������
% ���������
%      ---A�������ľ���
%      ---u0����ʼ��������
%      ---p��ԭ��λ�Ʋ���
%      ---eps������Ҫ��Ĭ��ֵΪ1e-6
%      ---iter_max��������������Ĭ��ֵΪ100
% ���������
%      ---Lambda����ģ��������ֵ
%      ---u���������ֵ��Ӧ����������
%      ---M��ÿһ���ĵ������
%      ---iter����������
%      ---exitflag�������ɹ����ı�־��exitflag=1��ʾ�����ɹ�
%                                      exitflag=0��ʾ����ʧ��
if nargin<3;error('�������������Ҫ3����'),end
if nargin<4|isempty(eps);eps=1e-6;end
if nargin<5|isempty(iter_max);iter_max=100;end
[m,n]=size(A);
if m~=n
    error('����A����Ϊ����')
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
