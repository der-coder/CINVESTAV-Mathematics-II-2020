% BAYESIAN DESCRIPTOR
% WRITTEN BY ISAAC AYALA
% LICENSED UNDER THE GPL 3.0 LICENSE. SEE LICENSE FILE FOR DETAILS.

clc
clear variables
close all

iris = readtable('iris.csv');

setosa = iris(contains(string(iris.variety),'Setosa'),:);
versicolor = iris(contains(string(iris.variety),'Versicolor'),:);
virginica = iris(contains(string(iris.variety),'Virginica'),:);
bins = 10;


% Histrograms for Setosa %

figure; 

h11 = histfit(setosa.sepal_length, 6, 'Normal'); hold on;
h11(1).FaceAlpha = 0.5;
h11(2).Color = [0 0 0.3];
h12 = histfit(versicolor.sepal_length, 6, 'Normal')
h12(1).FaceAlpha = 0.5;
h12(2).Color = [0.5 0.5 0];
h13 = histfit(virginica.sepal_length, 6, 'Normal')
h13(1).FaceAlpha = 0.5;
h13(2).Color = [0 0.3 0];
legend({'Setosa','',  'Versicolor','', 'Virginica', ''})
xlabel('Sepal length')
ylabel('Frequency')
print -depsc normSepalLength

figure; 
h21 = histfit(setosa.sepal_width, 5, 'Normal'); hold on;
h21(1).FaceAlpha = 0.5;
h21(2).Color = [0 0 0.3];
h22 = histfit(versicolor.sepal_width, 5, 'Normal')
h22(1).FaceAlpha = 0.5;
h22(2).Color = [0.5 0.5 0];
h23 =histfit(virginica.sepal_width, 5, 'Normal')
h23(1).FaceAlpha = 0.5;
h23(2).Color = [0 0.3 0];
legend({'Setosa','',  'Versicolor','', 'Virginica', ''})
xlabel('Sepal width')
ylabel('Frequency')
print -depsc normSepalWidth


figure; 
h31 = histfit(setosa.petal_length, 8, 'Normal'); hold on;
h31(1).FaceAlpha = 0.5;
h31(2).Color = [0 0 0.3];
h32 = histfit(versicolor.petal_length, 8, 'Normal')
h32(1).FaceAlpha = 0.5;
h32(2).Color = [0.5 0.5 0];
h33 = histfit(virginica.petal_length, 8, 'Normal')
h33(1).FaceAlpha = 0.5;
h33(2).Color = [0 0.3 0];
legend({'Setosa','',  'Versicolor','', 'Virginica', ''})
xlabel('Petal length')
ylabel('Frequency')
print -depsc normPetalLength


figure; 
h41 = histfit(setosa.petal_width, 3, 'Normal'); hold on;
h41(1).FaceAlpha = 0.5;
h41(2).Color = [0 0 0.3];
h42 = histfit(versicolor.petal_width, 3, 'Normal')
h42(1).FaceAlpha = 0.5;
h42(2).Color = [0.5 0.5 0];
h43 = histfit(virginica.petal_width, 3, 'Normal')
h43(1).FaceAlpha = 0.5;
h43(2).Color = [0 0.3 0];
legend({'Setosa','',  'Versicolor','', 'Virginica', ''})
xlabel('Petal width')
ylabel('Frequency')
print -depsc normPetalWidth

% h_setosa_sepalLength = histogram(setosa.sepal_length,'Normalization','probability','NumBins',bins);
% h_setosa_sepalWidth = histogram(setosa.sepal_width,'Normalization','probability','NumBins',bins);
% h_setosa_petalLength = histogram(setosa.petal_length,'Normalization','probability','NumBins',bins);
% h_setosa_petalWidth = histogram(setosa.petal_width,'Normalization','probability','NumBins',bins);

% Histograms for Versicolor %


% figure; 
% figure; 

% h_versicolor_sepalLength = histogram(versicolor.sepal_length,'Normalization','probability','NumBins',bins);
% h_versicolor_sepalWidth = histogram(versicolor.sepal_width,'Normalization','probability','NumBins',bins);
% h_versicolor_petalLength = histogram(versicolor.petal_length,'Normalization','probability','NumBins',bins);
% h_versicolor_petalWidth = histogram(versicolor.petal_width,'Normalization','probability','NumBins',bins);

% Histograms for Virginica %


% figure; 
% figure; 

