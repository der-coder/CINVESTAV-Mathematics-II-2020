% BAYESIAN DESCRIPTOR
% WRITTEN BY ISAAC AYALA
% LICENSED UNDER THE GPL 3.0 LICENSE. SEE LICENSE FILE FOR DETAILS.

clc
clear variables
close all

% ------------------------------------------------------
% Read data
iris = readtable('iris.csv');

setosa = iris(contains(string(iris.variety),'Setosa'),:);
versicolor = iris(contains(string(iris.variety),'Versicolor'),:);
virginica = iris(contains(string(iris.variety),'Virginica'),:);

% ------------------------------------------------------
% Show clusters for petal tuple

figure();
subplot(1,2,1)
plot(setosa.petal_length, setosa.petal_width,'r.', versicolor.petal_length, versicolor.petal_width,'b*', virginica.petal_length, virginica.petal_width, 'k+')
title('Petal length - Petal width')
subplot(1,2,2)
plot(setosa.sepal_length, setosa.sepal_width,'r.', versicolor.sepal_length, versicolor.sepal_width,'b*', virginica.sepal_length, virginica.sepal_width, 'k+')
title('Sepal length - Sepal width')
% print -depsc dataset

% ------------------------------------------------------
% Get mu and Sigma for the feature vectors

setosa_data = [setosa.sepal_length, setosa.sepal_width, setosa.petal_length, setosa.petal_width];
versicolor_data = [versicolor.sepal_length, versicolor.sepal_width, versicolor.petal_length, versicolor.petal_width];
virginica_data = [virginica.sepal_length, virginica.sepal_width, virginica.petal_length, virginica.petal_width];

mu_setosa = mean(setosa_data);
mu_versicolor = mean(versicolor_data);
mu_virginica = mean(virginica_data);



% Case B

cov_setosa = [0.26, 0.04, 0.02, 0.01 ; 0.04 , 0.22, 0.03, 0.02; 0.02, 0.03, 0.15, 0.15; 0.01, 0.02, 0.15, 0.31];
cov_versicolor = [0.26, 0.04, 0.02, 0.01 ; 0.04 , 0.22, 0.03, 0.02; 0.02, 0.03, 0.15, 0.15; 0.01, 0.02, 0.15, 0.31];
cov_virginica = [0.26, 0.04, 0.02, 0.01 ; 0.04 , 0.22, 0.03, 0.02; 0.02, 0.03, 0.15, 0.15; 0.01, 0.02, 0.15, 0.31];



% ------------------------------------------------------
% Get the Multivariate Normal Distribution for 2 features: petal_length and petal_width

x = 0:0.1:8;
y = 0:0.1:8;
[X,Y] = meshgrid(x,y); 
M = [X(:) Y(:)]; 

l_x = length(x);
l_y = length(y);

temp_setosa_size2 = mvnpdf(M, mu_setosa(:, 3:4), cov_setosa(3:4, 3:4));
p_setosa_size2 = reshape(temp_setosa_size2, l_x, l_y);

temp_versicolor_size2 = mvnpdf(M, mu_versicolor(:, 3:4), cov_versicolor(3:4, 3:4));
p_versicolor_size2 = reshape(temp_versicolor_size2, l_x, l_y);

temp_virginica_size2 = mvnpdf(M, mu_virginica(:, 3:4), cov_virginica(3:4, 3:4));
p_virginica_size2 = reshape(temp_virginica_size2, l_x, l_y);

%++++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc pdfSetosaCaseA
% print -depsc pdfSetosaCaseB
% print -depsc pdfSetosaCaseC


% +++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc pdfVersicolorCaseA
% print -depsc pdfVersicolorCaseB
% print -depsc pdfVersicolorCaseC

% +++++++++++++++++++++++


figure;
subplot(2,2,1)
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none');
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc pdfVirginicaCaseA
% print -depsc pdfVirginicaCaseB
% print -depsc pdfVirginicaCaseC

% +++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); hold on;
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
legend({'Setosa','Versicolor','Virginica'}, 'Location', 'southoutside')
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); hold on;
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
% legend({'Setosa','Versicolor','Virginica'}, 'Location', 'southoutside')
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); hold on;
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
% legend({'Setosa','Versicolor','Virginica'}, 'Location', 'southoutside')
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,p_setosa_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); hold on;
surf(x,y,p_versicolor_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,p_virginica_size2,'FaceAlpha',0.5, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc pdfCaseA
% print -depsc pdfCaseB
% print -depsc pdfCaseC

% ------------------------------------------------------
% Get P(C_i) C_i: flower variety

P_setosa = size(setosa, 1) / size(iris,1);
P_versicolor = size(versicolor, 1) / size(iris,1);
P_virginica = size(virginica, 1) / size(iris,1);

P_C = [P_setosa, P_versicolor, P_virginica];


% ------------------------------------------------------
% Get P(C_i|x)

den = p_setosa_size2*P_C(1) + p_versicolor_size2 * P_C(2) + p_virginica_size2 * P_C(3);

post_setosa_size2 = P_C(1)*p_setosa_size2./den;
post_versicolor_size2 = P_C(2)*p_versicolor_size2./den;
post_virginica_size2 = P_C(3)*p_virginica_size2./den;

% +++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none');  
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none');
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc classifierSetosaCaseA
% print -depsc classifierSetosaCaseB
% print -depsc classifierSetosaCaseC

% +++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none'); 
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc classifierVersicolorCaseA
% print -depsc classifierVersicolorCaseB
% print -depsc classifierVersicolorCaseC

% +++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,post_virginica_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,post_virginica_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,post_virginica_size2, 'EdgeColor', 'none'); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,post_virginica_size2, 'EdgeColor', 'none'); 
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc classifierVirginicaCaseA
% print -depsc classifierVirginicaCaseB
% print -depsc classifierVirginicaCaseC

