% if-elseif-end������
price=input('��������Ʒ�۸�');
if price<200
    rate=0;
elseif price<500
    rate=3/100;
elseif price<1000
    rate=5/100;
elseif price<2500
    rate=8/100;
elseif price<5000
    rate=10/100;
else
    rate=14/100;
end
sale_price=price*(1-rate)  % ����ʵ�����ۼ۸�
% switch-case������
price=input('��������Ʒ�۸�');
switch fix(price)
   case num2cell(0:199)  % �۸�С��200
      rate=0;
   case num2cell(200:499)  % �۸���ڵ���200��С��500
      rate=3/100;
   case num2cell(500:999)  % �۸���ڵ���500��С��1000
      rate=5/100;
   case num2cell(1000:2499)  % �۸���ڵ���1000��С��2500
      rate=8/100;
   case num2cell(2500:4999)  % �۸���ڵ���2500��С��5000
      rate=10/100;
   otherwise  % �۸���ڵ���5000
      rate=14/100;
end
sale_price=price*(1-rate)  % �����Ʒʵ�����ۼ۸�

