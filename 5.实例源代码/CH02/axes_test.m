axes('Position',[0.25,0.25,0.5,0.5],...  % 坐标轴位置
    'Box','on',...  % 密封边框
    'Color',0.5*ones(1,3),...  % 坐标轴背景颜色
    'TickLength',[0.05 0.01],...  % 坐标轴刻度标记的长度
    'TickDir','out',...  % 刻度标记从坐标轴线向外
    'XDir','reverse',...  % 逆转x轴
    'XGrid','on','GridLineStyle','-.',...  %  x轴上的格栅线并设置其线型为点划线
    'Ylim',[0 10],...  % 设置y轴范围
    'Ytick',[2,4,5,7],...  % 设置y坐标刻度
    'Yticklabel',{'Two','Four','Five','Seven'},...  % 字符串标注y轴刻度
    'xminortick','on',...  % 使坐标轴加密
    'LineWidth',2,...  %  x,y和z坐标轴线的宽度
    'XColor','b',...  % 设置x轴的颜色为蓝色
    'YAxisLocation','right')  % 将y轴的刻度标在右侧
text(0.5,11.5,'Axes Demo','fontname','times','fontsize',12,...
    'HorizontalAlignment','center')
