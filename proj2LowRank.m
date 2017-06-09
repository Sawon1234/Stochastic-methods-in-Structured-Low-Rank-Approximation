function LowRankMatrix=proj2LowRank(matrix,r)
% proj2LowRank approximates given matrix to a reduced rank matrix of rank r
%
% d = proj2LowRank(matrix,r) returns the rank reduced matrix.
%
% Inputs: matrix is m x n matrix
%         r is the rank of the rank reduced approximating matrix.
%
% Output: d is the low rank, 'r' approximating matrix.

% feasibility checking 
matrix_rank = rank(matrix);

if matrix_rank >= r
    [U, S, V]= svd(matrix);
    LowRankMatrix = U(:, 1: r)* S(1: r, 1: r)* V(:, 1: r)';
else
    error('Rank reduction not feasible, matrix rank lesser than low rank sorted');
end