function [A,B,F]=fseriessym(f,x,n,a,b)
% fourier�����������
% ���������
%      ---f�������Ĵ�չ������
%      ---x���Ա���
%      ---n��չ������
%      ---a,b�� �����䣨ȱʡֵΪ ��
% ���������
%      ---A,B��Fourierϵ��
%      ---F��Fourierչ��ʽ
if nargin==3
    a=-pi;b=pi; 
end
L=(b-a)/2; 
A=int(f,x,-L,L)/L;
B=[];F=A/2;
for k=1:n
   ak=int(f*cos(k*pi*x/L),x,-L,L)/L;
   bk=int(f*sin(k*pi*x/L),x,-L,L)/L;
   A=[A,ak];
   B=[B,bk];
   F=F+ak*cos(k*pi*x/L)+bk*sin(k*pi*x/L);
end
