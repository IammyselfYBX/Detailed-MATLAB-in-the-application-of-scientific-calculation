subplot 121
plot(magic(3))
title('\itmagic','fontname','times','fontsize',16)  % ��ӱ���
set(get(gca,'title'),'string','\itmagic','fontname',...
    'times new roman','fontsize',16)  % ���ñ������弰�ֺ�
subplot 122
plot(magic(3))
title({'{\itmagic}';'ħ����'},'fontname','times','fontsize',16)
% title(strjust(char('{\itmagic}','ħ����'),'center'),...
    % 'fontname','times','fontsize',16)
