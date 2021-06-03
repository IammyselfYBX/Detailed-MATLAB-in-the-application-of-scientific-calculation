% 将MATLAB系统中的deblank函数以句柄的形式传递给变量fhandle
fhandle=@deblank;
% 使用feval函数来显示三个字符串’string’, ‘with’,’blanks’
feval(fhandle, {‘string’, ‘with    ’, ‘blanks          ’})
