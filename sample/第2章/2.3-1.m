% ����ͨ��M�ļ��ķ�ʽ����һ����������ļ���ȡ��Ϊtest.m����test.m�ļ��������ַ���this is used for the test
% of location in matlab.pls pay more attation on the details.
FID=fopen('test.m','r')  %��ֻ���ķ�ʽ����Ϊ��sw.m�����ļ�
fseek(FID,10,-1)		  %���ļ�ͷΪ����λ�ã����ļ�β�����ƶ���
ftell(FID)	
fseek(FID,-10,1)	  %���ļ�βΪ����λ�ã����ļ�ͷ�����ƶ���
ftell(FID)            %���ļ�ͷΪ���գ���λ��ǰָ��