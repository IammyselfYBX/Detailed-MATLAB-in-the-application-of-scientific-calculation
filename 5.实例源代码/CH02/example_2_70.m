t = linspace(0,2.5*pi,40);
fact = 10*sin(t);
fig=figure;
aviobj = avifile('example.avi')  % ����.avi�ļ�
[x,y,z] = peaks;
for k=1:length(fact)
    h = surf(x,y,fact(k)*z);
    axis([-3 3 -3 3 -80 80])
    axis off
    caxis([-90 90])
    F= getframe(fig);  % ��ȡ��ǰ������ͼ����Ϣ
    aviobj = addframe(aviobj,F);  % �ѵ�ǰͼ����ӵ�.avi�ļ���
end
close(fig)  % �رվ��fig
aviobj = close(aviobj);  % �رվ��aviobj
