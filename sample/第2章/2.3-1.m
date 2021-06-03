% 首先通过M文件的方式建立一个待管理的文件，取名为test.m。在test.m文件中输入字符：this is used for the test
% of location in matlab.pls pay more attation on the details.
FID=fopen('test.m','r')  %以只读的方式打开名为‘sw.m’的文件
fseek(FID,10,-1)		  %以文件头为参照位置，向文件尾方向移动，
ftell(FID)	
fseek(FID,-10,1)	  %以文件尾为参照位置，向文件头方向移动，
ftell(FID)            %以文件头为参照，定位当前指针