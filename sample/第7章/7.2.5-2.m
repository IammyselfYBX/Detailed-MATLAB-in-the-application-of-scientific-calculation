/* 包含普通的输入输入头文件 */
#include <stdio.h>
main()
{ 
  char c; 	//定义字符变量，用来接收输入的字符
  while ( (c=getchar() )!='\n')//输入字符，直到回车
  {
	//不是大写字母就不执行continue后的语句，并且终止整个循环
if (c>'Z' || c<'A') break;    
printf("%c",c);
  }
}
