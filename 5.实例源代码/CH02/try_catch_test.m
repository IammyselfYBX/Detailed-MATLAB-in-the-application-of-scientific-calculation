rand('state',0)
P=randperm(36);
A = reshape(P,4,9);
try
    % 求A的行列式
    DA=det(A)
catch
    % 如果发现错误，执行如下语句
    A = reshape(P,6,6);  % 将P转化为6*6型矩阵A
    DA=det(A)  % 求A的行列式
    % 显示错误类型
    disp('错误类型：A不是一个方阵，不能求行列式')
end
