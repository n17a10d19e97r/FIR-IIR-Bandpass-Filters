%IIR Cheby1
Rp = 0.5374;
Rs = 33.979;
Fs = pi;
Wp = [0.15*pi 0.40*pi]/(Fs/2);
Ws = [0.10*pi 0.45*pi]/(Fs/2);
[s,Wp] = cheb1ord(Wp,Ws,Rp,Rs);
n2 = s
[E,F,G,O] = cheby1(n2,Rp,[0.15*pi 0.4*pi]/(Fs/2));
c = designfilt('bandpassiir','FilterOrder',n2*2, ...
    'PassbandFrequency1',0.15*pi,'PassbandFrequency2',0.4*pi, ...
    'PassbandRipple',Rp, 'SampleRate',Fs);
[HC,FC] = freqz(c);
figure(5)
plot(FC/(2*pi),abs(HC))
axis( [0 0.6 0 1.1])
grid on
set(gca,'YTick',[0 0.02 0.94 1.06])
set(gca,'XTick',[0 0.1 0.125 0.150 0.40 0.425 0.45])
title('Frequency response of Chebyshev type I, N=5');
xlabel('Normalized Frequency (x 2*pi rad/sample)')
ylabel('magnitude')
figure()
plot(FC,angle(HC)*180/pi)
grid on
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Phase (degrees)')