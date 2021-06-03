for n=1:100
        A=rand(n,n);		% 生成100个随机数，隶属于数组A
        b=rand(n,1);		% 生成100个随机数，隶属于数组b
         tic				% 计时开始
        x=A\b;				% 系统开始运算求解
        t(n)=toc;			计时结束
end
plot(t)					% 绘制系统运算时间开销的曲线图
t=toc
