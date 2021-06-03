%function为关键字，isleapyear为函数名，year为函数自带的输入参数
function isleapyear(year)			
sign=0;							% 设置标志位，判断是否为闰年
if rem(year,4)==0					% 如果能被４整除，则为闰年
    sign=sign+1;
end
if rem(year,100)==0				% 如果能被100整除，则为闰年
    sign=sign+1;
end
if sign==1			% 如果标志位为１，则输出为闰年
    fprintf('%4d year is a leap year.\n',year)
else 				% 如果标志位为０，则输出为非闰年
    fprintf('%4d year is not a leap year.\n',year)
end
