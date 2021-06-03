%%%%%%%%%%%%%%%%%%% 本代码主要用于绘制条状图 %%%%%%%%%%%%%%%%%%%%
Y=round(rand(5,3)*10);		% 通过rand(5,3)生成原始的离散数据
subplot(2,2,1)					% 生成子图1
bar(Y,'group')					% 绘制条形图1
title 'Group'					% 为子图１添加标题‘Group’
hold on							% 图形保持
subplot(2,2,2)					% 生成子图2
bar(Y,'stack')					% 以stack方式绘制条形子图2
title 'Stack'					% 为子图２添加标题‘stack’
subplot(2,2,3)					% 生成子图3
barh(Y,'stack')				% 绘制条形图3(水平方向)
title 'Stack'					%为子图3添加标题‘stack’
subplot(2,2,4)					% 生成子图4
bar(Y,1.5)						% 设置条形的间距为1.5
title 'Width=1.5'				% 为子图4添加标题'Width=1.5'
%%% 得到如图5-20所示的条状图
