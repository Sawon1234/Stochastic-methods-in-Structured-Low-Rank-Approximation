function Hankel_Approx = DiagProjHankel(matrix)
% proj2Hankel approximates given matrix to it's nearest hankel matrix
%
% Inputs: matrix is L x K matrix
%
% Output: Hankel_Approx is the nearest hankel matrix approximation of the given matrix
[L,K]=size(matrix);
vector = [];
for i = 1:L+K-1
    s = [];
    for j = 1:L
        for k = 1:K
            if (j+k) == (i+1)
                s = horzcat(s,matrix(j,k));
            end
        end
    end
    vector = horzcat(vector,mean(s));   % diagonal averaging
%     vector = horzcat(vector,min(s));    % diagonal minimizing
end
Hankel_Approx = hankel(vector(1:L),vector(L:L+K-1));