function rate=purchase(A,A0,b,m)
% �������ʵļ���
% �������
%        ---A��¥���ۼ�
%        --- A0���׸�
%        ---b���»���
%        ---m�����ڸ������
% �������
%        ---rate��������
% example1��
%       rate=purchase(32000,0,1200,36)
% example2��
%       A=30000;A0=0;b=450;m=180;
%       rate=purchase(A,A0,b,m)
% example3��
%       rate=purchase(30000,225*12/(1+12*rate),225,300)
if nargin<1
    A=30000;A0=0;b=450;m=180;
end
fun=@(r,A,A0,b,m)b/r*(1-1/(1+r)^m)-(A-A0);  % ���庯�����ʽ
fplot(@(r)fun(r,A,A0,b,m),[0,1]);  % ���Ʊ��ʽ��ͼ��
hold on  % ͼ�α���
plot(xlim,[0,0],'k')  % ����x��
[x,y]=ginput(1);  % ���ý���ʽ����ȡ��ʼ��
rate=fzero(@(r)fun(r,A,A0,b,m),x);  % ���ú���fzero�������Է���
plot(rate,fun(rate,A,A0,b,m),'r*','markersize',12)  % ���ƺ������
title(['�����ʣ�rate=',num2str(rate*100),'%'])  % ��ӱ���
