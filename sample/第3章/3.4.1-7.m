a=[ 8 2 2 8],b=[6 1 6 1]	%构建多项式的系数向量
a+b							%系数向量对应相加
y1=poly2sym(a)				%从系数向量构建多项式
y2=poly2sym(b)
poly2sym(a+b)				%多项式相加