function x=three_point_parabola(x1,y1,x2,y2,x3,y3)
if x1==x2|x2==x3|x1==x3
    error('三点不构成所需的抛物线')
else
    k1=(y2-y1)/(x2-x1);
    k2=(y3-y2)/(x3-x2);
    if k1==k2
        error('三点不构成所需的抛物线')
    end
end
A=vander([x1,x2,x3]);b=[y1;y2;y3];
x=A\b;