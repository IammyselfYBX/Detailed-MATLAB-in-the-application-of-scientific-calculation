fun = @(x,y)abs(x.^2 + y.^2 - 0.25);  % ���屻������
c = @(x)-sqrt(1 - x.^2);  % �ڲ��������޺���
d = @(x)sqrt(1 - x.^2);  % �ڲ��������޺���
I=quad2d(fun,-1,1,c,d,'AbsTol',1e-8,...
    'FailurePlot',true,'Singular',false)  % һ��������ػ������
