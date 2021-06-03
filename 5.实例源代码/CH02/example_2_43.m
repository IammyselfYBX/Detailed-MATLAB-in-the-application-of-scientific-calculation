flag=0;sum=2;
for n=3:100
    for m=2:sqrt(n)
        if mod(n,m)==0  % ÅĞ¶ÏnÄÜ·ñ±»mÕû³ı
            flag=1;
            break
        else
            flag=0;
        end
    end
    if flag==1
        continue
    end
    sum=sum+n;
end
sum
