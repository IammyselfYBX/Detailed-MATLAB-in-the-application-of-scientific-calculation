function ch=zihanshu(x,y)		% 主函数名为zihanshu

% 分别调用zihanshu1与zihanshu2来求解最终的结果
ch=zihanshu1(x,y)*zihanshu2(x,y)	

% 求解输入两个参数的绝对值的和
function ch=zihanshu1(x,y)
ch=abs(x)+abs(y);

% 求解输入两个参数的代数和
function ch=zihanshu2(x,y)
ch=x+y;
