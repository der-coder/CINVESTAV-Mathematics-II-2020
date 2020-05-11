clc
clear all
close all

pkg load ltfat

pkg load signal

t = 0:0.1:29;

Y = zeros(291,291);

a1 = 0.2;
a2 = 0.3;
a3 = 0.2;

w1 = 2;
w2 = 5;
w3 = 3;

for i = 1:291
  psi = 3*rand;
  Y(i,:) = a1 .* cos(w1 * t + psi) + a2 .* cos(w2 * t + psi) + a3 .* cos(w3 * t + psi);
  endfor

sample1 = Y(1:3, :);
sample2 = Y(1:10, :);
sample3 = Y(1:20, :);

average1 = mean(sample1);
average2 = mean(sample2);
average3 = mean(sample3);

trueAverage = mean(Y);

[rY, lagY] = xcorr(Y);

%%Ryy = 

figure(1)
plot(t, Y(1, :),t, Y(15, :),t, Y(23, :),t, Y(76, :))
legend({'Sample 1', 'Sample 15', 'Sample 23', 'Sample 76'})
legend("boxoff")
legend("location", "southoutside")
legend('orientation', 'vertical')

%%print('-dpdflatex', './img/hw12_samples.tex', '-S350,250');

figure(5)
plot(t, average1, t, average2, t, average3, t, trueAverage, '--k')
legend({'3 samples', '10 samples', '20 samples', '100 samples'})
legend("boxoff")
legend("location", "southoutside")
legend('orientation', 'vertical')

%%print('-dpdflatex', './img/hw12_ergodic.tex', '-S350,250');

%---------------------------------------------------


tx = 0:pi/20:200;

n = size(tx, 2);

function1 = sin(tx);

white = ceil(200*noise(n, 'white'));
white = diag(function1 + white);

function2 = rescale(white,-1,1);
function3 = noise(n, 'white');

a1 = function1';
a2 = function2;
a3 = function3;

unique1 = unique(a1);
unique2 = unique(a2);
unique3 = unique(a3);

[C1,ia1,ic1] = unique(a1);
[C2,ia2,ic2] = unique(a2);
[C3,ia3,ic3] = unique(a3);

aCounts1 = accumarray(ic1,1);
aCounts2 = accumarray(ic2,1);
aCounts3 = accumarray(ic3,1);

valueCounts1 = [C1, aCounts1];
valueCounts2 = [C2, aCounts2];
valueCounts3 = [C3, aCounts3];

[xc1, lag1] = xcorr(function1);
[xc2, lag2] = xcorr(function2);
[xc3, lag3] = xcorr(function3);

  figure(10)
subplot(2,1,1)
  plot(C1,aCounts1/n)
  axis([-1.2 1.2])
  subplot(2,1,2)
  stem(lag1, xc1)
  
%%  print('-dpdflatex', './img/hw12_sin.tex', '-S300,300');

  figure(11)
  subplot(2,1,1)
    plot(C2,aCounts2/n)
    axis([-1.2 1.2])
      subplot(2,1,2)
  stem(lag2, xc2)

%%  print('-dpdflatex', './img/hw12_noise.tex', '-S300,300');
  
  figure(12)
  subplot(2,1,1)
    plot(C3,aCounts3/n)
      subplot(2,1,2)
  stem(lag3, xc3)
  
%%  print('-dpdflatex', './img/hw12_white.tex', '-S300,300');