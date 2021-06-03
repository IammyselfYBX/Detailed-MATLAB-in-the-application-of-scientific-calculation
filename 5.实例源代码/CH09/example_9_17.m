function example_9_17
x=0:0.05:1;t=0:0.05:2;
m=0;
sol=pdepe(m,@pdefun,@pdeic,@pdebc,x,t);  % 利用pdepe函数求解偏微分方程
subplot(211)  % 图形分割
surf(x,t,sol(:,:,1))  % 绘制求解结果图形
h1=title('{\itu}_1({\itx,t})');  % 添加标题
subplot(212)  % 图形分割
surf(x,t,sol(:,:,2))  % 绘制求解结果图形
h2=title('{\itu}_2({\itx,t})');  % 添加标题
set([h1,h2],'fontname','times','fontsize',12)  % 设置标题的字体和字号
set(gcf,'Color','w')  % 设置图形窗口的颜色为白色
%
%------------目标pde函数------------% 
function [c,f,s]=pdefun (x,t,u,du)
c=[1;1];f=[0.024*du(1);0.17*du(2)];
temp=u(1)-u(2);
s=[-1;1].*(exp(5.73*temp)-exp(-11.46*temp));
%---------------边界条件描述函数--------------%
function [pa,qa,pb,qb]=pdebc(xa,ua,xb,ub,t)
% a表示左边界，b表示右边界
pa=[0;ua(2)];qa=[1;0];pb=[ub(1)-1;0];qb=[0;1];
%----------初值条件描述函数----------% 
% 此处可以由匿名函数u0=@(x)[1;0]代替该M文件
function u0=pdeic(x)
u0=[1;0];
