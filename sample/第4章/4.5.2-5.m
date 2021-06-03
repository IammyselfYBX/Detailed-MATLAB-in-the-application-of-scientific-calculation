[x,y]=meshgrid(-2:0.2:2,-2:0.2:2);
z=x.*exp(-x.^2-y.^2);
[px,py]=gradient(z,.2,.2)
contour(z)
hold on				%开启图形保持
quiver(px,py)
hold off			%关闭图形保持

