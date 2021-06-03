load data t water  % 读取data.mat文件
T=t/3600
h=0.01*water*0.3048
k=find(t==82649);  % 寻找t=82649s的位置
h(k)=35.50*0.3048;  % 将t=82649s时刻的值设为最高水位
T(isnan(h))=[];  % 将水泵启动的时刻置空
h(isnan(h))=[];  % 将水泵启动的时刻的水位置空
V=pi*(57*0.3048/2)^2*h;  % 水塔中水的体积
plot(T,V,'K*')  % 绘制图形
xlabel('时间/h')  % 标注x轴
ylabel('水的体积/m^3')  % 标注y轴
figure
% 利用均值近似表示导数
t1=T(1:10);  % 第一段时间向量
t2=T(11:21);  % 第二段时间向量
t3=T(22:end);  % 第三段时间向量
V1=V(1:10);  % 第一段水的体积
V2=V(11:21);  % 第二段水的体积
V3=V(22:end);  % 第三段水的体积
dV=abs([gradient(V1,t1),gradient(V2,t2),gradient(V3,t3)]);  % 用均差近似导数
ti=linspace(min(T),max(T));
fi=spline(T,dV,ti);  % fi=interp1(t,dV,ti,'spline')  % 三次样条插值
plot(T,dV,'*',ti,fi,'k')
xlabel('时间/h')
ylabel('流速/m^3/h')
legend('原始数据点','三次样条插值曲线')  % 添加图例
figure
% 利用二阶差商近似表示导数
% 对第一段进行数值微分求解水流量
for i=1:10
    if i<=2
        f(i)=abs((-3*V(i)+4*V(i+1)-V(i+2))/2/(T(i+1)-T(i)));  % 向前差分公式
    elseif i<=8
        f(i)=abs((-V(i+2)+8*V(i+1)-8*V(i-1)+V(i-2))/...
            12/(T(i+1)-T(i)));  % 中心差分公式
    else
        f(i)=abs((3*V(i)-4*V(i-1)+V(i-2))/2/(T(i)-T(i-1)));  % 向后差分公式
    end
end
% 对第二段进行数值微分求解水流量
for i=11:21
    if i<=12
        f(i)=abs((-3*V(i)+4*V(i+1)-V(i+2))/2/(T(i+1)-T(i)));  % 向前差分公式
    elseif i<=19
        f(i)=abs((-V(i+2)+8*V(i+1)-8*V(i-1)+V(i-2))/...
            12/(T(i+1)-T(i)));  % 中心差分公式
    else
        f(i)=abs((3*V(i)-4*V(i-1)+V(i-2))/2/(T(i)-T(i-1)));  % 向后差分公式
    end
end
% 对第三段进行数值微分求解水流量
for i=22:length(h)
    if i<=23
        f(i)=abs((-3*V(i)+4*V(i+1)-V(i+2))/2/(T(i+1)-T(i)));  % 向前差分公式
    elseif i<=length(h)-2
        f(i)=abs((-V(i+2)+8*V(i+1)-8*V(i-1)+V(i-2))/...
            12/(T(i+1)-T(i)));  % 中心差分公式
    else
        f(i)=abs((3*V(i)-4*V(i-1)+V(i-2))/2/(T(i)-T(i-1)));  % 向后差分公式
    end
