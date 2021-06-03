% 句柄函数的定义
function x=plotFHandle(fhandle, data)
plot(data, fhandle(data))
