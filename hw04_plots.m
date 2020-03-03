 close all;
 clear all;
 clc; 
 clf;
 fmt = {"horizontalalignment", "center", "verticalalignment", "middle"};

%% n in [10, 20, 30]
%% p in [0.1, 0.3, 0.5]
%% lambda in [1, 2, 3]

figure(1)
n01 = 10;
n02 = 20;
n03 = 30;

p01 = 0.1;
p02 = 0.3;
p03 = 0.5;

binomial11 = zeros(11,1);
binomial12 = zeros(11,1);
binomial13 = zeros(11,1);

binomial21 = zeros(21,1);
binomial22 = zeros(21,1);
binomial23 = zeros(21,1);

binomial31 = zeros(31,1);
binomial32 = zeros(31,1);
binomial33 = zeros(31,1);


for i = 0:30;
  if(i<11)
binomial11(i+1) = nchoosek(n01,i)*(p01)^i * (1-p01)^(n01-i);
binomial12(i+1) = nchoosek(n01,i)*(p02)^i * (1-p02)^(n01-i);
binomial13(i+1) = nchoosek(n01,i)*(p03)^i * (1-p03)^(n01-i);
  endif

  if(i<21)
binomial21(i+1) = nchoosek(n02,i)*(p01)^i * (1-p01)^(n02-i);
binomial22(i+1) = nchoosek(n02,i)*(p02)^i * (1-p02)^(n02-i);
binomial23(i+1) = nchoosek(n02,i)*(p03)^i * (1-p03)^(n02-i);
endif  

binomial31(i+1) = nchoosek(n03,i)*(p01)^i * (1-p01)^(n03-i);
binomial32(i+1) = nchoosek(n03,i)*(p02)^i * (1-p02)^(n03-i);
binomial33(i+1) = nchoosek(n03,i)*(p03)^i * (1-p03)^(n03-i);
  
endfor

cummulativeBinomial11 = cumsum(binomial11);
cummulativeBinomial12 = cumsum(binomial12);
cummulativeBinomial13 = cumsum(binomial13);

cummulativeBinomial21 = cumsum(binomial21);
cummulativeBinomial22 = cumsum(binomial22);
cummulativeBinomial23 = cumsum(binomial23);

cummulativeBinomial31 = cumsum(binomial31);
cummulativeBinomial32 = cumsum(binomial32);
cummulativeBinomial33 = cumsum(binomial33);

subplot(3,3,1)
plot(0:10, cummulativeBinomial11, 'k')
title('$n = 10, p = 0.1$','Interpreter','latex')
set(gcf,'Color',[1 1 1])

subplot(3,3,2)
plot(0:10, cummulativeBinomial12, 'k')
title('$n = 10, p = 0.3$','Interpreter','latex')

subplot(3,3,3)
plot(0:10, cummulativeBinomial13, 'k')
title('$n = 10, p = 0.5$','Interpreter','latex')

subplot(3,3,4)
plot(0:20, cummulativeBinomial21, 'k')
title('$n = 20, p = 0.1$','Interpreter','latex')

subplot(3,3,5)
plot(0:20, cummulativeBinomial22, 'k')
title('$n = 20, p = 0.3$','Interpreter','latex')

subplot(3,3,6)
plot(0:20, cummulativeBinomial23, 'k')
title('$n = 20, p = 0.5$','Interpreter','latex')

subplot(3,3,7)
plot(0:30, cummulativeBinomial31, 'k')
title('$n = 30, p = 0.1$','Interpreter','latex')

subplot(3,3,8)
plot(0:30, cummulativeBinomial32, 'k')
title('$n = 30, p = 0.3$','Interpreter','latex')

subplot(3,3,9)
plot(0:30, cummulativeBinomial33, 'k')
title('$n = 30, p = 0.5$','Interpreter','latex')

print('-dpdflatex', './img/hw04_binomial.tex', '-S300,300');

figure(2)

geometric11 = zeros(11,1);
geometric12 = zeros(11,1);
geometric13 = zeros(11,1);

geometric21 = zeros(21,1);
geometric22 = zeros(21,1);
geometric23 = zeros(21,1);

