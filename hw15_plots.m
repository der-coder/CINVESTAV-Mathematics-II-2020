clc
close all
clear all

fn = 1; % Natural frequency
G = 1;
zeta = 2;

n = 30;

Gyy = zeros(n, 1);
Ryy = zeros(n, 1);


% Autospectral density function
for f = 1:n
    a = (abs(1 - (f/fn)^2))^2;
    b = (2 * zeta * f / fn)^2;
    Gyy(f) = G/(a+b);
    endfor

% Output Autocorrelation function
for tau= 1:n 
    x1 = G * pi * fn * exp(-2*pi*zeta*abs(tau))/(4*zeta);
    x2 = cos(2*pi*fn *abs(tau)*sqrt(1-zeta^2));
    x3 = (zeta)/(sqrt(1-zeta^2))*  sin(2*pi*fn *abs(tau)*sqrt(1-zeta^2));
    Ryy(tau) = x1*(x2+x3);
  endfor
      
    
figure(1);
plot (1:n, Gyy,'linewidth', 3, 1:n, Ryy,'linewidth', 3)
xlabel('f')
legend({'$G_{yy}$', '$R_{yy}$'},'Interpreter','latex')
print('-dpdflatex', './img/hw15_comparison.tex', '-S200,200');

figure(2);
plot (1:n, Gyy,'linewidth', 3)
xlabel('f')
ylabel('$G_{yy}$')
title('$G_{yy}$','Interpreter','latex')
print('-dpdflatex', './img/hw15_Gyy.tex', '-S200,200');

figure(3);
plot (1:n, Ryy,'linewidth', 3)
xlabel('f')
ylabel('$R_{yy}$')
title('$R_{yy}$','Interpreter','latex')
print('-dpdflatex', './img/hw15_Ryy.tex', '-S200,200');