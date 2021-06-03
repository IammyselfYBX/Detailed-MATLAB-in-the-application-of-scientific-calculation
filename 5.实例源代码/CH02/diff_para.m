function result=diff_para(y,x,t,n)
% 参数方程求导
% 输入参数：
%       ---y,x：参数方程
%       ---t：参数方程自变量
%       ---n：求导阶数
% 输出参数：
%       ---result：求得的导函数
if n==1
    result=diff(y,t)/diff(x,t);
else
    result=diff(diff_para(y,x,t,n-1),t)/diff(x,t);
end
