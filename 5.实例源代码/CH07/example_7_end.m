syms t S K VA VB aA aB;
s=dsolve('Dy+S*K*(1/VA+1/VB)*y=S*K*(aA/VB+aB/VA)','y(0)=aB');  % 微分方程求解
fun=char(s);  % 将符号表达式转换为字符串
fun(findstr(fun,' '))=[];  %将字符串的空格去掉
fun=strrep(fun,'VA*aA+VB*aB','x(1)');  % 执行替换操作
fun=strrep(fun,'VA*aA-VA*aB','x(2)');  % 执行替换操作
fun=strrep(fun,'K','x(3)');  % 执行替换操作
fun=inline(fun,'x','t','VA','VB','S');  % 将字符串转换为内联函数
fun=vectorize(fun);  % 乘、除、指数运算转换为对应的点操作，此处可省略
format long
td = linspace(100,1000,10);
Cd =1e-5*[4.54,4.99,5.35,5.65,5.90,6.10,6.26,6.39,6.50,6.59];
x0 =0.05*ones(1,3);
VA=1000;VB=1000;S=10;
x=nlinfit(td,Cd,@(x,t)fun(x,t,VA,VB,S),x0)  % 回归模型求解
% nlintool(td,Cd,@(x,t)fun(x,t,VA,VB,S),x0,[],'时间：t','浓度：C_B')
plot(td,Cd,'r*')  % 绘制数据点
hold on  % 图形保持
tp=linspace(min(td),max(td),200);
yp=fun(x,tp,VA,VB,S);
plot(tp,yp)
xlabel('时间：t');ylabel('浓度：C_B');  % 添加x轴和y轴标注
a=[VA,VB;-VA,VA]\x(1:2)'  % 利用线性方程组求aA,aB
