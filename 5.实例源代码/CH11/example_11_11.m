function example_11_11
fun = @(x)sum((x-0.2).^2);
x0 = [0.25,0.25,0.25]; 
[x,fval] = fseminf(fun,x0,1,@mycon)
function [C,Ceq,K1,S] = mycon(x,S)
% ��ʼ��������ࣺ
if  isnan(S(1,1)),
   S = [2 2];
end
% ����������
w1x = 1:S(1,1):100;
w1y = 1:S(1,2):100;
[wx, wy] = meshgrid(w1x,w1y);
% ���������Լ������ֵ 
K1=sin(wx*x(1)).*cos(wx*x(2))-1/1000*(wx-50).^2-sin(wx*x(3))-x(3)+...
sin(wy*x(2)).*cos(wx*x(1))-1/1000*(wy-50).^2-sin(wy*x(3))-x(3)-1.5;
% �޷�����Լ��
C = []; Ceq=[];
% ��Լ������ͼ��
surf(wx,wy,K1,'edgecolor','none','facecolor','interp');
camlight headlight
title('��ά���������Ż�����')
drawnow
set(gcf,'Color','w')