geometric31 = zeros(31,1);
geometric32 = zeros(31,1);
geometric33 = zeros(31,1);


for i = 0:30;
  if(i<11)
geometric11(i+1) = p01 * (1-p01)^(n01-i);
geometric12(i+1) = p02 * (1-p02)^(n01-i);
geometric13(i+1) = p03 * (1-p03)^(n01-i);
  endif

  if(i<21)
geometric21(i+1) = p01 * (1-p01)^(n02-i);
geometric22(i+1) = p02 * (1-p02)^(n02-i);
geometric23(i+1) = p03 * (1-p03)^(n02-i);
endif  

geometric31(i+1) = p01 * (1-p01)^(n03-i);
geometric32(i+1) = p02 * (1-p02)^(n03-i);
geometric33(i+1) = p03 * (1-p03)^(n03-i);
  
endfor

cummulativeGeometric11 = cumsum(geometric11);
cummulativeGeometric12 = cumsum(geometric12);
cummulativeGeometric13 = cumsum(geometric13);

cummulativeGeometric21 = cumsum(geometric21);
cummulativeGeometric22 = cumsum(geometric22);
cummulativeGeometric23 = cumsum(geometric23);

cummulativeGeometric31 = cumsum(geometric31);
cummulativeGeometric32 = cumsum(geometric32);
cummulativeGeometric33 = cumsum(geometric33);

subplot(3,3,1)
plot(0:10, cummulativeGeometric11, 'k')
title('$n = 10, p = 0.1$','Interpreter','latex')
set(gcf,'Color',[1 1 1])

subplot(3,3,2)
plot(0:10, cummulativeGeometric12, 'k')
title('$n = 10, p = 0.3$','Interpreter','latex')

subplot(3,3,3)
plot(0:10, cummulativeGeometric13, 'k')
title('$n = 10, p = 0.5$','Interpreter','latex')

subplot(3,3,4)
plot(0:20, cummulativeGeometric21, 'k')
title('$n = 20, p = 0.1$','Interpreter','latex')

subplot(3,3,5)
plot(0:20, cummulativeGeometric22, 'k')
title('$n = 20, p = 0.3$','Interpreter','latex')

subplot(3,3,6)
plot(0:20, cummulativeGeometric23, 'k')
title('$n = 20, p = 0.5$','Interpreter','latex')

subplot(3,3,7)
plot(0:30, cummulativeGeometric31, 'k')
title('$n = 30, p = 0.1$','Interpreter','latex')

subplot(3,3,8)
plot(0:30, cummulativeGeometric32, 'k')
title('$n = 30, p = 0.3$','Interpreter','latex')

subplot(3,3,9)
plot(0:30, cummulativeGeometric33, 'k')
title('$n = 30, p = 0.5$','Interpreter','latex')

print('-dpdflatex', './img/hw04_geometric.tex', '-S300,300');
 
figure(3)
lambda01 = 1;
lambda02 = 2;
lambda03 = 3;
poisson01 = zeros(11,1);
poisson02 = zeros(11,1);
poisson03 = zeros(11,1);
for i = 0:10;
  poisson01(i+1)= exp(- lambda01) * (lambda01^i)/factorial(i);
  poisson02(i+1)= exp(- lambda02) * (lambda02^i)/factorial(i);
  poisson03(i+1) = exp(- lambda03) * (lambda03^i)/factorial(i);
endfor

cummulativePoisson01 = cumsum(poisson01);
cummulativePoisson02 = cumsum(poisson02);
cummulativePoisson03 = cumsum(poisson03);

subplot(1,3,1)
plot(0:10, cummulativePoisson01, 'k')
title('$\lambda = 1$','Interpreter','latex')
set(gcf,'Color',[1 1 1])

subplot(1,3,2)
plot(0:10, cummulativePoisson02, 'k')
title('$\lambda = 2$','Interpreter','latex')

subplot(1,3,3)
plot(0:10, cummulativePoisson03, 'k')
title('$\lambda = 3$','Interpreter','latex')

print('-dpdflatex', './img/hw04_poisson.tex', '-S300,300');