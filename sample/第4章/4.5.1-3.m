h=hilb(3)			%建立3阶希尔伯特矩阵
h=sym(h)			%将希尔伯特矩阵转换成符号矩阵
inv(h)				%符号矩阵的逆矩阵
det(h)				%符号矩阵的行列式
v=vpa(h,16)		%用16位的精度转换成数值矩阵
inv(v)				%对带有误差的矩阵进行求逆
det(v)			%对带有误差的矩阵进行行列式的计算