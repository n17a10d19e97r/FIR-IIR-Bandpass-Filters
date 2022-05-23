%Digital Filters
%FIR Windowing via Hamming
N1=88
Fs = pi;
Wn = [0.125*pi 0.425*pi]/Fs;
z = fir1(N1,Wn);
[HH,FF] = freqz(z);
%FIR FrequencySampling Method
N2=130
f = [0 0.10 0.15 0.40 0.45 1.0];
m = [0 0 1 1 0 0];
p = fir2(N2,f,m);
[HS,w] = freqz(p);
%FIR Equiripple bia Remez Algorithm 
N3 = 70
k = remez(N3,f,m);
[Hr,w1] = freqz(k);
%Analog Filters
%Design Specifications
Rp = 0.5374;
Rs = 33.979;
Wp = [0.15*pi 0.40*pi]/(Fs/2);
Ws = [0.10*pi 0.45*pi]/(Fs/2);
%IIR Butterworth
[z,Wp] = buttord(Wp,Ws,Rp,Rs);
n1=z
[A,B,C,D] = butter(n1,[0.125*pi 0.425*pi]/(Fs/2));
b = designfilt('bandpassiir','FilterOrder',n1*2, ...
    'HalfPowerFrequency1',0.125*pi,'HalfPowerFrequency2',0.425*pi, ...
    'SampleRate',Fs);
[HB,FB] = freqz(b);
%IIR Cheby1
[s,Wp] = cheb1ord(Wp,Ws,Rp,Rs);
n2 = s
[E,F,G,O] = cheby1(n2,Rp,[0.15*pi 0.4*pi]/(Fs/2));
c = designfilt('bandpassiir','FilterOrder',n2*2, ...
    'PassbandFrequency1',0.15*pi,'PassbandFrequency2',0.4*pi, ...
    'PassbandRipple',Rp, 'SampleRate',Fs);
[HC,FC] = freqz(c);
%IIR Elliptic Filter
[i,Wp] = ellipord(Wp,Ws,Rp,Rs);
n3 =i
[I,J,K,L] = ellip(n3,Rp,Rs,Wp/(Fs/2));
e = designfilt('bandpassiir','FilterOrder',n3*2, ...
    'PassbandFrequency1',0.15*pi,'PassbandFrequency2',0.40*pi, ...
    'PassbandRipple',Rp, ...
    'StopbandAttenuation1',Rs,'StopbandAttenuation2',Rs, ...
    'SampleRate',Fs);
[HE,FE] = freqz(e);
%Plot all three filters to find comparisons 
figure(9)
plot(FF/pi,abs(HH),'LineWidth', 2)
hold on 
plot(w/pi,abs(HS), '--', 'LineWidth', 2)
plot(w1/pi,abs(Hr), '-.','LineWidth', 2)
plot(FB/(2*pi),abs(HB), ':','LineWidth', 2)
plot(FC/(2*pi),abs(HC), '-', 'LineWidth', 2)
plot(FE/(2*pi),abs(HE), '-.', 'color', 'b', 'LineWidth', 2)
axis([ 0 0.5 0 1.1])
grid on
set(gca,'YTick',[0 0.02 0.94 1.06])
set(gca,'XTick',[0 0.1 0.125 0.150 0.40 0.425 0.45])
xlabel('Normalized Frequency (rad/sample)')
ylabel('magnitude')
title('Frequency response of FIR/IIR Bandpass filters using Six Methods')
legend('Hamming, N=80', 'FrequencySampling, N=130', 'Remez, N=70', 'Butterworth, N=9', 'Chebyshev1, N=5', 'Elliptic, N=4')