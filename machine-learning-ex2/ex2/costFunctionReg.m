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

hx = sigmoid(X * theta);
cost = sum(log(hx)' * y + log(1 - hx)' *(1 - y)) ;
r = lambda/(2*m)*sum(theta(2:length(theta),:).^2);

J = -cost / m + r;

for i = 1: length(grad)  
  grad(i) = (( hx - y )' * X(:,i)) / m ; 
  if i >= 2
    grad(i) = grad(i) + lambda/m * theta(i);
  endif
endfor




% =============================================================

end
