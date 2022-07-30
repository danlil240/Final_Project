function fiteredStep = step_BPF(dt,Tf) 
Fs = 1/dt;            % Sampling frequency                    
T = dt;             % Sampling period       
L = Tf/dt+1;             % Length of signal
t = (0:L-1)*T;        % Time vector
stepF=[zeros(1,floor(L/6)),0.008*ones(1,ceil(5*L/6))];


fcL = 400;
fcH = 200;
XiL = 2;
XiH = 2;
wclpf = 2*pi*fcL;
wxhpf = 2*pi*fcH;
LPF = tf(wclpf^2,[1 2*XiL*wclpf wclpf^2]);
HPF = tf([1 0 0],[1 2*XiH*wxhpf wxhpf^2]);
BPF = LPF*HPF;

% figure(5)
% bode (LPF,HPF,BPF); legend('LPF','HPH','BPF')

disFilter=c2d(BPF,T,'tustin');
 [num,den] = tfdata(disFilter);
 Dnum=cell2mat(num);
 Dden=cell2mat(den);
 fiteredStep=zeros(1,L);
 for k =[5:L]
    fiteredStep(k)=Dnum*stepF(k-[0:4])'-Dden(2:end)*fiteredStep(k-[1:4])';
 end
% fiteredWnoise2=bandpass(Wnoise,[2 100],1000);
figure(1)
plot(t,fiteredStep)
% title('Signal Corrupted with Zero-Mean Random Noise')
% xlabel('t (milliseconds)')
% ylabel('X(t)')
% Y = fft(fiteredWnoise);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% figure(2)
% plot(f,P1) 
% 
% [y,tOut,x]=lsim(LPF,Wnoise,t);
% w=bandpass(X,[49 121],1000);
% plot(t,w)
% Y = fft(y);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% figure(3)
% plot(f,P1) 
%%

% 
%  syms z
%  G_sym = vpa(poly2sym(cell2mat(num),z)/poly2sym(cell2mat(den),z),12)
% figure(5)
% bode (LPF,HPF,BPF); legend('LPF','HPH','BPF')
% figure(6)
end