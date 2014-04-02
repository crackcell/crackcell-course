function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


J = 0;
for inst = 1:m
   h = sigmoid(X(inst, :) * theta);
   J = J - 1 * y(inst) * log(h) - (1 - y(inst)) * log(1 - h);
end
J = J / m;

R = 0;
for t = 2:size(theta, 1)
   R = R + theta(t) * theta(t);
end
R = R * lambda / (2 * m);
J = J + R;

grad(1) = 1 / m * X(:,1)' * (sigmoid(X * theta) - y);
grad(2:end) = 1 / m * X(:, 2:end)' * (sigmoid(X * theta) - y) + lambda / m * theta(2:end);
% =============================================================

end
