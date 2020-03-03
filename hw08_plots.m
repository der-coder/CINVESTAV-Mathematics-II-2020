close all
clc
clear all
pkg load statistics
%% Real value is 1500
figure(1)
subplot(3,1,1)
hist(stdnormal_rnd(10,1))
xlabel('Normalized estimated value','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')
title('Samples $n = 10$','Interpreter','latex')
%%
subplot(3,1,2)
hist(stdnormal_rnd(100,1))
xlabel('Normalized estimated value','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')
title('Samples $n = 100$','Interpreter','latex')
%%
subplot(3,1,3)
hist(stdnormal_rnd(1000,1))
xlabel('Normalized estimated value','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')
title('Samples $n = 1000$','Interpreter','latex')
%%
print('-dpdflatex', './img/hw08_hist.tex', '-S400,500');