syms t w 
ft=Heaviside(t)		%������λ��Ծ����
Fw=fourier(ft)			%��ⵥλ��Ծ�����ĸ���Ҷ�任
ft=ifourier(Fw)		%��ⵥλ��Ծ�����ĸ���Ҷ���任
