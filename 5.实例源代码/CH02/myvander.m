function A=myvander(v)  % 声明行
% 以下为注释说明部分
% v是符号向量
% 以下为函数体语句
n=length(v);v=v(:);
A=sym(ones(n));
for j=n-1:-1:1
    A(:,j)=v.*A(:,j+1);
end
