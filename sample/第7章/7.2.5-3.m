/* ������ͨ����������ͷ�ļ� */
#include <stdio.h>
main()
{ 
  char c; 	//�����ַ���������������������ַ�
  while ( (c=getchar() )!='\n')//�����ַ���ֱ���س�
  {
	// ���������ַ��Ǵ�д��ĸ��ִ��error�����б�����ʾ
if (c>'A' && c<'Z') 
	error(��Error: Input data error!��);    
// ���������ַ���Сд��ĸ��ִ��warning���
else if(c>��a��&&c<��z��)
	warning(��Warning: Please check the input data!��);	
  }
}
