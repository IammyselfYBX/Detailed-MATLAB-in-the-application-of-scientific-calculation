%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下代码用于使用imhist函数对图片的轮廓进行分析
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 使用imread函数打开MATLAB系统搜索路径范围内一个名为coil.jpg的图片
b=imread('coil','jpg');
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数1用于指定当前所绘制的图形序列数为1
subplot(1,2,1)
% 绘制出原始图形，用于图形的对比
imshow(b)
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数2用于指定当前所绘制的图形序列数为2
subplot(1,2,2)
% 使用imhist函数绘制图形的灰度柱状图，其中参数64用于指定灰度的阶数，即可以将灰度分割为264种不同的色阶
imhist(b,64)
% 得到如图11-22所示的图形
