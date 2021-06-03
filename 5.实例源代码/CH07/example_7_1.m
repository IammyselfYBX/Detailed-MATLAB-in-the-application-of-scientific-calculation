wfun='x.^0';  % 权函数
phifun=char('1','x','x.^2','x.^3');  % 基函数
fun='exp(x)';  % 被逼近函数
a=-1;b=1;  % 区间端点
[A,B,p]=square_approximation(wfun,phifun,fun,a,b)  % 求解三次最佳平方逼近多项式系数
p2=poly2str(fliplr(p),'x')  % 根据多项式系数构造多项式
