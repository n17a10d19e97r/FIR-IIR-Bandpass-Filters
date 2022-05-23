%FIR FrequencySampling Method
n=130;
f = [0 0.10 0.15 0.40 0.45 1.0];
m = [0 0 1 1 0 0];
s = fir2(n,f,m);
[HS,w] = freqz(s);
figure(2)
plot(w/pi,abs(HS))
set(gca,'YTick',[0 0.06 0.94 1.06])
set(gca,'XTick',[0 0.10 0.125 0.150 0.40 0.425 0.45 0.5])
axis( [ 0 0.6 0 1.1])
grid on
title('Frequency response of Frequency Sampling Method, N=130');
xlabel('Normalized Frequency (x *pi rad/sample)')
ylabel('magnitude')
figure()
plot(w,unwrap(angle(HS))*180/pi)
grid on
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Phase (degrees)')