% 创建一个名为warning1的函数形式的M文件
function z=warning1(x, y)

用nargin函数来统计输入的参数的个数
if nargin==2			% 输入为2个参数
	z=x*y;				% 两个参数的乘积
elseif nargin==1		% 输入为1个参数
	{		% 给出警告信息
		warning(‘you should input 2 arguments’)
}
else 					% 输入参数的个数不为1，也不为2
error(‘Wrong number of input arguments’)
end
