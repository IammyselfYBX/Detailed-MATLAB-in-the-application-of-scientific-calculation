format short e  % 设定数据显示格式
n=5:5:20;
for k=1:length(n)
    cond_A(k)=cond(hilb(n(k)));  % 将求取的条件数依次存放于向量cond_A中
    rcond_A(k)=rcond(hilb(n(k)));  % 将求取的指标条件数依次存放于向量rcond_A中
end
cond_A,rcond_A
format short
