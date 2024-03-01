% Come plottare le regioni di stabilità
% https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/23972/versions/22/previews/chebfun/examples/ode/html/Regions.html

% Serve il pacchetto chebfun

clc
close all
clear all

set(0,'DefaultAxesColorOrder',[0 0 0],'DefaultAxesLineStyleOrder','-|--|:|-.')


C = 'Color';
%c = {'b','r','g','m','y','c'};
c = {'k','k','k','k','k','k'};
x = [0 0];
y = [-8 8];
K = 'k';
LW = 'LineWidth';
FS = 'FontSize';
DN = 'DisplayName';

%t = chebfun('t',[0 2*pi]);
t = linspace(0,2*pi,100);
z = exp(1i*t);

figure
hold on


w = z-1;
plot(w,C,c{1},LW,1,DN,'ordine 1')

for i = 1:3
  w = w-(1+w+.5*w.^2-z.^2)./(1+w);
end
plot(w,C,c{2},LW,1,DN,'ordine 2')

for i = 1:4
  w = w-(1+w+.5*w.^2+w.^3/6-z.^3)./(1+w+w.^2/2);
end
plot(w,C,c{3},LW,1,DN,'ordine 3')

for i = 1:4
  w = w-(1+w+.5*w.^2+w.^3/6+w.^4/24-z.^4)...
      ./(1+w+w.^2/2+w.^3/6);
end
plot(w,C,c{4},LW,1,DN,'ordine 4')

% gli assi
plot(y,x,'-k',LW,0.6,'HandleVisibility','off')
plot(x,y,'-k',LW,0.6,'HandleVisibility','off')

axis([-5 2 -3.5 3.5]), axis square, grid on
%title('Runge-Kutta orders 1,2,3,4',FS,16)
legend
set(legend,'Location','Best')