% h_virginica_sepalLength = histogram(virginica.sepal_length,'Normalization','probability','NumBins',bins);
% h_virginica_sepalWidth = histogram(virginica.sepal_width,'Normalization','probability','NumBins',bins);
% h_virginica_petalLength = histogram(virginica.petal_length,'Normalization','probability','NumBins',bins);
% h_virginica_petalWidth = histogram(virginica.petal_width,'Normalization','probability','NumBins',bins);

% ------------------------------------------------------
% Get mu and sigma for each feature %

% pd_setosa_sepalLength = fitdist(setosa.sepal_length, 'Normal');
% pd_setosa_sepalWidth = fitdist(setosa.sepal_width, 'Normal');
% pd_setosa_petalLength = fitdist(setosa.petal_length, 'Normal');
% pd_setosa_petalWidth = fitdist(setosa.petal_width, 'Normal');
% 
% pd_versicolor_sepalLength = fitdist(versicolor.sepal_length, 'Normal');
% pd_versicolor_sepalWidth = fitdist(versicolor.sepal_width, 'Normal');
% pd_versicolor_petalLength = fitdist(versicolor.petal_length, 'Normal');
% pd_versicolor_petalWidth = fitdist(versicolor.petal_width, 'Normal');
% 
% pd_virginica_sepalLength = fitdist(virginica.sepal_length, 'Normal');
% pd_virginica_sepalWidth = fitdist(virginica.sepal_width, 'Normal');
% pd_virginica_petalLength = fitdist(virginica.petal_length, 'Normal');
% pd_virginica_petalWidth = fitdist(virginica.petal_width, 'Normal');

% ------------------------------------------------------
% Get P(C_i) C_i: flower variety

% P_setosa = size(setosa, 1) / size(iris,1);
% P_versicolor = size(versicolor, 1) / size(iris,1);
% P_virginica = size(virginica, 1) / size(iris,1);
% 
% P_C = [P_setosa, P_versicolor, P_virginica];

% ------------------------------------------------------
% Get P(C_i|x)

% sepalLength = linspace(min(iris.sepal_length), max(iris.sepal_length), size(iris,1));
% sepalWidth = linspace(min(iris.sepal_width), max(iris.sepal_width), size(iris,1));
% petalLength = linspace(min(iris.petal_length), max(iris.petal_length), size(iris,1));
% petalWidth = linspace(min(iris.petal_width), max(iris.petal_width), size(iris,1));
% 
% 
% post_sepalLength = posteriori_w(sepalLength', P_C, pd_setosa_sepalLength, pd_versicolor_sepalLength, pd_virginica_sepalLength);
% post_sepalWidth = posteriori_w(sepalWidth', P_C, pd_setosa_sepalWidth, pd_versicolor_sepalWidth, pd_virginica_sepalWidth);
% post_petalLength = posteriori_w(petalLength', P_C, pd_setosa_petalLength, pd_versicolor_petalLength, pd_virginica_petalLength);
% post_petalWidth = posteriori_w(petalWidth', P_C, pd_setosa_petalWidth, pd_versicolor_petalWidth, pd_virginica_petalWidth);
% 
% figure(); plot(post_sepalLength(:,2:4))
% figure(); plot(post_sepalWidth(:,2:4))
% figure(); plot(post_petalLength(:,2:4))
% figure(); plot(post_petalWidth(:,2:4))

% ------------------------------------------------------



function [posteriori1, posteriori2, posteriori3] = a_posteriori_p(x,P, data1, data2, data3)
    p_x_1 = normpdf(x, data1.mu, data1.sigma);
    p_x_2 = normpdf(x, data2.mu, data2.sigma);
    p_x_3 = normpdf(x, data3.mu, data3.sigma);
    
    p_x = [p_x_1, p_x_2, p_x_3];
    
    den = sum(p_x*P');
    
    posteriori1 = p_x(1)* P(1)/den;
    posteriori2 = p_x(2)* P(2)/den;
    posteriori3 = p_x(3)* P(3)/den;
    
end    


function [post_category] = posteriori_w(feature, p_w, pd1, pd2, pd3)
    post_category = zeros(size(feature, 1), 4);
    for i = 1:size(feature,1)
        [post1, post2, post3] = a_posteriori_p(feature(i), p_w, pd1, pd2, pd3);
        post_category(i,:) = [feature(i), post1, post2, post3];
    end
end