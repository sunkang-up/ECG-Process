%�α�P395
%1����ģ���˲���ָ�꣨Omegap��Omegas��Rp��As�����������˹�˲���ָ�꣨���� N �� 3dB ��ֹƵ��Omegac��
%buttord�����ڼ����ͨ����ͨ����ͨ�����������˹�˲���ָ��
%Rp��As�ֱ�Ϊͨ�����˥���������С˥����dB����'s'��ʾģ���˲���
%����ָ�꣬��÷���ָ��ġ��˲���Ӧ�еĽ����ͽ�ֹƵ��
clc;
Fs=10000;           %FsΪ����Ƶ�ʣ����ĺ��ĵ�ͼ�õ������Ż�
Wp=0.3*pi;Ws=0.6*pi;
Rp=1.4;
As=1.6;
Omegap=300*pi;
Omegas=400*pi;
[N,Omegac]=buttord(Omegap,Omegas,Rp,As,'s');
%2����������ϵͳϵ��a,b0
%��һ����ģ�������˹�Ľ�ֹƵ��Omegac=1����ģ���˲�������㡢���㡢����
%����ʽ��z0,p0,k0�ֱ�Ϊ��㡢���㡢����
%ȥ��һ������������˲�����Omegac��,�õ�����ʽ
%����ʽת��Ϊһ��ʽ���ɸ���ϵ������Ϊ��һ��ʽΪ���壬���㲢��ʽ
[z0,p0,k0]=buttap(N);
[Bap,Aap]=zp2tf(z0,p0,k0); 
[b,a]=lp2lp(Bap,Aap,Omegac);
[bz,az]=bilinear(b,a,Fs); 
[H,W]=freqs(bz,az);
figure;
plot(W/pi,20*log10(abs(H))); 
title('������˹�˲���')
xlabel('Ƶ��');
ylabel('����(dB)');

f1=10;%��һ����Ƶ�źŷ���Ƶ��
f2=30;%�ڶ�����Ƶ�źŷ���Ƶ��
f3=45;%��������Ƶ�źŷ���Ƶ��
fs=100;%������
T=2;%�������
n=round(T*fs);%���������
t=linspace(0,T,n);
y=x;
figure;
subplot(2,1,1);
plot(y);
title('�����ź�ʱ��ͼ��');
xlabel('t/s');
ylabel('V');
fft_y=fftshift(fft(y));
f=linspace(-fs/2,fs/2,n);
subplot(2,1,2);
plot(abs(fft_y));
title('�����ź�Ƶ��ͼ��');
xlabel('f/Hz');
ylabel('V');
%axis([ 0 50 0 100]);

figure;
final=filter(bz, az, y); 
subplot(2,1,1);
plot(final);  
title( '�˲����źŲ���ʱ����' );
xlabel('t/s');
ylabel('V');

finall=fftshift(fft(final));
subplot(2,1,2);
plot(abs(finall));
title( '�˲����ź�Ƶ����' );
%axis([ 0 50 0 100]);