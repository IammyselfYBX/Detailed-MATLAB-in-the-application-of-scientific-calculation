x=0:0.1:20;
y=1-1/sqrt(1-0.3^2)*exp(-0.3*x).*sin(sqrt(1-0.3^2)*x+acos(0.3));
plot(x,y)
hold on
h=plot(0,0,'ko','MarkerFaceColor','b','MarkerSize',15,'Erasemode','xor');  % �����ʵ�
for i=1:length(x)
    set(h,'Xdata',x(i),'Ydata',y(i));  % �����ʵ����λ��
    pause(0.1)  % ��ͣ0.1s
    drawnow  % ˢ����Ļ
end
