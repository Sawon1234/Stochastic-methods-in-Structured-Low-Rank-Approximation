close all;
clear all;
clc;
m = -1;
m = 0;
% m = 1;
% m = 2;
% m = 3;
Hankel_vector = [0, 3-2*m, 0, -1, 0, m, 0, -1, 0, 3-2*m, 0];
L = 3;
rank_required = 2;

% Hankel_vector = [3,4,2,1,5,6,7,1,2];
% L = 4;
% rank_required = 3;

Hankel_matrix = Vec2Han(Hankel_vector,L);

%          Multistart Alternating Projections with Backtracking and Randomization
apbr_Hankel = apbr(Hankel_vector,rank_required,L);
distance = Diff_bet2mat(apbr_Hankel,Hankel_matrix)