%%%%%%%%%%%%%%%%%%% 本代码主要用于绘制二维饼形图形 %%%%%%%%%%%%%%%%%%
x=[1 3 0.5 2.5 2];		%设置饼形图中各个模块的比重参数
explode=[0 1 0 0 0];		%将对应比重为3的那个模块设置突出显示
pie(x,explode)				%绘制饼图
%%% 得到如图5-21所示的图形
