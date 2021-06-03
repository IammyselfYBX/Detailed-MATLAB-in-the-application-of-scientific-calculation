%%%%%%%%% 以下代码主要用于实现MATLAB模块与Excel模块之间的热链接 %%%%%%%%%%%
% 清空当前内存中的所有变量
clear
% 绘制函数图形 peaks(20)
h=surf(peaks(20));
% 得到曲面得Z坐标数据
z=get(h,'zdata');
% 为MATLAB与Excel之间的DDE对话建立通道chann
chann=ddeinit('excel','sheet3');
% 将Excel空白表格中的指定区域（r1c1至r20c20），命名为range2
range2='r1c1:r20c20';
% 将Z坐标数据的内容复制到Excel的指定空白区域中
rc=ddepoke(chann,range2,z);
% 借助通过chann将MATLAB与Excel之间建立一个热链接
rc=ddeadv(chann,range2,'set(h,"zdata",z);','z');
% 添加“关闭按钮”
hc=uimenu(gcf,'Label','关闭')；
% 添加“关闭热链接按钮”
hc1=uimenu(hc,'Label',----
'关热链接','Callback','ddeunadv(chann,range2);');
% 添加“关闭对话”按钮
hc2=uimenu(hc,'Label','关闭对话','Callback','ddeterm(chann)');
% 添加“关闭图形窗口”按钮
hc3=uimenu(hc,'Label','关闭图形','Callback','close');