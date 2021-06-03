a=pascal(4)		%建立一个4阶的pascal矩阵
v=diag(a)			%抽取主对角线元素
v=diag(a,2)		%抽取主对角线上方第2条对角线元素
v=diag(diag(a))	%以对角线元素来建立对角矩阵
