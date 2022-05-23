%FIR Equiripple bia Remez Algorithm 
n =70;  
f = [0 0.10 0.15 0.40 0.45 1];
m = [0 0 1 1 0 0];
e = remez(n,f,m);
[Hr,w] = freqz(e);
figure(3)
plot(w/pi,abs(Hr))
axis([0 0.60 0 1.1])
grid on
set(gca,'YTick',[0 0.02 0.94 1.06])
set(gca,'XTick',[0 0.1 0.125 0.150 0.40 0.425 0.45])
title('Frequency response of Equiripple Method via Remez algorithm, N=70');
xlabel('Normalized Frequency (X 2*pi rad/sample)')
ylabel('magnitude')
figure()
plot(w,unwrap(angle(Hr))*180/pi)
grid on
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Phase (degrees)')