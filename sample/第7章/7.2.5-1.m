/* 包含普通的输入输入头文件 */
#include <stdio.h>
main()
{ 
  char c; 	//定义字符变量，用来接收输入的字符
  while ( (c=getchar() )!='\n')%输入字符，直到回车
  {
	//不是大写字母就不执行continue后的语句，而返回while继续
if (c>'Z' || c<'A') continue;    
printf("%c",c);
  }
}
