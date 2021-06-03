Y = round(rand(5,3)*10);
subplot(2,2,1)
bar(Y,'group')  % 排列型条形图
title 'Group'  % 添加标题
subplot(2,2,2) 
bar(Y,'stack')  % 堆型条形图
title 'Stack'  % 添加标题
subplot(2,2,3)
barh(Y,'stack')  % 堆型水平条形图
title 'Stack'  % 添加标题
subplot(2,2,4)
bar(Y,1.5)  % 设置bar的宽度为1.5
title 'Width = 1.5'  % 添加标题
