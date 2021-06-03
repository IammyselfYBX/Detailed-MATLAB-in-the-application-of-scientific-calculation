p = rand(10,1);  % 生成10*1的随机矩阵
q = ones(10);  % 生成10阶幺矩阵
save text.mat p q  % 将变量p,q保存到text.mat文件中
load text p  % 读取text.mat文件中的变量p 
p  % 显示p的结果
