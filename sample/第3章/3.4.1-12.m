v=[3 4 5]					%构建多项式系数向量
y1=polyint(v)				%设置常数项为0
y2=polyint(v,1)			%设置常数项为1
Y1=poly2sym(y1)
Y2=poly2sym(y2)