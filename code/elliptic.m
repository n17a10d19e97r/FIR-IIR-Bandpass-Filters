%ECE569 Project1
%IIR Elliptic Filter
Rp = 0.5374;
Rs = 33.979;
Fs = pi;
Wp = [0.15*pi 0.40*pi]/(Fs/2);
Ws = [0.10*pi 0.45*pi]/(Fs/2);
[i,Wp] = ellipord(Wp,Ws,Rp,Rs);
n3 =i
[I,J,K,L] = ellip(n3,Rp,Rs,Wp/(Fs/2));
e = designfilt('bandpassiir','FilterOrder',n3*2, ...
    'PassbandFrequency1',0.15*pi,'PassbandFrequency2',0.40*pi, ...
    'PassbandRipple',Rp, ...
    'StopbandAttenuation1',Rs,'StopbandAttenuation2',Rs, ...
    'SampleRate',Fs);
[HE,FE] = freqz(e);
figure(6)
plot(FE/(2*pi),abs(HE))
axis([0 0.6 0 1.1])
set(gca,'YTick',[0 0.02 0.94 1.06])
set(gca,'XTick',[0 0.1 0.125 0.150 0.40 0.425 0.45])
grid on
title('Frequency response of Elliptic method, N=4');
xlabel('Normalized Frequency (x 2*pi rad/sample)')
ylabel('magnitude')
figure()
plot(FE,angle(HE)*180/pi)
grid on
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Phase (degrees)')