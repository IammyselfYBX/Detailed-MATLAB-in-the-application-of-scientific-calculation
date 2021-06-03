x=-1:0.01:1;  % 加密数据点
xdata=-1:0.2:1;  % 已知数据点
ydata=1./(1+25*xdata.^2);  % 已知数据点
y=Lagrange_interp(xdata,ydata,x);  % Lagrange插值
plot(xdata,ydata,'ko',x,y,'k',x,1./(1+25*x.^2))  % 绘制图形
