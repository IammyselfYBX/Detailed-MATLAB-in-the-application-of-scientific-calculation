f=@(t,a,b)sin(t).^2.*exp(-a*t)-b*abs(t)-0.1;  % 定义函数表达式
t=-10:0.01:10;
a=0.1;b=0.5;
plot(t,f(t,a,b))  % 绘制图形
hold on
plot(xlim,[0 0],'k')  % 绘制直线y=0
[tt,yy]=ginput(4)  % 鼠标取点
for k=1:length(tt)
x=fzero(@(t)f(t,a,b),tt(k));  % fzero函数求根
    % x=fzero(f,tt(k),[],a,b);
    T(k)=x;  % 将根依次存入向量T中
end
T