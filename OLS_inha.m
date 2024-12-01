function [beta_hat, t_value] = OLS_inha(Y, X)
%Y:종속변수 X:설명변수

[n, k] = size(X);

beta_hat = inv(X' * X) * X' * Y; % 2 by 1
e_hat = Y - X * beta_hat; % 잔차항
sig2_hat = (e_hat' * e_hat) / (n - k);
Var_beta = sig2_hat * inv(X' * X); % 2 by 2
se_beta = sqrt(diag(Var_beta));
t_value = beta_hat./ se_beta;

end