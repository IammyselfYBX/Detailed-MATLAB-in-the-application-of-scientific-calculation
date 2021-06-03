f1='sqrt(x^2 + y^2)';
f2 = @(x,y) sqrt(x.^2 + y.^2);
f3 = @(x,y) 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
   - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
   - 1/3*exp(-(x+1).^2 - y.^2);
f4 =@(x,y,k) x.^k - y.^k - 1;
subplot(221)
ezcontour(f1)
subplot(222)
ezcontour(f2,[-2,2,-3,3])  % 绘制等高线并设置坐标轴范围
% ezcontour(f2,[-2,2],[-3,3])
subplot(223)
ezcontour(@(x,y)f3(x,y),[-3,3],49)
subplot(224)
ezcontour(@(x,y)f4(x,y,2))
