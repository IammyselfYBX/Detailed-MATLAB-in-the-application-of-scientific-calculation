A=[1 2;3 4;2 4;5 5];
B=zeros(4,2);
C=[A,B]
C(3,:)=[];C
D=[B,A]
D(3,:)=[];D
