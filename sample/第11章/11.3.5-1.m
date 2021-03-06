%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下代码用于使用imadjust函数对图片的灰度进行调整
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 使用imread函数打开MATLAB系统搜索路径范围内一个名为a.jpg的图片
a=imread('a','jpg');
% 对图形的灰度进行调整，将灰度低于0的值修改为0.5，灰度大于0.2的值修改为1。其中参数a为需要调整的图片名；参数[0 0.2]与参数[0.5 1]相对应，即灰度低于0的值修改为0.5，灰度大于0.2的值修改为1
b=imadjust(a,[0 0.2],[0.5 1]);
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数1用于指定当前所绘制的图形序列数为1
subplot(1,2,1)
% 绘制出原始图片a
imshow(a)
% 绘制一个1*2的四格图像，第一个参数1用于设定多格图形的行数；第二个参数2用于设定多个图形的列数；第三个参数2用于指定当前所绘制的图形序列数为2
subplot(1,2,2)
% 绘制出灰度调整后的图片b
imshow(b)
% 得到如图11-19所示的图形
