function fzero_demo
options = optimset('OutputFcn', @myoutput);  % 调用myoutput函数以设置优化参数'OutputFcn'
xx=fzero(@humps,[0,2],options);  % fzero函数求根
% xx=fzero(@humps,1.5,options);
plot([0,2],[0,0],'k:',xx,humps(xx),'k*')  % 绘制图形
text(1,40,['humps函数零点{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % 添加标注
% 下面函数的主要功能是绘制优化求解过程中每一步迭代的数据点
function stop = myoutput(x,optimvalues,state);
history = [];  % 预置一个空矩阵
stop = false;
if state == 'iter'  % 若状态state=iter则进行如下操作
    history=[history;x];  % 将迭代点存入history中
end
fplot(@humps,[0,2])  % 绘制humps函数图形
hold on  % 图形保持
plot(history,humps(history),'r.',...
    'MarkerSize',14)  % 绘制图形
pause(1)  % 暂停1秒
