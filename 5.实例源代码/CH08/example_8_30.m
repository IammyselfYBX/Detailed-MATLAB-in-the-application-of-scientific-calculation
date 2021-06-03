%----------求梯度的解析解---------%
syms x y;
z = x * exp(-x^2 - y^2);
zx=diff(z,x);
zy=diff(z,y);
%----------绘图比较解析解和数值解---------%
[x,y] = meshgrid(-2:.2:2);
zx=subs(zx);zy=subs(zy);  %梯度的解析解
z = x.* exp(-x.^2 - y.^2);
[px,py] = gradient(z,.3,.3);
px=px*0.3/0.2;py=py*0.3/0.2;  %计算实际的梯度值
contour(z),hold on,quiver(zx,zy),hold off
figure
contour(z),hold on, quiver(px,py), hold off
figure
surf(x,y,abs(px-zx))  %绘制dz/dx的误差曲面
