function [Hankel_matrix] = apbr(vector,r,L)
% apbr approximates a given Hankel matrix to it's lower order hankel matrix
% Inputs: matrix is n x n matrix, 
% r is the low rank sorted
% Output: hankel_space_final is the nearest lower order hankel matrix
% approximation of the given matrix of rank r

% M = 1000;
M = 10;
P = 500;
c = 1;
so = 0.25;
s = 1;
p = 0.5;
q = 1.5;
iterations = 600;

x = Vec2Han(vector,L);
% distance = power(norm(x),2);
distance = inf;
for j = 1:M
    U = rand(1);
    x_random = rand(size(vector));
    x_tilda = Vec2Han(x_random,L);
    xoj = (1-so)*x + so*x_tilda;
    Xnj = xoj;
    
    for n = 1:iterations
        if n > 500
            delta_n = 0;
            sigma_n = 0;
        else
            delta_n = U/((n+1)^p);
            sigma_n = c/((n+1)^q);
        end
        Znj = (1-delta_n)*proj2LowRank(DiagProjHankel(Xnj),r) + (delta_n)*x + (sigma_n)*x_tilda;
        Xnj = ((trace(Znj*x'))/(trace(Znj*Znj')))*Znj;
    end
    if distance > Diff_bet2mat(Xnj,x)
            Hankel_matrix = Xnj; 
            distance = Diff_bet2mat(Xnj,x);
    end
end
