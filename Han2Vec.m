function vector=Han2Vec(matrix)
% Han2Vec transforms the given LxK Hankel matrix to a vector of size L+K-1
% Inputs: LxK Hankel matrix
% Output: a vector of size L+K-1 corresponding to the Hankel matrix.
vector = horzcat(matrix(:,1)',matrix(end,2:end));