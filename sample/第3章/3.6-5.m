x1=[2 -2 -8 8]			%构建多项式1的系数向量
x2=[1 -1 -4 4]			%构建多项式2的系数向量
y1=conv(x1,x2)			%求解多项式乘积的系数向量
X1=poly2sym(x1)		%生成多项式1
X2=poly2sym(x2)		%生成多项式2
Y1=poly2sym(y1)		%生成乘积多项式
k=polyder(x1,x2) 		%求解多项式乘积的导数
K1=poly2sym(k)			%生成求导多项式，常数项为0
t=polyint(y1)			%求解多项式积分
T=poly2sym(t)			%生成积分多项式，常数项为0