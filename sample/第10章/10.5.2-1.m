% 使用ode45函数求解常微分方程，其中参数@vdpl表示采用了vdpl的算法来求解微分方程，而不采用系统默认耳朵算法来求解。参数[0,20]分别为方程解的上下限，参数[2,0]表示了常微分方程的初始值。
[t,y]=ode45(@vdp1,[0 20],[2 0]);
% 绘制出如图10-11所示的函数曲线图形
plot(t,y(:,1));
