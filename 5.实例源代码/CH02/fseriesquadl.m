function [L,A,B] = fseriesquadl(f,n,a,b);
% fourier级数数值求解
% 输入参数与输出参数基本同fseriessym()函数
if nargin==2
    a=-pi;b=pi; 
end
L=(b-a)/2;
A(1) = quadl(inline(f),-L,L)/L; % 计算A_0
for k=1:n;
    fcos = inline(['(',f,')','.*cos(',num2str(k*pi/L),'*x)']); 
    fsin = inline(['(',f,')','.*sin(',num2str(k*pi/L),'*x)']); 
    A(k+1) = quadl(fcos,-L,L)/L; % 调用积分函数quadl计算系数A(2:n+1)
    B(k) = quadl(fsin,-L,L)/L; % 调用积分函数quadl计算系数B(1:n)
end