% +++++++++++++++++++++++

figure;
subplot(2,2,1)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); 
hold on;
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,post_virginica_size2, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
legend({'Setosa','Versicolor','Virginica'}, 'Location', 'southoutside')
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,90)

subplot(2,2,2)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); 
hold on;
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,post_virginica_size2, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
% legend({'Setosa','Versicolor','Virginica'}, 'Location', 'southoutside')
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(0,0)

subplot(2,2,3)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); 
hold on;
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,post_virginica_size2, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
% legend({'Setosa','Versicolor','Virginica'}, 'Location', 'southoutside')
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(90,0)

subplot(2,2,4)
surf(x,y,post_setosa_size2, 'EdgeColor', 'none', 'FaceColor', [0 0 1]); hold on;
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none', 'FaceColor', [0 1 0]); 
surf(x,y,post_virginica_size2, 'EdgeColor', 'none', 'FaceColor', [1 0 0]); 
view(3)
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')

% print -depsc classifierCaseA
% print -depsc classifierCaseB
% print -depsc classifierCaseC

% ------------------------------------------------------
% Test classifier

figure();
surf(x,y,post_setosa_size2, 'EdgeColor', 'none', 'FaceColor', [0 0 0.6]); hold on;
surf(x,y,post_versicolor_size2, 'EdgeColor', 'none', 'FaceColor', [0 0.6 0]); 
surf(x,y,post_virginica_size2, 'EdgeColor', 'none', 'FaceColor', [0.6 0 0]); 
xlim([0 8])
ylim([0 8])
xlabel('petal length')
ylabel('petal width')
zlabel('PDF')
view(2)
hold on

k = randsample(size(iris,1), size(iris,1)/2);

for i= 1:length(k)
    tempX = table2array(iris(k(i), 'petal_length'));
    tempY = table2array(iris(k(i), 'petal_width'));
%     string(table2array(iris(i, 'variety')))
    switch string(table2array(iris(k(i), 'variety')))
        case 'Setosa'
            plot3(tempX, tempY, 1, 'y+')
        case 'Versicolor'
            plot3(tempX, tempY, 1, 'k+')
        case 'Virginica'
            plot3(tempX, tempY, 1, 'm+')
    otherwise
        warning('Unexpected plot type. No plot created.') 
    end
    clear tempX
    clear tempY
end

% print -depsc testClassifierCaseA
% print -depsc testClassifierCaseB
% print -depsc testClassifierCaseC

% ------------------------------------------------------
% Calculate errors

mu_1 = mu_setosa(:, 3:4); 
mu_2 = mu_versicolor(:,3:4); 
mu_3 = mu_virginica(:, 3:4);

sigma_1 = cov_setosa(3:4, 3:4);
sigma_2 = cov_versicolor(3:4, 3:4);
sigma_3 = cov_virginica(3:4, 3:4);

Beta_range = 0:0.01:1;

for i=1:length(Beta_range)
    beta = Beta_range(i);
    
    k12 = get_k(beta, mu_1, mu_2, sigma_1, sigma_2);
    k23 = get_k(beta, mu_2, mu_3, sigma_2, sigma_3);
    k31 = get_k(beta, mu_3, mu_1, sigma_3, sigma_1);
    
    e12(i) = exp(-k12); 
    e23(i) = exp(-k23); 
    e31(i) = exp(-k31); 

end

[Exp12, betaIndex12] = min(e12);
[Exp23, betaIndex23] = min(e23);
[Exp31, betaIndex31] = min(e31);

chernoff12 = P_setosa^Beta_range(betaIndex12) * P_versicolor^(1-Beta_range(betaIndex12)) * Exp12;
chernoff23 = P_versicolor^Beta_range(betaIndex23) * P_virginica^(1-Beta_range(betaIndex23)) * Exp23;
chernoff31 = P_virginica^Beta_range(betaIndex31) * P_setosa^(1-Beta_range(betaIndex31)) * Exp31;
chernoff = [chernoff12, chernoff23, chernoff31];

