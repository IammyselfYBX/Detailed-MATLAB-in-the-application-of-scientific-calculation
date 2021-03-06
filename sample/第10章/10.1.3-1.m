%%%%%%%%%%%% 下述代码主要用于对原有数据函数进行快速Fourier变换 %%%%%%%%%%
% 构建x数据表
x=[4 3 2 1 0 1 2 3];
fft(x)	% 对数据x进行快速Fourier变换
%%%%%%%%%%%%%%%% 下述代码主要用于对原有数据函数进行卷积计算 %%%%%%%%%%%%%%%
% 构建x数据表
x=[4 3 2 1 0 1 2 3];
% 构建对应的卷积数据表
y=[1 1 1 1 1 1 1 1];
% 对x原始数据进行了19点的快速Fourier变换
% 对y原始数据进行了19点的快速Fourier变换
fy=fft(y,19)
% 对x和y进行卷积操作
xy=conv(x,y)
% 对x和y的卷积结果进行逆运算
yx=ifft(fx.*fy)
% 对x和y的卷积逆运算的结果进行滤波处理，去除虚部的残余数据
real(yx)
