for n=1:4		//循环体，n从1依次循环到4
//生成一个名为magic_str的字符串变量
//参数’M’是将每一个字符变量都是M作为名字的第一个字符，如M1,M2…中的M
//参数int2str(n)是将整形的数字n转换成字符，如M1,M2…中的1，2，
//参数’=magic(n)’则是生成相应的魔术矩阵，矩阵的阶数由输入参数n来决定
	magic_str=[‘M’, int2str(n), ‘=magic(n)’];

	//调用名为magic_str的字符串变量
eval(magic_str)
end
