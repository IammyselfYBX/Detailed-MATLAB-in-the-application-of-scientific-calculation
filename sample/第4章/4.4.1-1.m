syms x y z t u
f=1/(1+x^2)			%�����������
g=sin(y)
h=x^t
p=exp(-y/u)
compose(f,g)			%��gΪ�Ա�������f����
compose(f,g,t)			%��tΪ�Ա���
compose(h,g,x,z)		%xΪh���Ա���
compose(h,g,t,z)		%tΪh���Ա���
compose(h,p,x,y,z)	%xΪh���Ա�����yΪp���Ա���
compose(h,p,t,u,z)	%tΪh���Ա�����uΪp���Ա���