%%%%%%%%%%%% 本代码主要用于修改系统默认值并绘制图形　%%%%%%%%%%%%%%%%%%
% 通过参数'color','white'设置系统图形对象的颜色为白色
hf1=figure('color','white');

% 通过参数'DefaultAxesColorOrder',[0 0 0]设置系统图形曲线的颜色为灰色
% 通过参数'DefaultAxesLineStyleOrder','-|--|:|-.'设置系统图形曲线的线型为-|--|:|-
set(0,'DefaultAxesColorOrder',[0 0 0],'DefaultAxesLineStyleOrder','-|--|:|-.')
z=peaks;
plot(1:49,z(4:7,:))			% 绘制函数图形
%%% 得到如图6-66所示的图形