n = round(length(Beta_range)/2);
bhatt12 = sqrt(P_setosa*P_versicolor)*e12(n);
bhatt23 = sqrt(P_versicolor*P_virginica)*e23(n);
bhatt31 = sqrt(P_virginica*P_setosa)*e31(n);
bhatt = [bhatt12, bhatt23, bhatt31];

error = [chernoff; bhatt] *100

figure();
subplot(1,3,1)
plot(Beta_range,e12)
title('Setosa - Versicolor')
xlabel('ß')
ylabel('exp(-k(ß))')

subplot(1,3,2)
plot(Beta_range,e23)
title('Versicolor - Virginica')
xlabel('ß')
ylabel('exp(-k(ß))')

subplot(1,3,3)
plot(Beta_range,e31)
title('Virginica - Setosa')
xlabel('ß')
ylabel('exp(-k(ß))')

% print -depsc errorCaseA
% print -depsc errorCaseB
% print -depsc errorCaseC

% ------------------------------------------------------
% Classifier

incorrect = zeros(1,3);
p_c = zeros(1,3);
P_posteriori_c = zeros(1,3);

 for i=1:50
    x= table2array(setosa(i,3:4));
    
    sigma_c = cov_setosa(3:4, 3:4);
    mu_c = mu_setosa(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(1)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
    
    sigma_c = cov_versicolor(3:4, 3:4);
    mu_c = mu_versicolor(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(2)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
    
    sigma_c = cov_virginica(3:4, 3:4);
    mu_c = mu_virginica(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(3)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
      
    p_posteriori_c(1)=p_c(1)/(p_c(1)+p_c(2)+p_c(3));
    p_posteriori_c(2)=p_c(2)/(p_c(1)+p_c(2)+p_c(3));
    p_posteriori_c(3)=p_c(3)/(p_c(1)+p_c(2)+p_c(3));
      
      [a,b]=find(max(p_posteriori_c)==p_posteriori_c);
      
      
        switch b
            case 1
                
            case 2
                incorrect(1)=incorrect(1)+1;
            case 3
                incorrect(3)=incorrect(3)+1;
        end
 end
 
 for i=1:50
     x= table2array(versicolor(i,3:4));
     
    sigma_c = cov_setosa(3:4, 3:4);
    mu_c = mu_setosa(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(1)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
    
    sigma_c = cov_versicolor(3:4, 3:4);
    mu_c = mu_versicolor(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(2)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
    
    sigma_c = cov_virginica(3:4, 3:4);
    mu_c = mu_virginica(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(3)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
      
    p_posteriori_c(1)=p_c(1)/(p_c(1)+p_c(2)+p_c(3));
    p_posteriori_c(2)=p_c(2)/(p_c(1)+p_c(2)+p_c(3));
    p_posteriori_c(3)=p_c(3)/(p_c(1)+p_c(2)+p_c(3));
      
      [a,b]=find(max(p_posteriori_c)==p_posteriori_c);
      
      
        switch b
            case 1
                incorrect(1)=incorrect(1)+1;
            case 2
                
            case 3
                incorrect(2)=incorrect(2)+1;
        end
 end
for i=1:50
     x= table2array(virginica(i,3:4));
    
     sigma_c = cov_setosa(3:4, 3:4);
    mu_c = mu_setosa(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(1)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
    
    sigma_c = cov_versicolor(3:4, 3:4);
    mu_c = mu_versicolor(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(2)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
    
    sigma_c = cov_virginica(3:4, 3:4);
    mu_c = mu_virginica(:, 3:4)';
    mu_c = mu_c';
    factor=1/(2*pi*sqrt(norm(sigma_c)));
    p_c(3)=factor*exp((-1/2)*(x-mu_c)*inv(sigma_c)*(x-mu_c)'); 
      
    p_posteriori_c(1)=p_c(1)/(p_c(1)+p_c(2)+p_c(3));
    p_posteriori_c(2)=p_c(2)/(p_c(1)+p_c(2)+p_c(3));
    p_posteriori_c(3)=p_c(3)/(p_c(1)+p_c(2)+p_c(3));
      
      [a,b]=find(max(p_posteriori_c)==p_posteriori_c);
      
      
        switch b
            case 1
                incorrect(3)=incorrect(3)+1;
            case 2
                incorrect(2)=incorrect(2)+1;
            case 3
                
        end
end
errorExp = incorrect/150


function [k] =  get_k(beta, mu1, mu2, sigma1, sigma2)
    c1 = beta*(1-beta)/2;
    c2 = mu2-mu1; % we do not transpose the matrix because mu is 1 x n instead of n x 1
    c3 = inv(beta*sigma1+(1-beta)*sigma2);
    c4 = c2';
    c5 = det(beta*sigma1+(1-beta)*sigma2);
    c6 = (det(sigma1)^beta) * det(sigma2)^(1-beta);
    
    k = c1*c2*c3*c4+0.5*log(c5/c6);
end


