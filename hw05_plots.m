 close all;
 clear all;
 clc; 
 clf;
%% fmt = {"horizontalalignment", "center", "verticalalignment", "middle"};

%% lambda [0.5, 1, 2]

expPDF01 = zeros(51,1);
expPDF02 = zeros(51,1);
expPDF03 = zeros(51,1);

expCDF01 = zeros(51,1);
expCDF02 = zeros(51,1);
expCDF03 = zeros(51,1);

lambda01 = 0.5;
lambda02 = 1;
lambda03 = 2;

for i = 0:50
  expPDF01(i+1) = lambda01*exp(-lambda01*i);
  expPDF02(i+1) = lambda02*exp(-lambda02*i);
  expPDF03(i+1) = lambda03*exp(-lambda03*i);
  
  expCDF01(i+1) = 1-exp(-lambda01*i);
  expCDF02(i+1) = 1-exp(-lambda02*i);
  expCDF03(i+1) = 1-exp(-lambda03*i);
endfor

%%expCDF01 = cumsum(expPDF01);
%%expCDF02 = cumsum(expPDF02);
%%expCDF03 = cumsum(expPDF03);
  
%% alpha [2, 3, 7, 7]
%% lambda [0.5, 2, 2, 1]

gammaPDF01 = zeros(31,1);
gammaPDF02 = zeros(31,1);
gammaPDF03 = zeros(31,1);
gammaPDF04 = zeros(31,1);

gammaCDF01 = zeros(31,1);
gammaCDF02 = zeros(31,1);
gammaCDF03 = zeros(31,1);
gammaCDF04 = zeros(31,1);

mu01 = 0.5;
mu02 = 2;
mu03 = 2;
mu04 = 1;

r01 = 2;
r02 = 3;
r03 = 7;
r04 = 7;

for x = 0:30
  gammaPDF01(x+1) = mu01*(mu01*x)^(r01-1)*exp(-mu01*x)/factorial(r01);
  gammaPDF02(x+1) = mu02*(mu02*x)^(r02-1)*exp(-mu02*x)/factorial(r02);
  gammaPDF03(x+1) = mu03*(mu03*x)^(r03-1)*exp(-mu03*x)/factorial(r03);
  gammaPDF04(x+1) = mu04*(mu04*x)^(r04-1)*exp(-mu04*x)/factorial(r04);
  
  for n = 0:(r01-1)
    gammaCDF01(x+1) = gammaCDF01(x+1) + exp(-mu01 *x)*(mu01*x)^n;
  endfor
  
    for n = 0:(r02-1)
    gammaCDF02(x+1) = gammaCDF02(x+1) + exp(-mu02 *x)*(mu02*x)^n;
  endfor
  
    for n = 0:(r03-1)
    gammaCDF03(x+1) = gammaCDF03(x+1) + exp(-mu03 *x)*(mu03*x)^n;
  endfor
      for n = 0:(r04-1)
    gammaCDF04(x+1) = gammaCDF04(x+1) + exp(-mu04 *x)*(mu04*x)^n;
    endfor
  
  gammaCDF01(x+1) = 1 - gammaCDF01(x+1);
  gammaCDF02(x+1) = 1 - gammaCDF02(x+1);
  gammaCDF03(x+1) = 1 - gammaCDF03(x+1);
  gammaCDF04(x+1) = 1 - gammaCDF04(x+1);
  endfor

figure(1)



subplot(3,2,1)
plot(0:30, gammaPDF01, 'k',  0:30, gammaCDF01, '--k')
title('$\mu = 0.5, r = 2$','Interpreter','latex')
set(gcf,'Color',[1 1 1])

subplot(3,2,2)
plot(0:30, gammaPDF02, 'k',  0:30, gammaCDF02, '--k')
title('$\mu = 2, r = 3$','Interpreter','latex')

subplot(3,2,3)
plot(0:30, gammaPDF03, 'k',  0:30, gammaCDF03, '--k')
ylim([0, 1])
title('$\mu = 2, r = 7$','Interpreter','latex')

subplot(3,2,4)
plot(0:30, gammaPDF04, 'k',  0:30, gammaCDF04, '--k')
ylim([0, 1])
legend({"PDF","CDF"})
legend("boxoff")
legend("location", "eastoutside")
title('$\mu = 1, r = 7$','Interpreter','latex')

subplot(3,2,5)
plot(0:30, gammaPDF03, 'k',  0:30, gammaCDF03, '--k')
title('$\mu = 2, r = 7$','Interpreter','latex')

subplot(3,2,6)
plot(0:30, gammaPDF04, 'k',  0:30, gammaCDF04, '--k')
title('$\mu = 1, r = 7$','Interpreter','latex')

print('-dpdflatex', './img/hw05_gamma.tex', '-S300,300');

 
figure(2)

subplot(3,1,1)
plot(0:50, expPDF01, 'k',  0:50, expCDF01, '--k')
title('$\lambda = 0.5$','Interpreter','latex')
set(gcf,'Color',[1 1 1])

subplot(3,1,2)
plot(0:50, expPDF02, 'k',  0:50, expCDF02, '--k')
legend({"PDF","CDF"})
legend("boxoff")
legend("location", "eastoutside")
title('$\lambda = 1$','Interpreter','latex')

subplot(3,1,3)
plot(0:50, expPDF03, 'k',  0:50, expCDF03, '--k')
title('$\lambda = 2$','Interpreter','latex')

print('-dpdflatex', './img/hw05_exp.tex', '-S300,300');