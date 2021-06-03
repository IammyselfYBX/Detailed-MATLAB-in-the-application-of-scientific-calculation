function [x,e]=Linear_equation(A,b)
% 线性方程组的求解
% 输入参数：
%       ---A：方程组的系数矩阵
%       ---b：方程组的右端向量
% 输出参数：
%       ---x：方程组的解
%       ---e：解的误差
[m,n]=size(A);
r1=rank(A);
r2=rank([A b]);
if r1==r2
    if r1==n
        disp('方程组是恰定的，有唯一解！')
        x=A\b;
        e=norm(A*x-b);
    else
        disp('方程组是欠定的，有无穷解！')
        z=null(sym(A));   %解出规范化的化零空间
        x0=sym(A)\sym(b);  %求出一个特解
        syms k1 k2;   %定义各基础解系对应的系数
        x=x0+z*[k1;k2];   %原方程的通解
        e=A*x-b;   %检验解的准确性
    end
else
    disp('方程组是超定的，只有最小二乘意义下的解！')
    x=A\b;
    e=norm(A*x-b);
end
