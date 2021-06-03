v=simple(dsolve('Dv=g-c_d/m*v^2','v(0)=0','t'))  % 利用函数dsolve求微分方程解析解
f=eval(['@(t,g,m,c_d)',char(v)])  % 将符号表达式写成匿名函数
g=9.81;m=68.1;c_d=0.25;
v_3=subs(v,{'t','g','m','c_d'},{3,g,m,c_d})  % 第3秒的下降速度
x=trape(f,0,3,[],g,m,c_d)  % 最初3秒内下降的高度
