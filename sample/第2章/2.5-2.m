[x,y]=meshgrid([-4:0.5:4]);
z=sqrt(x.^2+y.^2);
surfc(x,y,z)
