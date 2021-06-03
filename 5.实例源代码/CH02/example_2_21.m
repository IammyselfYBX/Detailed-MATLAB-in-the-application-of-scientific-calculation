syms t; 
x=log(cos(t)); y=cos(t)-t*sin(t);
dydx=diff_para(y,x,t,1)  % 求参数方程的一阶导数
dy2dx=diff_para(y,x,t,2);  % 求参数方程的二阶导数
dy2dx=simple(subs(dy2dx,t,sym(pi)/3))
