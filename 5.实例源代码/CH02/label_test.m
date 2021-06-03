subplot 121
plot(magic(3))
xlabel('\itx','fontname','times','fontsize',16)  % 添加x轴标注
ylabel('{\itf}({\itx})','fontname','times','fontsize',16)  % 添加y轴标注
% set(get(gca,'xlabel'),'string','\itx','fontname',...
   % 'times new roman','fontsize',16)
% set(get(gca,'ylabel'),'string','{\itf}({\itx})','fontname',...
   % 'times new roman','fontsize',16)
subplot 122
plot(magic(3))
xlabel({'x';'y'},'fontname','times',...
    'fontangle','italic','fontsize',16)
% xlabel(char('x','y'),'fontname','times',...
    % 'fontangle','italic','fontsize',16)
% 说明：字体'times new roman'可以简写为'times'
