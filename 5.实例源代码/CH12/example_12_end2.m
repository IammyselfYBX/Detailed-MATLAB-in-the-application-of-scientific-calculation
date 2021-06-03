rand('state',2009)
x1=rand(365,1);
x2=rand(365,1);
for n=4:10
    paper=n*10;
    sb(n)=0;
    for i=1:365
        if x1(i)<0.35
            news=(x2(i)<0.03)*40+(x2(i)>=0.03&x2(i)<0.08)*50+...
                (x2(i)>=0.08&x2(i)<0.23)*60+(x2(i)>=0.23&x2(i)<0.43)*70+...
                (x2(i)>=0.43&x2(i)<0.78)*80+(x2(i)>=0.78&x2(i)<0.93)*90+...
                (x2(i)>=0.93)*100;
        elseif x1(i)<0.8
            news=(x2(i)<0.1)*40+(x2(i)>=0.1&x2(i)<0.28)*50+...
                (x2(i)>=0.28&x2(i)<0.68)*60+(x2(i)>=0.68&x2(i)<0.88)*70+...
                (x2(i)>=0.88&x2(i)<0.96)*80+(x2(i)>=0.96)*90;
        else
            news=(x2(i)<0.44)*40+(x2(i)>=0.44&x2(i)<0.66)*50+...
                (x2(i)>=0.66&x2(i)<0.82)*60+(x2(i)>=0.82&x2(i)<0.94)*70+...
                (x2(i)>=0.94)*80;
        end
        sale=min(paper,news);
        remand=(paper-news).*(sale==news);
        sb(n)=sb(n)+2*sale-1.3*paper+0.2*remand;
    end
end
[optmoney,I]=max(sb);
disp(['最优订购量','  ','年赚钱总数','   ','日平均利润'])
disp(num2str([I*10,optmoney,optmoney/365]))
