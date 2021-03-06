%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下代码用于使用imrotate函数对图片进行旋转
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 使用imread函数打开MATLAB系统搜索路径范围内一个名为a.jpg的图片
a=imread('a','jpg');
% 使用imrotate函数，以双线性插值算法对图形a进行逆时针方向旋转45度操作。其中参数a为图形文件；45为图形逆时针旋转的角度；参数'bilinear'表示选用的是双线性插值算法
b=imrotate(a,45,'bilinear');

%%%%%%%%%%%%%%%%%%%%% 以下代码主要用于图形的显示 %%%%%%%%%%%%%%%%%%%%%%%%
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数1用于指定当前所绘制的图形序列数为1
subplot(1,2,1)
% 绘制原始的图形文件a
imshow(a)
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数2用于指定当前所绘制的图形序列数为2
subplot(1,2,2)
% 绘制旋转后的图形b
imshow(b)
% 得到如图11-18所示的图形
