Y = round(rand(5,3)*10);
subplot(2,2,1)
bar(Y,'group')  % ����������ͼ
title 'Group'  % ��ӱ���
subplot(2,2,2) 
bar(Y,'stack')  % ��������ͼ
title 'Stack'  % ��ӱ���
subplot(2,2,3)
barh(Y,'stack')  % ����ˮƽ����ͼ
title 'Stack'  % ��ӱ���
subplot(2,2,4)
bar(Y,1.5)  % ����bar�Ŀ��Ϊ1.5
title 'Width = 1.5'  % ��ӱ���
