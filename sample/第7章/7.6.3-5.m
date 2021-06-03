x=rand(2048,1);	% 产生一个随机数
t=clock;			% 开始计时
fft(x);				% 对随机数进行运算操作
etime(clock,t)		% 统计从clock到t之间的时间间隔
