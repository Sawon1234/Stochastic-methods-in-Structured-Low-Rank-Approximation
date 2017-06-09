function distance = Diff_bet2mat(x1,x2)
% Diff_bet2mat is the distances between 2 matrices
% Inputs: x1 & x2 are 2 L x K matrices
%
% Output: distance between the 2 matrices x1 & x2
if size(x1) ~= size(x2)
    error('Inconsistent matrix dimensions');
else
    [L,K] = size(x1);
    distance = 0;
    for i = 1:L
        for j = 1:K
            distance = distance + power((x1(i,j)-x2(i,j)),2);
        end
    end
end