function example_9_13
sol = dde23(@ddefun,[1, 0.2],ones(3,1),[0,5]);  % 利用dde23函数求解延迟微分方程组
plot(sol.x,sol.y)  % 绘制求解结果图形
xlabel('时间：t');  % 添加x轴标注
ylabel('微分方程组的解：y');  % 添加y轴标注
grid on  % 添加网格线
h=legend('{\ity}_1','{\ity}_2','{\ity}_3',2);  % 添加图例
set(h,'fontname','times','fontsize',12)  % 设置图例字体和字号
% 微分方程函数描述
function dydt = ddefun(t,y,Z)
% Z(i,j)表示状态变量y_j延迟了lags(i)
ylag1 = Z(:,1);  % 第一列表示延迟了lags(1)=1的所有状态变量
ylag2 = Z(:,2);  % 第二列表示延迟了lags(2)=0.2的所有状态变量
% y1延迟了1，故表示为Z(1,1)或者ylag1(1)
% y2延迟了0.2，故表示为Z(2,2)或者ylag2(2)
dydt = [ ylag1(1)
         ylag1(1) + ylag2(2)
         y(2)               ];  % 微分方程描述
