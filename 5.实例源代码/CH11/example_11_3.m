x=-3:0.1:3;
[xx,yy]=meshgrid(x);
zz =@(x,y)3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ... 
   - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ... 
   - 1/3*exp(-(x+1).^2 - y.^2);  % ���庯�����ʽ
subplot 121  % ͼ�ηָ�
z1=zz(xx,yy);z1(z1<0)=0;  % ��zz��С��0�Ĳ�������
mesh(xx,yy,z1)  % ������������ͼ
text(0,0,7,'\fontname{times}{\itz}={\itf}({\itx,y})',...
    'fontsize',20,'color','r')  % ��ӱ�ע
title('\fontname{times}{\it\bfpeaks}\fontname{����}������ϰ벿��',...
    'fontsize',16,'color','b')  % ��ӱ���
axis([-3 3 -3 3 0 10])  % ����������ķ�Χ
subplot 122  % ͼ�ηָ�
z2=-zz(xx,yy);z2(z2<0)=0;  % ��zz�Ĵ���0�Ĳ�������
mesh(xx,yy,z2)  % ������������ͼ
text(-2,0,7,'\fontname{times}{\itz}=-{\itf}({\itx,y})',...
    'fontsize',20,'color','r')  % ��ӱ�ע
title('\fontname{times}{\it\bfpeaks}\fontname{����}������°벿��',...
    'fontsize',16,'color','b')  % ��ӱ���
axis([-3 3 -3 3 0 7])  % ����������ķ�Χ
colormap([0,0,0])  % ������ɫ��ʽΪ��ɫ
set(gcf,'Color','w')  % ����ͼ�ν���Ϊ��ɫ
figure('Color','w')
contour(xx,yy,zz(xx,yy),[-8:10]); % ���Ƶȸ���
hold on
z =@(x)-abs(3*(1-x(1)).^2.*exp(-(x(1).^2) - (x(2)+1).^2) ... 
    - 10*(x(1)/5 - x(1).^3 - x(2).^5).*exp(-x(1).^2-x(2).^2) ... 
    - 1/3*exp(-(x(1)+1).^2 - x(2).^2));  % ����Ŀ�꺯��
[xt,yt]=ginput(6);  % �����ȡ6���������
for k=1:length(xt)
    [x,fval]=fminsearch(z,[xt(k),yt(k)]);  % ����Ż�����
    X(k)=x(1);Y(k)=x(2);F(k)=fval;
    if zz(X(k),Y(k))>zz(X(k)+1e-4,Y(k)+1e-4)
        pb(k)=1;  % ��ʶ����ֵ
    else
        pb(k)=-1;  % ��ʶ��Сֵ
    end
end
X1=X(pb==1);Y1=Y(pb==1);F1=-F(pb==1);
X2=X(pb==-1);Y2=Y(pb==-1);F2=F(pb==-1);
plot(X1,Y1,'k^','MarkerFaceColor','k'); % �������ֵ��
plot(X2,Y2,'kv','MarkerFaceColor','k'); % �����Сֵ��
text([-2.6,-2.43],[2.6,2.2],{'����\fontname{����}����ֵ��',...
    '��\fontname{����}��Сֵ��'})
text(-2.43,2.2,'��','rotation',180)
for k=1:length(X1)
    text(X1(k),Y1(k)-0.3,['\fontname{����}����ֵ','\fontname{times}��',...
        num2str(F1(k))],'HorizontalAlignment','center')  % ��ӱ�ע
end
for k=1:length(X2)
    text(X2(k),Y2(k)-0.3,['\fontname{����}����ֵ','\fontname{times}��',...
        num2str(F2(k))],'HorizontalAlignment','center')  % ��ӱ�ע
end
figure('Color','w')
meshc(xx,yy,zz(xx,yy))
hold on
plot3(X1,Y1,-10*ones(size(X1)),'k^',...
    'MarkerFaceColor','k')  % �����Сֵ��
plot3(X2,Y2,-10*ones(size(X2)),'kv',...
    'MarkerFaceColor','k');  % �����Сֵ��
xlim([-3 3]);ylim([-3 3]);
view(-45,30)
hidden off