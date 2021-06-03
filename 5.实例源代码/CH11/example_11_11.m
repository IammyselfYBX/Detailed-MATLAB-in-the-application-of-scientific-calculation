function example_11_11
fun = @(x)sum((x-0.2).^2);
x0 = [0.25,0.25,0.25]; 
[x,fval] = fseminf(fun,x0,1,@mycon)
function [C,Ceq,K1,S] = mycon(x,S)
% 初始化样本间距：
if  isnan(S(1,1)),
   S = [2 2];
end
% 设置样本集
w1x = 1:S(1,1):100;
w1y = 1:S(1,2):100;
[wx, wy] = meshgrid(w1x,w1y);
% 计算半无限约束函数值 
K1=sin(wx*x(1)).*cos(wx*x(2))-1/1000*(wx-50).^2-sin(wx*x(3))-x(3)+...
sin(wy*x(2)).*cos(wx*x(1))-1/1000*(wy-50).^2-sin(wy*x(3))-x(3)-1.5;
% 无非线性约束
C = []; Ceq=[];
% 作约束曲面图形
surf(wx,wy,K1,'edgecolor','none','facecolor','interp');
camlight headlight
title('二维半无限最优化问题')
drawnow
set(gcf,'Color','w')
