syms a x
s=solve('x^3+a*x+1')  %利用solve函数求解方程的解，方程的解比较复杂
simple(s)			%利用simple函数对求解的结果进行化简，但效果不明显
result=subexpr(s)	%利用subexpr函数对求解的结果进行化简，效果明显
