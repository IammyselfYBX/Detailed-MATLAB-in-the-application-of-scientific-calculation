axes('Position',[0.25,0.25,0.5,0.5],...  % ������λ��
    'Box','on',...  % �ܷ�߿�
    'Color',0.5*ones(1,3),...  % �����ᱳ����ɫ
    'TickLength',[0.05 0.01],...  % ������̶ȱ�ǵĳ���
    'TickDir','out',...  % �̶ȱ�Ǵ�������������
    'XDir','reverse',...  % ��תx��
    'XGrid','on','GridLineStyle','-.',...  %  x���ϵĸ�դ�߲�����������Ϊ�㻮��
    'Ylim',[0 10],...  % ����y�᷶Χ
    'Ytick',[2,4,5,7],...  % ����y����̶�
    'Yticklabel',{'Two','Four','Five','Seven'},...  % �ַ�����עy��̶�
    'xminortick','on',...  % ʹ���������
    'LineWidth',2,...  %  x,y��z�������ߵĿ��
    'XColor','b',...  % ����x�����ɫΪ��ɫ
    'YAxisLocation','right')  % ��y��Ŀ̶ȱ����Ҳ�
text(0.5,11.5,'Axes Demo','fontname','times','fontsize',12,...
    'HorizontalAlignment','center')
