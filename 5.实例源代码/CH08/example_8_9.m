function example_8_9
format long
xi=0.1;
I=adapt_Cotes(@Dampedsinewave,0,20,[],xi)  % 数值解
function f=Dampedsinewave(t,xi)
alpha=atan(-xi/sqrt(1-xi^2));  % 计算alpha
f=exp(-xi*t).*cos(t*sqrt(1-xi^2)+alpha)/cos(alpha);  % 求函数值
