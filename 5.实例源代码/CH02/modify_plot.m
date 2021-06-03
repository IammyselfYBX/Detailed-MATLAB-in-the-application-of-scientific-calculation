figure('name','图形标注综合演示',...
    'numbertitle','off');
x=linspace(0,6,1000);
plot(x,cos(x),'k-',x,1./cosh(x),'r:')
xd=fzero(@(x)cos(x)-1./cosh(x),5);
xn=linspace(0,xd,50);
hold on
fill([xn,fliplr(xn)],[1./cosh(xn),fliplr(cos(xn))],'y')
plot(xd,cos(xd),'k.','MarkerSize',20)
legend({'$$\cos (x)$$','$$\frac{1}{{\cosh (x)}}$$'},'interpreter','latex');
text(xd,cos(xd)-0.1,['\fontname{times}\fontsize{16}{\itx}_d=',num2str(xd)])
xlabel('\fontname{times}\fontsize{16}\itx')
ylabel('\fontname{times}\fontsize{16}{\itf}({\itx})')
title('图形标注综合演示','fontname','隶书','fontsize',16)
annotation('textbox','Position',[0.15 0.5881 0.1304 0.06667],...
  'FitHeightToText','off','String',{'ylabel(''f(x)'')'});
% Create arrow
annotation('arrow',[0.1875 0.07679],[0.5881 0.5214]);
% Create textarrow
annotation('textarrow',[0.6857 0.775],[0.6905 0.5048],...
  'String',{'text(xd,cos(xd),[''xd='',num2str(xd)])'});
% Create textbox
annotation('textbox','Position',[0.3 0.1405 0.1143 0.06449],...
  'FitHeightToText','off','String',{'xlabel(''x'')'});
% Create arrow
annotation('arrow',[0.3839 0.5054],[0.1357 0.03095]);
% Create ellipse
annotation('ellipse',[0.3143 0.7667 0.3196 0.09524]); 
% Create textbox
annotation('textbox','Position',[0.2071 0.9333 0.05714 0.05952],...
  'FitHeightToText','off','String',{'title'});
% Create arrow
annotation('arrow',[0.2625 0.3607],[0.9619 0.9643]);
% Create textbox
annotation('textbox','Position',[0.3357 0.7667 0.25 0.07857],...
  'LineStyle','none','FitHeightToText','off',...
  'String',{'legend(''cos(x)'',''1/cosh(x)'')'}); 
% Create doublearrow
annotation('doublearrow',[0.6339 0.6964],[0.8143 0.8143]);
% Create textarrow
annotation('textarrow',[0.7411 0.5857],[0.2429 0.3643],'String',{'fill(x,y,''y'')'});
set(gcf,'Color','w');