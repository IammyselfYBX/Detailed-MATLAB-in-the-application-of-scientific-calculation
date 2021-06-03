D = linspace(-100,0,50);  % y轴数据
S = linspace(34,32,50);  % 上x轴数据
T = 10*exp(D/40);  % 下x轴数据
xlabels{1} = 'Temperature (C)';  % 下x轴标注
xlabels{2} = 'Salinity';  % 上x轴标注
ylabels{1} = 'Depth(m)';  % 左y轴标注
ylabels{2} = 'Depth(m)';  % 右y轴标注
[ax,hlT,hlS] = plotxx(T,D,S,D,xlabels,ylabels);  % 绘制双x轴曲线
set(ax,'ylim',[-110,10])  % 设置y轴的范围
set([hlT,hlS],'LineWidth',1.5)  % 设置线宽
