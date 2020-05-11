% Based on code from https://towardsdatascience.com/how-to-build-a-market-simulator-using-markov-chains-and-python-7923256f8d29

close all
clear all
clc

transitionMatrix = [0.89,0.75,0.49;0.10, 0.22, 0.44; 0.01, 0.03, 0.07];
redesignMatrix = [0.65,0.45,0.29;0.34, 0.42, 0.44; 0.01, 0.13, 0.27];

initialState = [188969, 81356, 14210]; 

months = 10;

a = zeros(months+1, 1);
b = zeros(months+1, 1);
c = zeros(months+1, 1);

a(1) = initialState(1);
b(1) = initialState(2);
c(1) = initialState(3);

na = zeros(months+1, 1);
nb = zeros(months+1, 1);
nc = zeros(months+1, 1);

na(1) = initialState(1);
nb(1) = initialState(2);
nc(1) = initialState(3);
for i = 1:months
    temp = (transitionMatrix^i) * initialState';
    a(i+1) = temp(1);
    b(i+1) = temp(2);
    c(i+1) = temp(3);
    
    ntemp = (redesignMatrix^i) * initialState';
    na(i+1) = ntemp(1);
    nb(i+1) = ntemp(2);
    nc(i+1) = ntemp(3);
endfor

t = 0:months;

figure(1)
plot(t, a, 'r-o','linewidth', 3 , t, b, 'b-o','linewidth', 3, t, c, 'k-o','linewidth', 3)
xlabel('Months','Interpreter','latex')
ylabel('Number of customers','Interpreter','latex')
title('Customer movement','Interpreter','latex')
legend({"Inactive users", "Active users", "Very active users"})
legend("boxoff")
legend("location", "southoutside")
legend('orientation', 'vertical')

%%print('-dpdflatex', './img/hw10_markov.tex', '-S400,400');

figure(2)
plot(t, a, 'r-+','linewidth', 3 , t, na, 'r--s','linewidth', 3, t, b, 'b-+','linewidth', 3, t, nb, 'b--s','linewidth', 3 , t, c, 'k-+','linewidth', 3 , t, nc, 'k--s','linewidth', 3)
xlabel('Months','Interpreter','latex')
ylabel('Number of customers','Interpreter','latex')
title('Customer movement','Interpreter','latex')
legend({"Inactive users","Redesign", "Active users",   "Redesign", "Very active", "Redesign"})
legend("boxoff")
legend("location", "southoutside")
legend('orientation', 'vertical')


%%print('-dpdflatex', './img/hw10_redesign.tex', '-S400,400');
