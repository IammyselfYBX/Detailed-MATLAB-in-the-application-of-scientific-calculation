syms t; 
x=log(cos(t)); y=cos(t)-t*sin(t);
dydx=diff_para(y,x,t,1)  % ��������̵�һ�׵���
dy2dx=diff_para(y,x,t,2);  % ��������̵Ķ��׵���
dy2dx=simple(subs(dy2dx,t,sym(pi)/3))
