syms x; f=x;n=7;
[A,B,F]=fseriessym(f,x,n);  % fourier级数符号求解
f1=vectorize(f);  % 将符号表达式转化为字符串
[L,A,B]=fseriesquadl(f1,n);  % fourier级数数值求解
F1=A(1)/2+A(2:n+1)*cos((1:n)*pi/L*x)'+B*sin((1:n)*pi/L*x)';
x=-pi:pi/50:pi;
subplot 121,plot(x,subs(f),x,subs(F)),title('符号法fourier分析')  % 绘制符号解的图形
subplot 122,plot(x,[subs(f);subs(F1)]),title('数值法fourier分析')  % 绘制数值解的图形
