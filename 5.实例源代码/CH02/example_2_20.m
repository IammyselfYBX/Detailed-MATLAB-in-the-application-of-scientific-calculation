% 隐函数求导
syms x y;
F=y-1-x*exp(y);
dydx=-diff(F,x)/diff(F,y);  % 求dy/dx
dy2dx=simple(diff(dydx,y)*dydx+diff(dydx,x));  % 求二阶导数
dy2dx=subs(dy2dx,x*exp(y),y-1)  % 通过替换化简符号表达式
% 显式函数求导
syms x y;
dxdy=diff((y-1)/exp(y),y);  % 求dx/dy
dydx=1/dxdy  % 求dy/dx
dy2dx=simple(diff(dydx,y)*dydx)

