D = linspace(-100,0,50);  % y������
S = linspace(34,32,50);  % ��x������
T = 10*exp(D/40);  % ��x������
xlabels{1} = 'Temperature (C)';  % ��x���ע
xlabels{2} = 'Salinity';  % ��x���ע
ylabels{1} = 'Depth(m)';  % ��y���ע
ylabels{2} = 'Depth(m)';  % ��y���ע
[ax,hlT,hlS] = plotxx(T,D,S,D,xlabels,ylabels);  % ����˫x������
set(ax,'ylim',[-110,10])  % ����y��ķ�Χ
set([hlT,hlS],'LineWidth',1.5)  % �����߿�
