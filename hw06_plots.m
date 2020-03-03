close all
clc
clear all
pkg load statistics

mu = [0 1]; % mu parameter for x and y
covarianceMatrix = [1 0; 0 2]; % covariance matrix for x and y
muX = 0;
muY = 1;
sigmaX = 1;
sigmaY = sqrt(2);

x = -3:0.2:3;
y = -3:0.2:3;
zz = zeros(31, 31);

[X,Y] = meshgrid(x,y);
Z = [X(:) Y(:)];
z = mvnpdf(Z,mu,covarianceMatrix);
z = reshape(z,length(y),length(x));
p = mvncdf(Z, mu, covarianceMatrix);
p = reshape(z,length(y),length(x));

for j= 1:31
  for i = 1:31
    zz(i,j) =  ((x(i) - muX)^(2))/(sigmaX^2) + ((y(j) - muY)^(2))/(sigmaY^2);
  endfor  
endfor
Pz = 1/(2*pi*sigmaX*sigmaY) * exp(-zz/2);

figure(1)
subplot(1,2,1)
surf(x,y,z)
colormap(bone)
caxis([min(z(:))-range(z(:)),max(z(:))])
axis([-3 3 -3 3 0 0.15])
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$f(x,y)$','Interpreter','latex')
title('Octave','Interpreter','latex')
colorbar('southoutside')
set(gcf,'Color',[1 1 1])

subplot(1,2,2)
surf(x,y,Pz')
colormap(bone)
caxis([min(z(:))-range(z(:)),max(z(:))])
axis([-3 3 -3 3 0 0.15])
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$f(x,y)$','Interpreter','latex')
title('Equation','Interpreter','latex')
colorbar('southoutside')

print('-dpdflatex', './img/hw06_multi.tex', '-S400,300');

FX = normpdf(x, muX, sigmaX);
FY = normpdf(y, muY, sigmaY);

figure(2)
subplot(1,2,1)
plot(x, FX);
xlabel('$x$','Interpreter','latex')
ylabel('$F_X$','Interpreter','latex')

subplot(1,2,2)
plot(y, FY);
xlabel('$y$','Interpreter','latex')
ylabel('$F_Y$','Interpreter','latex')

print('-dpdflatex', './img/hw06_normal.tex', '-S400,200');

clear all

x = -3:0.2:3;
y = -3:0.2:3;
z = -3:0.2:3;

mu = [0 1 0];
sigma = [1 0 0; 0 2 0; 0 0 1];
[X,Y,Z] = meshgrid(x,y, z);
P = [X(:) Y(:) Z(:)];
p = mvnpdf(P,mu,sigma);
p = reshape(p,length(y),length(x),length(z));

figure(3)
xslice = 0; % define the cross sections to view
yslice = 0;
zslice = 0;
slice(x, y, z, p, xslice, yslice, zslice)    % display the slices
ylim([-3 3])
view(-34,24)
colormap(bone)
caxis([min(p(:))-range(p(:)),max(p(:))])
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$z$','Interpreter','latex')
title('Cross section view of $P(x, y, z)$','Interpreter','latex')
print('-dpdflatex', './img/hw06_slice.tex', '-S300,300');

close all