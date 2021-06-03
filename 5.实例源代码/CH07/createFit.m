function createFit(t,y)
f_ = clf;
figure(f_);
set(f_,'Units','Pixels','Position',[608 195 512 353]);
legh_ = []; legt_ = {};   % handles and text for legend
xlim_ = [Inf -Inf];       % limits of x axis
ax_ = axes;
set(ax_,'Units','normalized','OuterPosition',[0 0 1 1]);
set(ax_,'Box','on');
axes(ax_); hold on;
% --- Plot data originally in dataset "初始数据点"
t = t(:);
y = y(:);
h_ = line(t,y,'Parent',ax_,'Color',[0 0 0],...
    'LineStyle','none', 'LineWidth',1,...
    'Marker','o', 'MarkerSize',6);
xlim_(1) = min(xlim_(1),min(t));
xlim_(2) = max(xlim_(2),max(t));
legh_(end+1) = h_;
legt_{end+1} = '初始数据点';
if all(isfinite(xlim_))
    xlim_ = xlim_ + [-1 1] * 0.01 * diff(xlim_);
    set(ax_,'XLim',xlim_)
else
    set(ax_, 'XLim',[-0.59999999999999998, 60.600000000000001]);
end
% --- Create fit "拟合曲线"
ok_ = isfinite(t) & isfinite(y);
if ~all( ok_ )
    warning( 'GenerateMFile:IgnoringNansAndInfs', ...
        'Ignoring NaNs and Infs in data' );
end
st_ = [0.03868644380891828 0.83166159493721969 0.85116466323169859 ];
ft_ = fittype('1./(a*exp(-b*x)+c)',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'a', 'b', 'c'});
% Fit this model using new data
cf_ = fit(t(ok_),y(ok_),ft_,'Startpoint',st_);
% Or use coefficients from the original fit:
if 0
    cv_ = { 7.3796669091288116, 0.14398953360511776, 0.2213651927733373};
    cf_ = cfit(ft_,cv_{:});
end
% Plot this fit
h_ = plot(cf_,'fit',0.95);
legend off;  % turn off legend from plot method call
set(h_(1),'Color',[0 0 1],...
    'LineStyle','-', 'LineWidth',1,...
    'Marker','none', 'MarkerSize',6);
legh_(end+1) = h_(1);
legt_{end+1} = '拟合曲线';
% Done plotting data and fits.  Now finish up loose ends.
hold off;
leginfo_ = {'Orientation', 'vertical'};
h_ = legend(ax_,legh_,legt_,leginfo_{:}); % create and reposition legend
set(h_,'Units','normalized');
t_ = get(h_,'Position');
t_(1:2) = [0.137783,0.773815];
set(h_,'Interpreter','none','Position',t_);
xlabel(ax_,'');               % remove x label
ylabel(ax_,'');               % remove y label
