function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    feanum = size(X, 2);
    theta_update = zeros(feanum, 1);
    for inst = 1:m
        loss = X(inst, :) * theta - y(inst);
        for fea = 1:feanum
           theta_update(fea) = theta_update(fea) + loss * X(inst, fea);
        end
    end

    for fea = 1:feanum
       theta(fea) = theta(fea) - alpha / m * theta_update(fea);
    end

    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
