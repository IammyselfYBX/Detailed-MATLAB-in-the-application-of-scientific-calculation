sale=[100 150 400 250];
h(1)=subplot(121);
pie(sale,[0 0 0 1]);  % 绘制二维饼图并将第4块脱离
colormap(cool);
h(2)=subplot(122);
pie3(sale,[0 0 1 0],{'spring:11%','summer:17%','autumn:44%','winter:28%'});  % 绘制三维饼图
colormap(jet);
% 重新设置标注字符串的位置
set(findobj(gca,'type','text','string','spring:11%'),'position',[-1 1.2 0.5]);
set(findobj(gca,'type','text','string','summer:17%'),'position',[-1.8 0.4275 0.25]);
set(findobj(gca,'type','text','string','autumn:44%'),'position',[0.2 -1.5 -0.1]);
set(findobj(gca,'type','text','string','winter:28%'),'position',[1 0.8 0.4]);
