A=[1 2;3 4;5 6]
rot90(A) 		%逆时针方向旋转90度
rot90(A,-1) 	%逆时针方向旋转-90度，即顺时针旋转90度
flipud(A)		%将矩阵进行上下翻转
fliplr(A)		%将矩阵左右翻转
flipdim(A,2)	%将矩阵A中的第2维向量进行翻转