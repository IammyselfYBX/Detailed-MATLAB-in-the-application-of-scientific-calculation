%%%%%%%%%%%%%%%%%% 本代码主要用于绘制compass图形 %%%%%%%%%%%%%%%%%%
%%% 创建原始数据
wdir=[45 90 90 45 360 335 360 270 335 270 335 335];
knots=[6 6 8 6 3 9 6 8 9 10 14 12];
rdir=wdir*pi/180;
[x,y]=pol2cart(rdir,knots);		%　建立函数关系表达式
compass(x,y)						%	绘制的等高线
hold on								%　	图形保持
desc={'wind Direction and Strength at',
         'Logan Airport for',
         'Nov.3 at 1800 through',
         'Nov.4 at 0600'};			%   添加相关描述
text(-28,15,desc)					%　	添加标题
%%% 得到如图5-26所示的图形
