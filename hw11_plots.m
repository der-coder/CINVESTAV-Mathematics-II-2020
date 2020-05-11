clear all
close all
clc

Fs = 10;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 80;             % Length of signal
t = (0:L-1)*T;  
lim = L/2;                % FFT Array size
f = Fs*(0:((L)/2))/L;     %frequency vector
A = 2;
alpha = 5;
b = 10;
c = 5;

%% Time signals
S1 = A * exp(- alpha *t);
S2 = A * exp(- alpha *t) .* cos(b*t); 
S3 = zeros(L,1);

 for i =1:L
  if (i*T <= c)
    S3(i) = A;
    endif
  endfor
%%  FFT 
X1 = abs(fft(S1));
X2 = abs(fft(S2));
X3 = abs(fft(S3));

X1 = 2*X1(1:lim);
X2 = 2*X2(1:lim);
X3 = 2*X3(1:lim);

figure(1)
subplot(2,1,1)
plot(t,S1, 'k','linewidth', 3)
title('$A \exp (-\alpha t)$','Interpreter','latex')
xlabel('sec','Interpreter','latex')
ylabel('x(t)','Interpreter','latex')
subplot(2,1,2)
plot(f(1:lim), X1, 'k','linewidth', 3)
xlabel('Hz','Interpreter','latex')
ylabel('|X(f)|','Interpreter','latex')

%%print('-dpdflatex', './img/hw11_exp.tex', '-S300,300');

figure(2)
subplot(2,1,1)
plot(t,S2, 'k','linewidth', 3)
title('$A \exp(-\alpha t) \cos (bt)$','Interpreter','latex')
xlabel('sec','Interpreter','latex')
ylabel('x(t)','Interpreter','latex')
subplot(2,1,2)
plot(f(1:lim), X2, 'k','linewidth', 3)
xlabel('Hz','Interpreter','latex')
ylabel('|X(f)|','Interpreter','latex')

%%print('-dpdflatex', './img/hw11_cos.tex', '-S300,300');

figure(3)

subplot(2,1,1)
plot(t,S3, 'k','linewidth', 3)
xlabel('sec','Interpreter','latex')
ylabel('x(t)','Interpreter','latex')
subplot(2,1,2)
plot(f(1:lim), X3, 'k','linewidth', 3)
title('$A$','Interpreter','latex')
xlabel('Hz','Interpreter','latex')
ylabel('|X(f)|','Interpreter','latex')

%%print('-dpdflatex', './img/hw11_A.tex', '-S300,300');