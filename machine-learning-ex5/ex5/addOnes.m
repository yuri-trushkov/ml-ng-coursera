function [X] = addOnes(X)
  
  
  X = [ones(size(X, 1), 1) X];

end