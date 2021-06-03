syms x y
diff(x*y+y^2+sin(x)+cos(y),y)		%对y进行求导
diff(x*y+y^2+sin(x)+cos(y),x)		%对x进行求导
diff(x*y+y^2+sin(x)+cos(y),y,3)		%对y进行3阶求导

