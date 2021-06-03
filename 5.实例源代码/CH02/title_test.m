subplot 121
plot(magic(3))
title('\itmagic','fontname','times','fontsize',16)  % 添加标题
set(get(gca,'title'),'string','\itmagic','fontname',...
    'times new roman','fontsize',16)  % 设置标题字体及字号
subplot 122
plot(magic(3))
title({'{\itmagic}';'魔方阵'},'fontname','times','fontsize',16)
% title(strjust(char('{\itmagic}','魔方阵'),'center'),...
    % 'fontname','times','fontsize',16)
