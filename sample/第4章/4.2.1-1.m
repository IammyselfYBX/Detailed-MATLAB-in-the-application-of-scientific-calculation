sqrt(4)				%求解数值4的开方
a=sqrt(sym(4))		%将4转换成符号对象，并对其进行开方
double(a)			%将符号对象的开方结果转换成双精度显示
sym(3)/sym(5)		%将3和5转换成符号对象，再对其进行除法
3/5+4/5				%求解3除以5加上4除以5的和
sym(3)/sym(5)+sym(4)/sym(5)		%转换成符号对象后再进行四则运算
