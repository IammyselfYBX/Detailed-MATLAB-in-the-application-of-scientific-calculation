%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下代码用于使用imcontour函数对图片的轮廓进行分析
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 使用imread函数打开MATLAB系统搜索路径范围内一个名为a.jpg的图片
b=imread('1','bmp');
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数1用于指定当前所绘制的图形序列数为1
subplot(1,2,1)
% 显示出原始图形
imshow(b)
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数2用于指定当前所绘制的图形序列数为2
subplot(1,2,2)
% 绘制出原始图像的轮廓图
imcontour(b);
% 得到如图11-23所示的图形
