% ��������
syms x y;
F=y-1-x*exp(y);
dydx=-diff(F,x)/diff(F,y);  % ��dy/dx
dy2dx=simple(diff(dydx,y)*dydx+diff(dydx,x));  % ����׵���
dy2dx=subs(dy2dx,x*exp(y),y-1)  % ͨ���滻������ű��ʽ
% ��ʽ������
syms x y;
dxdy=diff((y-1)/exp(y),y);  % ��dx/dy
dydx=1/dxdy  % ��dy/dx
dy2dx=simple(diff(dydx,y)*dydx)

