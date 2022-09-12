%plot script
%plotting all functions at the same plot with different specifications
%here I define the vectors that are used in my plots 

figure(1)
data_line1 = plot(t, sx, ...
    t, sy, ...
    t, sz, ...
    'LineWidth', 1);
set(data_line1(1), 'LineStyle','-','Color', 'red')
set(data_line1(2),'LineStyle','-', 'Color', 'blue')
set(data_line1(3),'LineStyle','-', 'Color', 'black')
grid off
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
%ylabel('$\Omega$', 'Interpreter','latex')
legend({'$J_x$', '$J_y$', '$J_z$'}, 'Interpreter','latex', ...
    'Location','best')
%set the axis limits
axis([0 domain -1 1])

figure(2)
data_line2 = plot(t, x,...
    t, p,...
    'LineWidth', 1);
set(data_line1(1), 'LineStyle','-','Color', 'red')
set(data_line1(2),'LineStyle','-', 'Color', 'blue')
grid off
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
%ylabel('$\Omega$', 'Interpreter','latex')
legend({'$x$', '$p$'}, 'Interpreter','latex', ...
    'Location','best')
%set the axis limits
axis([0 domain -4 4])

figure(3)
data_line3 = plot(x, p, 'LineWidth', 1);
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$x$', 'Interpreter','latex')
ylabel('$p$', 'Interpreter','latex')

figure(4)
data_line4 = plot(t, U_t,'LineWidth', 1);
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
ylabel('$U_t/\gamma$', 'Interpreter','latex')
%set the axis limits
axis([0 domain -2 2])

figure(5)
data_line5 = plot(t, w,'LineWidth', 1);
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
ylabel('$\mathcal{W}/\gamma$', 'Interpreter','latex')
%set the axis limits
axis([0 domain -1 2])