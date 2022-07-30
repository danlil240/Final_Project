format 
clear
clc
close all
input=importdata('impulse.txt');
start=17/400e-6;
finish=30/400e-6;
% length(input(:,1))-1
tm = (0:1:finish-start)'.*400e-6;
ym = (input(start:finish,2)-mean(input(start:finish,2)));
um = 1.*input(start:finish,3);
figure('DefaultAxesFontName','David','DefaultAxesFontSize',12, 'DefaultAxesFontWeight', 'bold')
% subplot(211); 
plot(tm,ym,'linewidth',1.2); ylabel('Displacment[\mum]')
% subplot(212); plot(tm,um,'linewidth',1.2); ylabel('Excitation[A]');ylim([-0.1,0.1])
xlabel('Time[s]')
wc = 2*pi*10;
xi = 1;
LPF = tf(wc^2,[1 2*xi*wc wc^2]);
ymLPF = lsim(LPF,ym,tm);


GG = 0.9;
k = GG*0.27*1272.8;
c = 0.7*0.2557; %1.8
m = GG*0.2;
G = tf(1,[m c k]);


A = [0 1;-k/m -c/m];
B = [0 1/m]';
C = [1 0];
D = 0;


sys = ss(A,B,C,D);
sysd = c2d(sys,400e-6);
wm = 2*pi*6.55
damp(G)
[ys,ts,xs] = lsim(sysd,um,tm);

% 
figure(2)
subplot(211); plot(tm,ym); legend('ex'); %xlim([0 4])
subplot(212); plot(ts, ys); legend('model'); %xlim([0 4])
figure(3)
plot(tm,ymLPF, ts, ys); legend('ex','model'); xlim([15 40])


gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=30E-3;%A
mass = m;
A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';
C=[1 0];
D=0;

sys = ss(A,B,C,D);
sysd = c2d(sys,400e-6);
Q = diag([22000 0.1]);
R = 0.001;
lqr(A,B,Q,R)
lqrd(A,B,Q,R,400e-6)


% 
% T = 400e-6;             % Sampling period       
% Fs = 1/T;            % Sampling frequency 
% L = length(ym);             % Length of signal
% f = Fs*(0:(L/2))/L;
% t = (0:L-1)*T;        % Time vector
% Y = fft(ym);
% 
% L = length(um);             % Length of signal
% U = fft(um);
% G = Y./U;
% figure(4)
% P2 = abs(G/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|'); %xlim([0 15]); legend('ex')


% 
% 
% avg = mean(input(:,2));
% input(:,2) = (input(:,2)-avg)*1e-6;
% st = min(find(input(:,2)<(8.39e-5)));
% % input(:,1)=(input(:,1)-input(1,1))*400e-6;
% tm = (0:1:length(input(st:end,1))-1)'.*400e-6;
% ym = input(st:end,2);
% % t0=find((input(1:end-1,1).*input(2:end,1))<0);
% % t0=1;
% 
% k = 0.86*1272.8;
% c = 1.8*0.2557; %1.8
% m = 1.2180*0.48;
% G = tf(1,[m c k]);
% 
% 
% A = [0 1;-k/m -c/m];
% B = [0 1/m]';
% C = [1 0];
% D = 0;
% sys = ss(A,B,C,D);
% [y t] = initial(sys,[8.39e-5 0]')
% 
% 
% we = 2*pi*6.9
% damp(G)
% % Gd = c2d(G,400e-6);
% % [y t] = impulse(In*Gd);
% 
% 
% subplot(211); plot(tm,ym); legend('ex'); xlim([0 4])
% subplot(212); plot(t, y); legend('model'); xlim([0 4])
% 
% sysd = c2d(sys,400e-6);
% Q = diag([22000 0.001]);
% R = 0.001;
% lqr(A,B,Q,R)
% lqrd(A,B,Q,R,400e-6)
% % 
% % 
% % 
% % T = 400e-6;             % Sampling period       
% % Fs = 1/T;            % Sampling frequency 
% % L = length(ym);             % Length of signal
% % t = (0:L-1)*T;        % Time vector
% % Y = fft(ym);
% % P2 = abs(Y/L);
% % P1 = P2(1:L/2+1);
% % P1(2:end-1) = 2*P1(2:end-1);
% % 
% % f = Fs*(0:(L/2))/L;
% % 
% % 
% % 
% % figure(10)
% % plot(f,P1) 
% % title('Single-Sided Amplitude Spectrum of X(t)')
% % xlabel('f (Hz)')
% % ylabel('|P1(f)|')
% % hold on
% % 
% % 
% % T = 400e-6;             % Sampling period       
% % Fs = 1/T;            % Sampling frequency 
% % L = length(y);             % Length of signal
% % t = (0:L-1)*T;        % Time vector
% % Y = fft(y);
% % P2 = abs(Y/L);
% % P1 = P2(1:L/2+1);
% % P1(2:end-1) = 2*P1(2:end-1);
% % 
% % f = Fs*(0:(L/2))/L;
% % plot(f,P1) 
% % title('Single-Sided Amplitude Spectrum of X(t)')
% % xlabel('f (Hz)')
% % ylabel('|P1(f)|'); xlim([0 15]); legend('ex')
% % 
% % 
% % A = [0 1;-k/m -c/m];
% % B = [0 1/m]';
% % C = [1 0];
% % D = 0;
% % sys = ss(A,B,C,D);
% % sysd = c2d(sys,400e-6);
% % Q = diag([22000 0.1]);
% % R = 0.001;
% % lqr(A,B,Q,R)
% % lqrd(A,B,Q,R,400e-6)