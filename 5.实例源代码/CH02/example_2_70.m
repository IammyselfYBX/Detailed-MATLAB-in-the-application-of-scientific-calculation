t = linspace(0,2.5*pi,40);
fact = 10*sin(t);
fig=figure;
aviobj = avifile('example.avi')  % 定义.avi文件
[x,y,z] = peaks;
for k=1:length(fact)
    h = surf(x,y,fact(k)*z);
    axis([-3 3 -3 3 -80 80])
    axis off
    caxis([-90 90])
    F= getframe(fig);  % 获取当前坐标轴图像信息
    aviobj = addframe(aviobj,F);  % 把当前图像添加到.avi文件中
end
close(fig)  % 关闭句柄fig
aviobj = close(aviobj);  % 关闭句柄aviobj
