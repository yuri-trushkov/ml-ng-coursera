function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_val = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30 ]';
sigma_val = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30 ]';

%C_val = [1]';
%sigma_val = [1]';


err = zeros(length(C_val), length(sigma_val));

for iC = 1:length(C_val)
  
  for isigma = 1:length(sigma_val)
    
    C = C_val(iC);
    sigma = sigma_val(isigma);
    
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    model_val(iC, isigma) = model;

    pred_val = svmPredict(model, Xval);    
    err_val(iC, isigma) = mean(double( yval ~= pred_val));
    
    printf('Parameter set %i/%i:', ...
    (iC - 1) * length(C_val) + isigma , length(C_val)* length(sigma_val) )

    
  end
end


err_min = min(err_val(:));

[i1, i2] = find(err_min == err_val);

C = C_val(i1(1));
sigma = sigma_val(i2(1));

C_val, sigma_val, err_val, i1, i2;

% =========================================================================

end
