x=2004:2008;
sales=[51.6 82.4 90.8 59.1 47.0];
expense=[19.3 34.2 61.4 50.5 29.4];
area(x,sales,'facecolor',[0.5 0.9 0.6],'edgecolor','b','linewidth',2);  % 绘制面积图并设置属性
hold on
area(x,expense,'facecolor',[0.9 0.85 0.7],'edgecolor','y','linewidth',2);
set(gca,'xtick',[2004:2008]);
set(gca,'Layer','top');
gtext('\leftarrow销售额');
gtext('成本');
gtext('利润');
xlabel('年份','fontsize',14);
ylabel('利润+成本=销售额','fontsize',12);
