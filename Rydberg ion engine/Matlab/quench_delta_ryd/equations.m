function dydt = equations(t, y)

%this variable represents the ratio between x0 and a0, i.e., the
%oscillatory amplitude and the distance in ions between
r0 = 0.1;

%this coefficient can be 3 for dipole-dipole interaction and 6 for van der
%Waals interaction
dv = 6;

%variables of the problem 
%gamma represents the frequency concerning ion lifetimes and, in the 
% present situation, is what gives the timescales of our problem 
gamma = 1;

%k0 is the first term on the Rydberg potential expansion
k0 = 1000;
k1 = dv*k0*r0;
k2 = dv*(dv + 1)*k0*r0^2/2.0;

%Delta is the detuning, where omega the trap frequency and big_omega the
%Rabi frequency
delta = 1; 
omega = 10;
big_omega = 100;

c = sqrt(3);

x = y(1,:); 
x2 = y(2,:);
p = y(3,:);
p2 = y(4,:);
xp_px = y(5,:);
sx = y(6,:);
sy = y(7,:);
sz = y(8,:);

nr = 0.5 + sz./2.0;

%Now k1 is defined as a positive constant 
%Here I divide all equations by gamma, in such a way that my variables are
%in units of gamma and the time is gamma*t

dydt(1,:) = (c*omega.*p)./gamma;
dydt(2,:) = (c*omega.*xp_px)./gamma; 
dydt(3,:) = (-c*omega.*x + sqrt(2)*k1.*(nr.^2.0) - 4.0*k2.*x.*(nr.^2.0))./gamma;
dydt(4,:) = (-c*omega.*xp_px + sqrt(8.0)*k1.*p.*nr.^2 - 4.0*k2.*xp_px.*nr.^2.0)./gamma;
dydt(5,:) = (2.0*(-c*omega.*(x2 - p2) + sqrt(2.0)*k1.*x.*nr.^2 - 4.0*k2.*x2.*nr.^2))./gamma; 
dydt(6,:) = (-(k0 - sqrt(2.0)*k1.*x + 2.0*k2.*x2).*sy.*nr - delta.*sy -0.5*gamma.*sx)./gamma;
dydt(7,:) = ((k0 - sqrt(2.0)*k1.*x + 2.0*k2.*x2).*sx.*nr - 2.0*big_omega.*sz + delta.*sx - 0.5*gamma.*sy)./gamma;
dydt(8,:) = (2.0*big_omega.*sy - 2.0*gamma.*nr)./gamma;

end