hx=17;hy=hx;   % 设置网格节点数
v1=ones(hy,hx);  % 设置行列二维数组
% 上下两行的Dirichlet边界条件值
v1(hy,:)=ones(1,hx)*100;
v1(1,:)=zeros(1,hx);
% 左右两列的Dirichlet 边界条件值
v1(:,1)=zeros(1,hx);
v1(:,hx)=zeros(1,hx);
v2=v1;err=1;t=0;  % 初始化
while(err>1e-6)  % 由v1迭代，算出v2，迭代精度为1e-6
    for i=2:hy-1   % 从2到hy-1行循环
        for j=2:hx-1   % 从2到hx-1列循环 
            v2(i,j)=(v1(i,j+1)+v1(i+1,j)+v2(i-1,j)+v2(i,j-1))/4;  % 拉普拉斯方程差分式
            err=max(abs(v2(i,j)-v1(i,j)));
        end
    end
    v1=v2;
end
subplot(1,2,1),mesh(v2)  % 画三维曲面图
subplot(1,2,2),contour(v2,15)  % 画等电位线图
hold on
x=1:hx;y=1:hy;
[xx,yy]=meshgrid(x,y);  % 形成栅格
[Gx,Gy]=gradient(v2,0.6,0.6);  % 计算梯度
quiver(xx,yy,-Gx,-Gy,0.8,'r')  % 根据梯度数据画箭头
plot([1,1,hx,hx,1],[1,hy,hy,1,1],'k')  % 画导体边框
xlabel('0V','fontsize',11);  % 下标注
text(hx/2-0.5,hy+0.5,'100V','fontsize',11);  % 上标注
text(-2,hy/2,'0V','fontsize',11);  % 左标注
text(hx+0.3,hy/2,'0V','fontsize',11);  % 右标注
hold off
