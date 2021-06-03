yeah=1:8;
SH=[9763.30 26363.90 25066.13 30107.17 24211.02 30859.29 47334.82 33367.09];
SZ=[5153.50 14026.10 12488.62 15632.95 12864.78 15319.54 23561.32 17170.44];
plot(yeah,SH,'*',yeah,SZ,'o')  % 绘制数据点
p1=polyfit(yeah,SH,7)      % 7次多项式拟合
p2=polyfit(yeah,SZ,7)      % 7次多项式拟合
t=linspace(1,8,100);  % 加密数据点
z1=polyval(p1,t);  % 求多项式的拟合值
z2=polyval(p2,t);  % 求多项式的拟合值
hold on
h=plot(t,z1,t,z2);
[legh,objh,outh,outm]=legend(h,'上海股票交易成交金额','深圳股票交易成交金额',2);
set(objh(4),'marker','*');  % 设置对应曲线z1图例上的标记符号为*
set(objh(6),'marker','o');  % 设置对应曲线z2图例上的标记符号为o

