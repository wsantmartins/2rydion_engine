tspan = linspace(0, 10, 1000);

plot(tspan, quench(tspan, 2*pi, 0.2, 1.0), tspan, quench(tspan + pi/2.0, 2*pi, 0.2, 1.0))