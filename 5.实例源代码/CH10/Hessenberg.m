function HB=Hessenberg(A)
% 利用Householder变换化矩阵A为拟上三角阵
% 输入参数：
%       ---A：输入的n阶实方阵
% 输出参数：
%       ---HB：输出的拟上三角阵
[m,n]=size(A);
if m~=n
    error('输入的矩阵A不是方阵！')
end
HB=A;
for k=1:n-2
    x=HB(k+1:n,k);
    H=househ(x);
    HB(k+1:n,1:n)=H*HB(k+1:n,1:n);
    HB(1:n,k+1:n)=HB(1:n,k+1:n)*H;
end
