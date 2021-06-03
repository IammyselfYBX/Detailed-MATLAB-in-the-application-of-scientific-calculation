function PI=buffon(a,l,n)
% 蒲丰投针实验
% 输入参数：
%       ---a：平行线间距
%       ---l：针的长度
%       ---n：实验模拟的次数
% 输出参数：
%       ---PI：圆周率pi的近似值
if nargin<3,n=5000;end
if nargin<1,a=1;l=0.8;end
rand('state',2006)  % 设定随机数状态
theta=linspace(0,pi);
plot(theta,l*sin(theta)/2)
hold on
x=rand(1,n)*a/2;
Theta=rand(1,n)*pi;
k=find(x<l*sin(Theta)/2);
plot(Theta(k),x(k),'.')
m=sum(x<l*sin(Theta)/2);
PI=2*l*n/(a*m);
text(-0.3,1.15*l/2,['落入区域G的点数m=',num2str(m)])
text(-0.3,1.05*l/2,['圆周率的估计值\pi=',num2str(PI)])
title('\fontname{隶书}\fontsize{16}蒲丰投针实验')
axis([-0.4,3.5,0,1.2*l/2])
