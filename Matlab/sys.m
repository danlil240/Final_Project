clear
syms ddx dx x m L0 C c k I1 I2 Ic Ib x1 x2
I1= Ib^2+2*Ib;
I2= -Ic+Ib;

ddx=(1/m)*(C*I1^2*(1/L0^2+2*x/L0^3)-C*I2^2*(1/L0^2-2*x/L0^3)-c*dx-k*x);
ddx=simplify(ddx);
ddx=collect(ddx,[x,dx])