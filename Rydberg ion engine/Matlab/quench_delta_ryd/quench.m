function a = quench(t, T, a_max, a_min)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%angular coefficient
ang = 4.0*(a_max - a_min)/T;

%linear coefficients
lin1 = a_max - 2.0*a_min;
lin2 = 4.0*a_max - 3.0*a_min;


%in order to understand the mechanism behind this routine, remember that
%mod(t, T) = t - nT where n is a integer

%defining the domain
%the first one 0 < t < pi/2 
d1 = (0 <= mod(t, T) & mod(t, T) < T/4);
a(d1) = a_min;

%the second one pi/2 < t < pi
d2 = (T/4 <= mod(t, T) & mod(t, T) < T/2);
a(d2) = ang*mod(t(d2), T) - lin1;

%the third one pi < t < 3*pi/2
d3 = (T/2 <= mod(t, T) & mod(t, T) < 3*T/4);
a(d3) = a_max;

%the fourth one 0 < t < pi/2
d4 = (3.0*T/4.0 <= mod(t, T) & mod(t, T) <= T);
a(d4) = lin2 - ang*mod(t(d4), T);

end