%FIR Windowing via Hamming
n1=88;
Fs = pi;
Wn = [0.125*pi 0.425*pi]/Fs;
z = fir1(n1,Wn);
[HH,FF] = freqz(z);
%FIR FrequencySampling Method
n2=130;
f = [0 0.10 0.15 0.40 0.45 1.0];
m = [0 0 1 1 0 0];
p = fir2(n2,f,m);
[HS,w] = freqz(p);
%FIR Equiripple bia Remez Algorithm 
n3 = 70;  
f = [0 0.10 0.15 0.40 0.45 1];
m = [0 0 1 1 0 0];
k = remez(n3,f,m);
[Hr,w1] = freqz(k);
figure(7)
plot(FF/pi,abs(HH),'LineWidth', 2)
hold on 
plot(w/pi,abs(HS), '--', 'LineWidth', 2)
plot(w1/pi,abs(Hr), '-.','LineWidth', 2)
axis([0 0.60 0 1.1])
grid on
set(gca,'YTick',[0 0.02 0.94 1.06])
set(gca,'XTick',[0 0.1 0.125 0.150 0.40 0.425 0.45])
xlabel('Normalized Frequency (x *pi rad/sample)')
ylabel('magnitude')
title('Frequency response of FIR Bandpass filter using Three methods')
legend('Hamming, N=80', 'FrequencySampling, N=130', 'Remez, N=70')