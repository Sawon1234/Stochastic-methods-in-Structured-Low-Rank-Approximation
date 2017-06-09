function Hankel_Approx = proj2Hankel(matrix)
% proj2Hankel approximates given matrix to it's nearest hankel matrix
%
% Inputs: matrix is n x n matrix
%
% Output: Hankel_Approx is the nearest hankel matrix approximation of the given matrix
S = [];
[n,m]=size(matrix);
for i = 2:2*n
    basis = zeros(n);
    for j = 1:n
        for k = 1:n
            if (j+k) == i
                basis(j,k) = 1;
            end
        end
    end
%         basis
    vec_s = reshape(basis,[n*n,1]);
    S = horzcat(S,vec_s);
end
projection_matrix = S*inv((S')*S)*(S')*reshape(matrix,[n*n,1]);
Hankel_Approx = reshape(projection_matrix,[n,n]);