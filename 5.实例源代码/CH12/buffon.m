function PI=buffon(a,l,n)
% �ѷ�Ͷ��ʵ��
% ���������
%       ---a��ƽ���߼��
%       ---l����ĳ���
%       ---n��ʵ��ģ��Ĵ���
% ���������
%       ---PI��Բ����pi�Ľ���ֵ
if nargin<3,n=5000;end
if nargin<1,a=1;l=0.8;end
rand('state',2006)  % �趨�����״̬
theta=linspace(0,pi);
plot(theta,l*sin(theta)/2)
hold on
x=rand(1,n)*a/2;
Theta=rand(1,n)*pi;
k=find(x<l*sin(Theta)/2);
plot(Theta(k),x(k),'.')
m=sum(x<l*sin(Theta)/2);
PI=2*l*n/(a*m);
text(-0.3,1.15*l/2,['��������G�ĵ���m=',num2str(m)])
text(-0.3,1.05*l/2,['Բ���ʵĹ���ֵ\pi=',num2str(PI)])
title('\fontname{����}\fontsize{16}�ѷ�Ͷ��ʵ��')
axis([-0.4,3.5,0,1.2*l/2])
