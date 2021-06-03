f=@(x)x(1)^2+x(2)^2+3*x(3)^2+4*x(4)^2+2*x(5)-8*x(1)-2*x(2)-3*x(3)-x(4)-2*x(5);
g=@(x)[sum(x)-400;
    x(1)+2*x(2)+2*x(3)+x(4)+6*x(5)-800;
    2*x(1)+x(2)+6*x(3)-200;
    x(3)+x(4)+5*x(5)-200];  % 定义约束条件描述函数
rand('state',2009);
p=0;
tic
for i=1:2e5
    xx=randperm(100)-1;  % 产生0~99的一个随机排列
    x1=(xx(1:5))';
    f1=f(x1);g1=g(x1);
    if sum(g1<=0)==4
        if p<=f1
            X=x1;p=f1;
        end
    end
end
disp('Optimal solution：');disp(X)
disp(['Optimal value：',num2str(p)])
disp(['time spent ',num2str(toc),' seconds'])
