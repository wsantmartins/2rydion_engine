tic 

%parameters for the integration
npts = 1000;
opts = odeset('RelTol', 1e-11, 'AbsTol', 1e-11);
y0 = [1 1 0 0 0 0 1 -1];
domain = 10000;
tspan = linspace(0, domain, npts);
omega = 1.0;

%quench in omega
delta_omega = quench(tspan + pi/2.0, 2*pi, 1.0, 0.0);

[t,y] = ode89(@(t,y) eq_tr_ra(t, y), tspan, y0, opts);

x = y(:,1); 
x2 = y(:,2);
p = y(:,3);
p2 = y(:,4);
xp_px = y(:,5);
sx = y(:,6);
sy = y(:,7);
sz = y(:,8);

%parameters to calculate the ergotropy
px = xp_px - 1.0i;
A = x2 - x.^2;
B = p2 - p.^2;
C = px - p.*x;

w = ergotropy(A, B, C, x2, p2, omega, delta_omega);

%internal energy
U_t = 0.5*sqrt(omega).*p2 + 0.5*sqrt(omega).*(omega + delta_omega'.^2/(3*omega)).*x2;

toc