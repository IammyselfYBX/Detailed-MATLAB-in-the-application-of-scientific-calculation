function T=Potential_distribution (N,t_u,t_d,t_l,t_r)
% 求解正方形槽的电位分布
% 输入参数：
%       ---N：正方形槽内部节点数的开方，即N2=正方形内部的节点数
%       --- t_u,t_d,t_l,t_r：正方形槽的上、下、左、右的电位
% 输出参数：
%       ---T：电位分布
if nargin==1
    t_u=100;t_d=0;t_l=0;t_r=0;
end
A=diag(4*ones(1,N*N));  %矩阵A的对角线元素为4
b=zeros(N*N,1);
for i=1:N*N
    if i<=N
        b(i)=t_u;  %向量b中与上边界节点对应的分量赋值
    end
    if mod(i,N)==0
        b(i)=b(i)+t_r;  %向量b中与右边界节点对应的分量赋值
    end
    if mod(i,N)==1
        b(i)=b(i)+t_l;  %向量b中与左边界节点对应的分量赋值
    end
    if i>N*(N-1)
        b(i)=b(i)+t_d;  %向量b中与下边界节点对应的分量赋值
    end
    if i>N
        A(i,i-N)=-1;  %矩阵A中与上边界无关的节点所对应的元素赋值
    end
    if mod(i,N)~=1
        A(i,i-1)=-1;  %矩阵A中与左边界无关的节点所对应的元素赋值
    end
    if mod(i,N)~=0
        A(i,i+1)=-1;  %矩阵A中与右边界无关的节点所对应的元素赋值
    end
    if i<=N*(N-1)
        A(i,i+N)=-1;  %矩阵A中与下边界无关的节点所对应的元素赋值
    end
end
U=rref([A,b]);
B1=U(:,end);  % 等价于B1=A\b;
B=reshape(B1,N,N)';
T(2:N+1,2:N+1)=B;
T(1,2:N+1)=t_u;
T(N+2,2:N+1)=t_d;
T(2:N+1,1)=t_l;
T(2:N+1,N+2)=t_r;
T([1,N+2],[1,N+2])=NaN;
mesh(T)
