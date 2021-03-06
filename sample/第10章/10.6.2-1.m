% 将4个表达式中的所有复数变量构建成一个复数矩阵的形式
a=[1/(3+2i), 1/i-3i/(1-i), (3+4i)*(2-5i)/2i, i^9-4*i^21+i]
% 利用real函数求解复数的实部
real(a)
% 利用imag函数求解复数的虚部
imag(a)
% 利用conj函数求解复数的共轭复数
conj(a)
% 利用abs函数求解复数的模
abs(a)
% 利用angle函数求解复数的幅角
angle(a)
