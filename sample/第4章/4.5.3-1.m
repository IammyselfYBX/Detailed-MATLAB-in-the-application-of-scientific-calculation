syms t w 
ft=Heaviside(t)		%建立单位阶跃函数
Fw=fourier(ft)			%求解单位阶跃函数的傅里叶变换
ft=ifourier(Fw)		%求解单位阶跃函数的傅里叶反变换
