rand('state',2009)  % �趨�����״̬
x1=rand(365,1);  % ����[0,1]�����ϵ�365�����ȷֲ��������
x2=rand(365,1);  % ����[0,1]�����ϵ�365�����ȷֲ��������
for n=4:10
    paper=n*10;  % ��ֽ���Ǵ�40~100��ʮ�ģ�����n*10����
    sb(n)=0;  % ������
    for i=1:365
        if x1(i)<0.35
            if x2(i)<0.03
                news=40;
            elseif x2(i)<0.08
                news=50;
            elseif x2(i)<0.23
                news=60;
            elseif x2(i)<0.43
                news=70;
            elseif x2(i)<0.78
                news=80;
            elseif x2(i)<0.93
                news=90;
            else
                news=100;
            end
        elseif x1(i)<0.8
            if x2(i)<0.10
                news=40;
            elseif x2(i)<0.28
                news=50;
            elseif x2(i)<0.68
                news=60;
            elseif x2(i)<0.88
                news=70;
            elseif x2(i)<0.96
                news=80;
            else
                news=90;
            end
        else
            if x2(i)<0.44
                news=40;
            elseif x2(i)<0.66
                news=50;
            elseif x2(i)<0.82
                news=60;
            elseif x2(i)<0.94
                news=70;
            else
                news=80;
            end
        end
        if paper>=news
            sale=news;
            remand=paper-news;
        else
            sale=paper;
            remand=0;
        end
        sb(n)=sb(n)+2*sale-1.3*paper+0.2*remand;
    end
end
optnews=40;
optmoney=sb(4);
[40,sb(4)/365];
for n=5:10
    if sb(n)>=optmoney
        optnews=n*10;
        optmoney=sb(n);
    end
    [n,sb(n)/365];
end
disp(['���Ŷ�����','  ','��׬Ǯ����','   ','��ƽ������'])
disp(num2str([optnews,optmoney,optmoney/365]))
