function [H,f]=quad_coef(fun)
% 二次式系数求解
% 输入参数：
%       ---fun：二次式的字符串形式表示
% 输出参数：
%       ---H：二次项系数矩阵
%       ---f：一次项系数向量
fun=sym(fun);  % 将字符串表达式转换为符号型
V=findsym(fun);  % 寻找fun的符号变量
S=findstr(V,',');  % 寻找V中的“,”的位置
N=length(S);
S=[0,S,length(V)+1];
% 二次项系数矩阵
for i=1:N+1
    for j=1:N+1
        d1f=sym(diff(fun,V(S(i)+1:S(i+1)-1)));
        d2f=diff(d1f,V(S(j)+1:S(j+1)-1));
        H(i,j)=double(d2f);  % 将符号型转换为浮点型
    end
end
X=sym(['[',V,']']);
F=fun-1/2*X*H*X.';  % 求符号表达式的一次项部分
% 一次项系数向量
for i=1:N+1
    df=diff(F,V(S(i)+1:S(i+1)-1));
    f(i)=double(df);
end
