% set(0, 'DefaultFigureRenderer', 'painters');

clc
close all
clear all

% precondizionatore assegnato
P = [1.0912 -0.8587
    -0.8587  1.5921];

% dati del sistema Ax=b
A=[4.2  -4.32
  -4.32  6.76];
b=[4;8];

x0=[-9;-9]; % guess iniziale
nmax = 1e3; % massimo di iterazioni
tol = 1e-7; % tolleranza

% creazione dell'energia del sistema
x = linspace(-10,10,80);
y = linspace(-10,10,80);
[X,Y] = meshgrid(x,y);
Phi = 0.5* ( A(1,1)*X.^2 + A(2,2)*Y.^2 + 2*A(1,2)*X.*Y ) - b(1)*X - b(2)*Y;

% effetto del precondizionamento
PA = P\A;
Pb = P\b;
Phi_prec = 0.5* ( PA(1,1)*X.^2 + PA(2,2)*Y.^2 + 2*PA(1,2)*X.*Y ) - Pb(1)*X - Pb(2)*Y;

%% plot energia del sistema (superficie)
figure

surf(X,Y,Phi)
colormap(gray(20));
shading interp;
xlabel('x');
ylabel('y');
zlabel('\Phi');
%title('Energia del sistema')

%% plot energia del sistema (superficie) precond.
figure

surf(X,Y,Phi_prec)
colormap(gray(20));
shading interp;
xlabel('x');
ylabel('y');
zlabel('\Phi');
%title('Energia del sistema precondizionato')

%% plot energia del sistema (linee di livello)
figure
hold on
contour(X,Y,Phi,20,'DisplayName','energia del sistema')
colormap(gray)

%% plot energia del sistema (linee di livello) precondizionato
figure
hold on
contour(X,Y,Phi_prec,20,'DisplayName','energia del sistema precondizionato')
colormap(gray)

%% soluzione e plot gradiente
[xk, k_grad] = gradiente(A, b, eye(size(A)), x0, tol, nmax);
plot(xk(1,:),xk(2,:),'-ok','LineWidth',1,'MarkerSize',4,'DisplayName','gradiente non precondizionato') 
k_grad


%% soluzione e plot gradiente precondizionato
[xk, k_grad_prec] = gradiente(A, b, P, x0, tol, nmax);
plot(xk(1,:),xk(2,:),'-.ok','LineWidth',1,'MarkerSize',4,'DisplayName','gradiente precondizionato')
k_grad_prec


