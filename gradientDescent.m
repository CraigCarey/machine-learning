function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%	theta = GRADIENTDESCENT(x, y, theta, alpha, num_iters) updates theta by
%	taking num_iters gradient steps with learning rate alpha

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
x = X(:,2:size(X, 2));

	for iter = 1:num_iters

		hypothesis = X * theta;
		errors = hypothesis .- y;
		newDecrement = (alpha * (1/m) * errors' * X); 
		theta = theta - newDecrement';
		J_history(iter) = computeCostMulti(X, y, theta);

	end

end
