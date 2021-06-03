syms x
f=(x-1)*(x-2)*(x-3)
collect(f)				%合并同类项
collect(f,x^2)			%对x^2进行合并
collect(f,x^3)			%对x^3进行合并
