function sol=randlp(f,f1,a,b,n)
% monte_carlo法求解非线性规划
% 输入参数：
%      ---f：目标函数
%      ---f1：不等式约束函数
%      ---a,b：试验点下界和上界
%      ---n：试验点的个数
% 输出参数：
%      ---sol：非线性规划的解
rand('state',2009)  % 设定随机数状态
r1 = unifrnd(a,b,n,1);  % 产生[a,b]上的n*1个均匀分布的连续随机数
r2 = unifrnd(a,b,n,1);  % 产生[a,b]上的n*1个均匀分布的连续随机数
sol=[r1(1) r2(1)];
z0 = inf;
for i=1:n
    x1=r1(i);
    x2=r2(i);
    lpc=f1([x1 x2]);
    if lpc==1
        z=f([x1 x2]);
        if z<z0
            z0=z;
            sol=[x1 x2];
        end
    end
end
