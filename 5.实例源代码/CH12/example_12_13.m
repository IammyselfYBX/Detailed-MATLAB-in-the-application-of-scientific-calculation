x=[7.0 10.5 13.0 17.5 34 40.5 44.5 48 56 61 68.5 76.5 80.5...
    91 96 101 104 106 111.5 118 123.5 136.5 142 146 150 157 158];
y1=[44 45 47 50 50 38 30 30 34 36 34 41 45....
    46 43 37 33 28 32 65 55 54 52 50 66 66 68];
y2=[44 59 70 72 93 100 110 110 110 117 118 116....
    118 118 121 124 121 121 121 122 116 83 81 82 86 85 68]; 
L=max(x)-min(x);
H=max(y2)-min(y1);
n=1000;
rand('state',6)
u=unifrnd(min(x),max(x),1,n);  % 产生均匀随机数
v=unifrnd(min(y1),max(y2),1,n);  % 产生均匀随机数
f1=interp1(x,y1,u,'spline');  % 三次样条插值
f2=interp1(x,y2,u,'spline');  % 三次样条插值
k=find(v>=f1&v<=f2);
plot(u(k),v(k),'.')
hold on
m=sum(v>=f1&v<=f2);
[u,I1]=sort(u);f1=f1(I1);f2=f2(I1);
plot(u,[f1;f2],'k')
annotation('textbox','Position',[0.68 0.12 0.22 0.09],...
        'String',{'图例：9:20000000','单位：mm'});  % 添加文本框
area=L*H*m/n/18^2*1600;  % 计算实际面积
errorrate=abs(41288-area)/41288;  % 计算误差
text(10,135,['落入希望区域的点数m=',num2str(m)])
text(10,125,['国土面积S=',num2str(area)])
text(10,115,['误差R=',num2str(errorrate*100),'%'])
