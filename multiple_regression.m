clear
clc

%%%%% step1: DGP
n = 100; % sample size
true_beta1 = 0.5;
true_beta2 = 0.8;
true_beta3 = 0.7;
sigma2 = 0.5;

NN = 10000;
Beta_hatm = zeros(NN, 3); %beta_hat save matrix

for iter = 1:NN

    X1 = ones(n, 1); % X는 non-stochastic
    X2 = 5 * rand(n, 1);
    X3 = rand(n ,1);
    e = sqrt(sigma2) * randn(n, 1);

    Y = X1 * true_beta1 + X2 * true_beta2 + X3 * true_beta3 + e;

    %%%%% step2: 추정
    X = [X1, X2, X3];
    [beta_hat, t_value] = OLS(Y, X);

    Beta_hatm(iter, :) = beta_hat';

end

mean(Beta_hatm)
