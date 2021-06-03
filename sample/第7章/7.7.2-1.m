用户编写如下代码，作为M文件test1的内容
function y=test1(x)		
x=1;				//设定x的初始值为1
for i=1:10000		//循环体，即i从1依次循环到10000
	y(i)=sin(x);	//每次循环都实现y=sin(x)
	x=x+0.1*pi;	//每次循环x都自增加0.1*pi
end

用户编写如下代码，作为M文件test2的内容
function y=test2
x=1:0.1*pi:1000*pi	//设置x的初始值为1，最终值为1000pi，步进为0.1*pi
y=sin(x);				//执行y=sinx
