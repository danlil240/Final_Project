P=8.1549;
D=7433.33;
Ts=350e-6;
PDcont=tf([P D],[1e-4 1])
pdcontD=c2d(PDcont,Ts,'tustin')