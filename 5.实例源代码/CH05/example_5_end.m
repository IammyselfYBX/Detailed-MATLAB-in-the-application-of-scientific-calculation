hx=17;hy=hx;   % ��������ڵ���
v1=ones(hy,hx);  % �������ж�ά����
% �������е�Dirichlet�߽�����ֵ
v1(hy,:)=ones(1,hx)*100;
v1(1,:)=zeros(1,hx);
% �������е�Dirichlet �߽�����ֵ
v1(:,1)=zeros(1,hx);
v1(:,hx)=zeros(1,hx);
v2=v1;err=1;t=0;  % ��ʼ��
while(err>1e-6)  % ��v1���������v2����������Ϊ1e-6
    for i=2:hy-1   % ��2��hy-1��ѭ��
        for j=2:hx-1   % ��2��hx-1��ѭ�� 
            v2(i,j)=(v1(i,j+1)+v1(i+1,j)+v2(i-1,j)+v2(i,j-1))/4;  % ������˹���̲��ʽ
            err=max(abs(v2(i,j)-v1(i,j)));
        end
    end
    v1=v2;
end
subplot(1,2,1),mesh(v2)  % ����ά����ͼ
subplot(1,2,2),contour(v2,15)  % ���ȵ�λ��ͼ
hold on
x=1:hx;y=1:hy;
[xx,yy]=meshgrid(x,y);  % �γ�դ��
[Gx,Gy]=gradient(v2,0.6,0.6);  % �����ݶ�
quiver(xx,yy,-Gx,-Gy,0.8,'r')  % �����ݶ����ݻ���ͷ
plot([1,1,hx,hx,1],[1,hy,hy,1,1],'k')  % ������߿�
xlabel('0V','fontsize',11);  % �±�ע
text(hx/2-0.5,hy+0.5,'100V','fontsize',11);  % �ϱ�ע
text(-2,hy/2,'0V','fontsize',11);  % ���ע
text(hx+0.3,hy/2,'0V','fontsize',11);  % �ұ�ע
hold off
