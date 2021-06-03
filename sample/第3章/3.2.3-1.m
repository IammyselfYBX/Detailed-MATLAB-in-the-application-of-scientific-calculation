a=randn(1,10)	%随机生成一个数组
a(4)			%访问数组中第4个元素
a(2:6)			%从数组的第2个元素开始访问，一直访问到数组的第6个元素
a(6:-2:1)		%从数组的第6个元素开始逆向隔2访问，直到第1个元素
a([1 3 5 7])	%访问数组的第1，3，5，7个元素
a([4:end])		%从数组的第4个元素开始一直访问到最后一个元素