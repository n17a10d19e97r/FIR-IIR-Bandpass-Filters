%IIR Butterworth
Rp = 0.5374;
Rs = 33.979;
Fs = pi;
Wp = [0.15*pi 0.40*pi]/(Fs/2);
Ws = [0.10*pi 0.45*pi]/(Fs/2);
[i,Wp] = buttord(Wp,Ws,Rp,Rs);
n1=i
[A,B,C,D] = butter(n1,[0.125*pi 0.425*pi]/(pi/2));
b = designfilt('bandpassiir','FilterOrder',n1*2, ...
    'HalfPowerFrequency1',0.125*pi,'HalfPowerFrequency2',0.425*pi, ...
    'SampleRate',Fs);
[HB,FB] = freqz(b);
figure(4)
plot(FB/(2*pi),abs(HB))
axis([0 0.50 0 1.1])
grid on
set(gca,'YTick',[0 0.02 0.94 1.06])
set(gca,'XTick',[0 0.1 0.125 0.150 0.40 0.425 0.45])
title('Frequency response of Butterworth method, N=9');
xlabel('Normalized Frequency (X 2*pi rad/sample)')
ylabel('magnitude')
figure()
plot(FB,angle(HB)*180/pi)
grid on
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Phase (degrees)')