figure('Position',[100,100,700,500],'Color','w')
%---------------fminsearch�������------------------%
x0=[-1.9,2];
f='100*(x(2)-x(1)^2)^2+(1-x(1))^2';
[x1,fval1,exitflag,output1]=fminsearch(f,x0);
%--------------------��ţ�ٷ�--------------------%
% ��������bfgs     ������������϶������β�ֵ
grad='[100*(4*x(1)^3-4*x(1)*x(2))+2*x(1)-2;100*(2*x(2)-2*x(1)^2)]';
OPTIONS=optimset('LargeScale','off');
OPTIONS1=optimset(OPTIONS,'HessUpdate','bfgs','gradobj','on');
[x2,fval2,exitflag,output2]=fminunc({f,grad},x0,OPTIONS1);
% ��������bfgs     �������������β�ֵ
OPTIONS2=optimset(OPTIONS,'HessUpdate','bfgs','gradobj','on','LineSearchType','cubicpoly');
[x3,fval3,exitflag,output3]=fminunc({f,grad},x0,OPTIONS2);
% ��������dfp     ������������϶������β�ֵ
OPTIONS3=optimset(OPTIONS,'HessUpdate','dfp','gradobj','on','MaxFunEvals',1000);
[x4,fval4,exitflag,output4]=fminunc({f,grad},x0,OPTIONS3);
% ��������dfp     �������������β�ֵ
OPTIONS4=optimset(OPTIONS,'HessUpdate','bfgs','gradobj','on','LineSearchType','cubicpoly');
[x5,fval5,exitflag,output5]=fminunc({f,grad},x0,OPTIONS4);
% �������������½���     ������������϶������β�ֵ
OPTIONS5=optimset(OPTIONS,'HessUpdate','steepdesc','gradobj','on','MaxFunEvals',1000);
[x6,fval6,exitflag,output6]=fminunc({f,grad},x0,OPTIONS5);
% ���²��ֻ���ͳ�Ʊ��
type={'��������','��������','���Ž�','����ֵ','��������'};
HU={'�����η�','BFGS','BFGS','DFP','DFP','�����½���'};
LST={'',char('��϶�','���β�ֵ'),'���β�ֵ',char('��϶�','���β�ֵ'),...
    '���β�ֵ',char('��϶�','���β�ֵ')};
x=[x1;x2;x3;x4;x5;x6];
fval=[fval1;fval2;fval3;fval4;fval5;fval6];
iter=[output1.iterations;output2.iterations;output3.iterations;...
    output4.iterations;output5.iterations;output6.iterations];
axes('Position',[0.1,0.2,0.77,0.6])
hold on
for k=1:6
    plot([0,1],[1,1]*[1-(k)/7],'k');
        text(0.1,13/14-k/7,['\bf',char(HU(k))],'HorizontalAlignment','center')
    h(k,1)=text(0.3,13/14-k/7,char(LST(k)),'HorizontalAlignment','center');
    h(k,2)=text(0.5,13/14-k/7,['(',num2str(x(k,1)),',',num2str(x(k,2)),')'],...
        'HorizontalAlignment','center');
    h(k,3)=text(0.7,13/14-k/7,num2str(fval(k)),'HorizontalAlignment','center');
    h(k,4)=text(0.9,13/14-k/7,num2str(iter(k)),'HorizontalAlignment','center');
end
set(h,'fontname','times','fontsize',10)
for k=1:4
    plot([1,1]*k/5,[0,1],'k')
end
plot([0,1],[1,1],'k','linewidth',3)
plot([0,1],[0,0],'k','linewidth',2)
for k=1:5
    text(k/5-0.1,13/14,['\bf',char(type(k))],'HorizontalAlignment','center')
end
axis off
title('\fontname{����}\fontsize{16}��ͬ�㷨�ļ�����')
