a=ones(3,1);b=-2*ones(4,1);c=a;d=[1;0;0;0];  % ���Խ��ߡ��ζԽ��ߺ��Ҷ�����
[U,x]=Catch_up(a,b,c,d)  % ����׷�Ϸ�������ԽǷ�����
A=diag(diag(diag(a)),1)+diag(diag(diag(a)),-1)+diag(b);  % �������Է������ϵ������
[U1,x1]=Gauss(A,d)  % ����Gauss��ȥ�����м���
