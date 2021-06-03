figure('Color','w')  % ����ͼ�ν���Ϊ��ɫ
x=-2:0.2:2;y=-1:0.2:3;
[xx,yy]=meshgrid(x,y);
zz=100*(yy-xx.^2).^2+(1-xx).^2;
surf(xx,yy,zz)
view(10,55)  % �����ӽ�
colormap(hsv)  % ���ÿ�����ɫ��ʽ
hold on  % ����ͼ��
[c,h]=contour3(x,y,zz+50,[100 500],'k');  % ������ά�ȸ���ͼ
grid on  % ���������
text(-1.5,2,2500,'$$f(x,y) = 100{(y - {x^2})^2} + {(1 - x)^2}$$',...
    'interpreter','latex','fontsize',12)  % ��ӱ�ע
plot3(-1.9,2,267.62,'ko','markersize',12,'linewidth',1,'erasemode','none')
text(-1.9,2.3,267.62,'\fontname{����}\fontsize{16}��ʼ','color',[0,0,0])
plot3(1,1,0,'ko','markersize',12,'linewidth',1,'erasemode','none')
text(1,1.3,100,'\fontname{����}\fontsize{16}����','color',[0,0,0])
set(gcf,'Color','w')
x0=[-1.9,2];
f='100*(x(2)-x(1)^2)^2+(1-x(1))^2';  % �����ַ������庯�����ʽ
OPTIONS=optimset('OutputFcn',@bandemoutfcn);  % �����Ż����Ʋ���'OutputFcn'
[x,fval,exitflag,output]=fminsearch(f,x0,OPTIONS)

