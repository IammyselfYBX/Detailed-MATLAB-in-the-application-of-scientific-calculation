fun = '(x1-1)^2+(x2-2)^2+(x3-3)^2+(x4-4)^2';
[H,f]=quad_coef(fun);  % 计算二次型的系数
A=[1,1,1,1;3,3,2,1];b=[5;10];
Aeq=[];beq=[];
lb=zeros(4,1);
options=optimset('LargeScale','off');  % 设置优化参数不适用大型算法
[x,fval]=quadprog(H,f,A,b,Aeq,beq,lb,[],[],options);  % 二次规划问题求解
X=sym('[x1,x2,x3,x4]');
fval=double(fval+simple(sym(fun)-1/2*X*H*X.'-f*X.'));  % 计算最终结果
disp(char('二次规划问题的最优解：',num2str(x)))  % 显示最优解
disp(['二次规划问题的最优值：',num2str(fval)])  % 显示最优值
