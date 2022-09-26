load x_op;
dt = x_op;
plot(dt(:,1), dt(:,2), 'LineWidth', 1);
set(gca, 'FontSize', 24, 'FontName','Times') %label fontsize and name
xlabel('$\gamma t$', 'Interpreter','latex')
ylabel('$x$', 'Interpreter','latex')
%axis([0 10000 -0.1 0.05])