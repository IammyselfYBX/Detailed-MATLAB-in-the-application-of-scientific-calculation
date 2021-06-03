function tic 
% tic start a stopwatch timer
% tic any stuff toc
% printf the time required
% see also tic clock 

globle tictoc 			% 定义一个全局变量tictoc
tictoc = clock;		% 将tictoc赋值为当前的系统时间

function 1=toc		% 编写名为1=toc的函数形式的M文件
% toc read the stopwatch timer
% toc prints the elapsed time since tic was used.
% t=toc; saves elapsed time in t, does not print 
% see also: tic etime

global TICTOC
if nargout < 1		% 统计输入参量的个数，返回时间
	elapsed_time = etime(clock, TICTOC)
else 
	t=etime(clock, TICTOC);
end
