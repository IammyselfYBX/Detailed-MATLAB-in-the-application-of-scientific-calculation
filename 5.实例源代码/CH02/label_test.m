subplot 121
plot(magic(3))
xlabel('\itx','fontname','times','fontsize',16)  % ���x���ע
ylabel('{\itf}({\itx})','fontname','times','fontsize',16)  % ���y���ע
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
% ˵��������'times new roman'���Լ�дΪ'times'
