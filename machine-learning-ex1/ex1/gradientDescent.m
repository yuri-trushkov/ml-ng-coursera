function [theta, J_hist] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_hist = zeros(num_iters + 1, 1);
theta_hist = zeros(size(X, 2), num_iters + 1);

J_hist(1) = computeCost(X, y, theta);
theta_hist(:,1) = theta;

    
    
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    
    theta_hist(:, iter + 1) = theta_hist(:, iter) + alpha * X' * (y - X * theta_hist(:, iter)) / m;



    % ============================================================

    % Save the cost J in every iteration    
    J_hist(iter + 1) = computeCost(X, y, theta_hist(:, iter + 1));

end

theta = theta_hist(:, end)

end
