/* 包含普通的输入输入头文件 */
#include <stdio.h>
main()
{ 
  char c; 	//定义字符变量，用来接收输入的字符
  while ( (c=getchar() )!='\n')//输入字符，直到回车
  {
	// 如果输入的字符是大写字母就执行error语句进行报错提示
if (c>'A' && c<'Z') 
	error(‘Error: Input data error!’);    
// 如果输入的字符是小写字母就执行warning语句
else if(c>’a’&&c<’z’)
	warning(‘Warning: Please check the input data!’);	
  }
}
