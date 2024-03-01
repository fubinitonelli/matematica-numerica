clc
close all
clear all

xp = [1 3 4 6 8];
%xp = [0 1 3 5 7 8];

set(0,'DefaultAxesColorOrder',[0 0 0],'DefaultAxesLineStyleOrder','-|--|:|-.')

coeffs = lagrangePoly(xp);

xx = linspace(xp(1),xp(end));

figure
hold on
grid on
spessore = 1;

for i = 1:numel(xp) % numel = number of elements in array
    legenda = ['Polinomio che vale 1 in x = ',num2str(xp(i))];
    if ( i > 4*spessore)
        spessore = spessore + 1;
    end
    
    plot(xx,polyval(coeffs(i,:),xx),'LineWidth',spessore,'DisplayName',legenda)
    end

legend
set(legend,'Location','Best')

scatter(xp,ones(size(xp)),50,'k','filled','HandleVisibility','off')
scatter(xp,zeros(size(xp)),50,'k','filled','HandleVisibility','off')