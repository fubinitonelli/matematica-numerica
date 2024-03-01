lambda = -0.5;
y = @(t) exp(lambda * t);

t = linspace(0,14,100);

figure
hold on

legenda = ['y(t)= e^{\lambda t}, \lambda = ',num2str(lambda)];

plot(t,y(t),'k','DisplayName',legenda,'LineWidth',2);

legend show

xlim([0 14])
ylim([-0.1 1.1])

daspect([1 1/6 1])
