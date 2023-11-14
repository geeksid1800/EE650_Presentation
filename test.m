A = [ 0   1   0
     490  0  -5.43
      0   0  -10 ];

B = [ 0
      0
      20 ];

C = [ 1 0 0 ];

t = 0:0.01:2;
u = 0.001*ones(size(t));
x0 = [0.01 0 0];

sys = ss(A,B,C,0);

p1 = -20 + 20i;
p2 = -20 - 20i;
p3 = -100;

K = place(A,B,[p1 p2 p3]);
Nbar = rscale(sys,K)

sys_cl = ss(A-B*K,B,C,0);

lsim(sys_cl,Nbar*u,t)
title('Linear Simulation Results (with Nbar)')
xlabel('Time (sec)')
ylabel('Ball Position (m)')
axis([0 2 0 1.2*10^-3])