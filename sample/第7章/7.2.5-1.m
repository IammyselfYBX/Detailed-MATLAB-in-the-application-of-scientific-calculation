/* ������ͨ����������ͷ�ļ� */
#include <stdio.h>
main()
{ 
  char c; 	//�����ַ���������������������ַ�
  while ( (c=getchar() )!='\n')%�����ַ���ֱ���س�
  {
	//���Ǵ�д��ĸ�Ͳ�ִ��continue�����䣬������while����
if (c>'Z' || c<'A') continue;    
printf("%c",c);
  }
}
