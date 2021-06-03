function example_11_5
options = optimset('OutputFcn', @myoutput);  % 设置优化参数'OutputFcn'
[x fval] = fminbnd(@humps,0,1,options)  % 单变量优化求解
plot(x,fval,'kv','markersize',8,'MarkerFaceColor','k')  % 绘制最优解
text(x-0.4,fval-7,['极小值点：(',num2str(x),',',num2str(fval),')'])  % 添加标注
function stop = myoutput(x,optimvalues,state);  % 优化方法的输出函数（类似于第六章介绍的fzero函数）
history = [];
stop = false;
if state == 'iter'
    history=[history;x];
end
fplot(@humps,[0,2])
hold on
plot(history,humps(history),'r.',...
    'MarkerSize',14)  % 绘制迭代点
pause(1)  % 暂停1秒
