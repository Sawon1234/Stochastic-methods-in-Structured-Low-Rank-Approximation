function [Optimal_Hankel_Approx] = OrthAltProj(matrix,r)
% OrthAltProj approximates a given Hankel matrix to it's lower order hankel matrix
% Inputs: matrix is L x K matrix, 
% r is the low rank sorted
% Output: Optimal_Hankel_Approx is the nearest lower order hankel matrix
% approximation of the given matrix of rank r

iterations = 600;
hankel_space_initial = proj2LowRank(matrix,r);
for i = 1:iterations
    hankel_space_final = DiagProjHankel(hankel_space_initial);
%     hankel_space_final = proj2Hankel(hankel_space_initial);
    hankel_space_initial = proj2LowRank(hankel_space_final,r);
    hankel_space_initial = ((trace(hankel_space_initial*matrix'))/(trace(hankel_space_initial*hankel_space_initial')))*hankel_space_initial;
end
Optimal_Hankel_Approx = hankel_space_initial;