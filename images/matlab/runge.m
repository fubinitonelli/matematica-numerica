% Runge

% https://it.mathworks.com/help/matlab/creating_plots/defining-the-color-of-lines-for-plotting.html

clc
close all
clear all

runge = @(t) 1./(1+t.^2);
a = -5;
b = 5;
%n = 10; % grado

set(0,'DefaultAxesColorOrder',[0 0 0],'DefaultAxesLineStyleOrder','-|--|:|-.')

figure;
grid on
hold on

xdis = linspace(a,b,1000); % x 'continuo'
plot(xdis, runge(xdis),'DisplayName','funzione: f(x)','LineWidth',3); % plot 'continuo'


for n = [2:2:8] % faccio diversi plot per vedere quanto peggiora

    % nodi equispaziati
    h = (b-a)/(n+1);
    xnod = linspace(a,b,n+1);
    ynod = runge(xnod);
    P = polyfit(xnod,ynod,n);
    
    ypol = polyval(P,xdis);
    
    legenda = ['interpolante: \Pi_',num2str(n)','f(x)'];
    plot(xdis, ypol,'DisplayName',legenda,'LineWidth',1);
    
    % metto in evidenza l'interpolante nei nodi di interpolazione
    %plot(xnod, ynod, '*b');
    
    % calcolo l'errore
    E = norm((runge(xdis)-ypol),inf);
    fprintf('Errore in norma del massimo con n = %f: %f\n', n,E)
end


legend
set(legend,'Location','Best')

