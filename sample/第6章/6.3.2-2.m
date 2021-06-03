%%%%%%%%%%% 本代码主要用于绘制等高线图形并修改它的线型和线宽 %%%%%%%%%%%%%%%%
[x,y,z]=peaks;								% 坐标函数图形
[c,h]=contour(x,y,z);						% 绘制等高线
set(h,'LineWidth',3,'LineStyle',':')	% 改变线型为“：”，以及线宽为3
% 参数ｈ表示需要修改属性图形的名称；参数'LineWidth',3表示设置当前图形的线宽为3
%'LineStyle',':'表示改变当前图形的线型为“：”
%%% 得到如图6-58所示的图形
