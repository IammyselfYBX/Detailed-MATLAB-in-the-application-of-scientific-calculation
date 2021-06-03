x=[1 -2 0 7 4 -9 7];  % 给定的向量
p=[1 2 inf];  % 范数的类型
% 调用norm()函数求解
for k=1:length(p)
    x_norm(k)=norm(x,p(k));  % 将求取的不同范数存储于向量x_norm中
end
% 根据定义求解
x_norm1(1)=sum(abs(x));  % 根据1-范数的定义求解
x_norm1(2)=sqrt(sum(x.^2));  % 根据2-范数的定义求解
x_norm1(3)=max(abs(x));  % 根据 -范数的定义求解
% 显示求解结果
x_norm,x_norm1
