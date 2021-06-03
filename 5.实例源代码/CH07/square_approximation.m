function [A,B,p]=square_approximation(wfun,phifun,fun,a,b)
% 最佳平方逼近
% 输入参数：
%      ---wfun：权函数
%      ---phifun：基函数
%      ---fun：逼近函数
%      ---a,b：逼近区间的端点
%      ---n：最佳逼近的次数，默认值为1
% 输出参数：
%      ---A：法方程组的系数矩阵
%      ---b：法方程组的右端向量
%      ---p：最佳平方逼近的系数
n=size(phifun,1);
A=zeros(n);
for i=1:n
    for j=1:n
        f1=inline(['(',wfun,')','.*','(',phifun(i,:),')',...
            '.*','(',phifun(j,:),')']);
        A(i,j)=quad(f1,a,b);
    end
    f2=inline(['(',wfun,')','.*','(',phifun(i,:),')','.*','(',fun,')']);
    B(i)=quad(f2,a,b);
end
B=B';a=A\B;
p=a';
