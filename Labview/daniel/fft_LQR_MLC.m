clear
clc
input=importdata('data1.txt');
t = input(:,1)*500e-6;
x = input(:,2);
v = input(:,3);
i = input(:,4);

figure(1)
subplot(311); plot(t,x); ylabel('x')
subplot(312); plot(t,v); ylabel('v')
subplot(313); plot(t,i); ylabel('i')

figure(2)
plot(t,x/max(abs(x)),t,v/max(abs(v)),t,i/max(abs(i))); 
legend('x','v','i')

                   
T = 500e-6;             % Sampling period       
Fs = 1/T;            % Sampling frequency 
L = length(i);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(x);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
figure(10)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

