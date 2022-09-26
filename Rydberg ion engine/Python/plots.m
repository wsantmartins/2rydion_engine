%spin operators
load sx_op;
dt_sx = sx_op;
load sy_op;
dt_sy = sy_op;
load sz_op;
dt_sz = sz_op;

%boson space operators 
load x_op;
dt_x = x_op;
load p_op;
dt_p = p_op;

figure(1) 
plot(dt_sx(:,1), dt_sx(:,2), dt_sy(:,1), dt_sy(:,2), dt_sz(:,1), dt_sz(:,2), 'LineWidth', 1);
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
%ylabel('$x$', 'Interpreter','latex')
legend({'$s_x$', '$s_y$', '$s_z$'}, 'Interpreter','latex', ...
    'Location','best')
%axis([0 10000 -0.1 0.05])

figure(2)
plot(dt_x(:,1), dt_x(:,2), dt_p(:,1), dt_p(:,2), 'LineWidth', 1);
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
%ylabel('$x$', 'Interpreter','latex')
legend({'$x$', '$p$'}, 'Interpreter','latex', ...
    'Location','best')
