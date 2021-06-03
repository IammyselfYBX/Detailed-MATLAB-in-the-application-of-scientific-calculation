function d=nargintest(a, b, c)		% Ｍ文件名为nargintest
% 利用nargin函数统计输入变量个数
if nargin <= 1
% 输入变量个数小于１，则报错“Not enough input arguments.”
error(‘Not enough input arguments.’)
elseif nargin == 2
% 输入变量个数等于２，则两个数相加
	d=a+b;
	elseif nargin =3
% 输入变量个数等于２，则前两个数相加并减去第３个数
		d=a+b-c;
end
