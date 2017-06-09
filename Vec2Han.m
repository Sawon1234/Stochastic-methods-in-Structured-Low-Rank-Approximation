function matrix=Vec2Han(vector,HankelOrder)
% Vec2Han transforms the given vector of size L+K-1 to a LxK Hankel matrix
% Inputs: a vector of size L+K-1 
% Output: LxK Hankel matrix corresponding to the vector of size L+K-1.
matrix = hankel(vector(1:HankelOrder)',vector(HankelOrder:end)');