end
disp([blanks(6),'时间',blanks(7),'速率']);
disp([T',f'])  % 输出结果
plot(T,f,'*')  % 绘制时间-流速散点图
xlabel('时间/h')
ylabel('流速/m^3/h')
figure
% 对整体数据进行三次样条插值
fi1=spline(T,f,ti);  % fi=interp1(t,f,ti,'spline')
plot(T,f,'*',ti,fi1,'k')
xlabel('时间/h')
ylabel('流速/m^3/h')
legend('原始数据点','三次样条插值曲线')
figure
% 对每一组数据分别进行三次样条插值
ti1=linspace(T(1),T(10));  % 第一段
ti2=linspace(T(11),T(21));  % 第二段
ti3=linspace(T(22),T(end));  % 第三段
fi1=spline(T(1:10),f(1:10),ti1);  % 对第一段进行三次样条插值
fi2=spline(T(11:21),f(11:21),ti2);  % 对第二段进行三次样条插值
fi3=spline(T(22:end),f(22:end),ti3);  % 对第三段进行三次样条插值
plot(T,f,'*',[ti1;ti2;ti3]',[fi1;fi2;fi3]','k')
xlabel('时间/h')
ylabel('流速/m^3/h')
legend('原始数据点','三次样条插值曲线')
tti=0:0.01:24;
vi=spline(T,f,tti);
VV1=trapz(tti,vi)  % 日总用水量
% VV1=(vi(1)+vi(length(vi))+2*sum(vi(2:length(vi)-1)))*0.01/2
%
% 分段计算日用水量
V11=V(1)-V(10);  % 第一次充水前用水量
V12=V(11)-V(21);  % 第一次充水后第二次充水前用水量
V13=V(22)-V(23);  %  期间用水量
tp1=T(10):0.05:T(11);
yp1=spline(T,f,tp1);
V14=trapz(tp1,yp1);  % 第一次充水期间用水量
tp2=T(21):0.05:T(22);
yp2=spline(T,f,tp2);
V15=trapz(tp2,yp2);  % 第二次充水期间用水量
tp3=T(23):0.05:24;
yp3=spline(T,f,tp3);
V16=trapz(tp3,yp3);  %  期间用水量
VV2=V11+V12+V13+V14+V15+V16  % 日总用水量
r=abs(VV1-VV2)/V11  % 两种方法的结果误差
%
% 日用水量的蒙特卡罗模拟
rand('state',2009)  % 设置随机数状态
H=max(f);  % 取流速的最大值
n=10000;m=0;
for i=1:n
    tt(i)=unifrnd(0,24);  % 随机产生[0,24]中的一个数
    vv(i)=rand*H;
    ff=spline(T,f,tt(i));
    if vv(i)<ff
        m=m+1;  % 对满足条件的情形累加
    end
end
VV3=24*H*m/n
r1=abs(VV1-VV3)/VV1
% 水泵水流量的计算
DV1=V(11)-V(10);  % 第一次充水期间水塔体积增量
DT1=T(11)-T(10);  % 第一次充水时间
p1=(DV1+V14)/DT1;  % 第一次充水期间水泵平均流量
DV2=V(22)-V(21);  % 第二次充水期间水塔体积增量
DT2=T(22)-T(21);  % 第二次充水时间
p2=(DV2+V15)/DT2;  % 第二次充水期间水泵平均流量
p=(p1+p2)/2  % 整个充水期间水泵平均流量
% 稳定性分析
S=[];  % 预置一个空矩阵
for t=0:0.25:2
    TT=linspace(t,t+24);  % 将区间[t,t+24]分成100等分
    FF=spline(T,f,TT);  % 三次样条插值
    S=[S,trapz(TT,FF)];  % 将求得的用水量依次填入空矩阵S
end
S
% 检验
dV1=V(1)-V(10)  % 第一段实际用水量
dV2=V(11)-V(21)  % 第二段实际用水量 
dV3=V(22)-V(end)  % 第三段实际用水量
ddV1=trapz(ti1,spline(T,f,ti1))  % 第一段模型用水量
ddV2=trapz(ti2,spline(T,f,ti2))  % 第二段模型用水量
ddV3=trapz(ti3,spline(T,f,ti3))  % 第三段模型用水量
rr1=abs(ddV1-dV1)  % 第一段实际用水量与模型用水量的绝对误差
per_rr1=rr1/dV1  % 第一段实际用水量与模型用水量的相对误差
rr2=abs(ddV2-dV2)  % 第二段实际用水量与模型用水量的绝对误差
per_rr2=rr2/dV2  % 第二段实际用水量与模型用水量的相对误差
rr3=abs(ddV3-dV3)  % 第三段实际用水量与模型用水量的绝对误差
per_rr3=rr3/dV3  % 第三段实际用水量与模型用水量的相对误差
fact_V=dV1+dV2+dV3  % 实际总用水量
count_V=ddV1+ddV2+ddV3  % 模型总用水量
rr4=abs(count_V-fact_V)  % 实际总用水量与模型总用水量的绝对误差
per_rr4=rr4/fact_V  % 实际总用水量与模型总用水量的相对误差
% 用水高峰比较
[Y,I]=max(f)  % 取流速的最大值及其位置
T_HIGHT=T(I)  % 实际用水高峰时间

