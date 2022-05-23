%FIR Windowing via Hamming
n=88;
Fs = pi;
Wn = [0.125*pi 0.425*pi]/Fs;
s = fir1(n,Wn);
[HH,FF] = freqz(s);
figure(1)
plot(FF/pi,abs(HH))
set(gca,'YTick',[0 0.06 0.94 1.06])
set(gca,'XTick',[0 0.10 0.125 0.150 0.40 0.425 0.45 0.5])
axis( [ 0 0.6 0 1.1])
grid on
title('Frequency response of Windowing method with Hamming window, N=88');
xlabel('Normalized Frequency (x *pi rad/sample)')
ylabel('magnitude')
figure()
plot(FF,unwrap(angle(HH))*180/pi)
grid on
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Phase (degrees)')