%functionΪ�ؼ��֣�isleapyearΪ��������yearΪ�����Դ����������
function isleapyear(year)			
sign=0;							% ���ñ�־λ���ж��Ƿ�Ϊ����
if rem(year,4)==0					% ����ܱ�����������Ϊ����
    sign=sign+1;
end
if rem(year,100)==0				% ����ܱ�100��������Ϊ����
    sign=sign+1;
end
if sign==1			% �����־λΪ���������Ϊ����
    fprintf('%4d year is a leap year.\n',year)
else 				% �����־λΪ���������Ϊ������
    fprintf('%4d year is not a leap year.\n',year)
end
