% 绘制双y轴图形
t=1:6;  % 时间
Income=[2456 2032 1900 2450 2890 2280];  % 销售收入
Profit=[12.5 11.3 10.2 14.5 14.3 15.1]/100;  %边际利润率
[AX,H1,H2]=plotyy(t,Income,t,Profit,@stem,@plot);  % 绘制双y轴图形
% 修饰图形
xlabel('时间')  % x轴标注
ylabel(AX(1),'销售利润')  % 左y轴的标注
% 等价形式：set(get(AX(1),'ylabel'),'String','销售利润')  
ylabel(AX(2),'边际利润率')  % 右y轴的标注
% 等价形式：set(get(AX(2),'ylabel'),'String','边际利润率')
xlim(AX(1),[min(t)-1,max(t)+1]);  % 设置x轴范围
% 等价形式：set(AX(1),'xlim',[min(t)-1,max(t)+1])
xlim(AX(2),[min(t)-1,max(t)+1]);  % 设置x轴范围
% 等价形式：set(AX(2),'xlim',[min(t)-1,max(t)+1])
set(H1,'LineStyle',':',...  % 设置线型
    'LineWidth',2,...  % 设置线宽
    'Marker','s',...  %设置标记符号
    'MarkerEdgeColor','k',...  % 设置标记符号边缘的颜色
    'MarkerFaceColor','g',...  % 设置标记符号内部区域的颜色
    'MarkerSize',6)  % 设置标记符号的大小
set(H2,'LineWidth',2,...  % 设置线宽
    'Marker','o')  % 设置标记符号
