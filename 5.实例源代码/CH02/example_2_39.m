c=input('请输入一个字符:','s');  % 提示输入字符串
if c>='A' & c<='Z'
   disp(char(c+'a'-'A'));  % 输出c对应的小写字符
elseif c>='a'& c<='z'
    disp(char(abs(c-'a'+'A')));  % 输出c对应的大写字符
elseif c>='0'& c<='9'
    disp(abs(c-'0'));  % 输出c对应的数字
else
    disp(c);  % 输出c
end
