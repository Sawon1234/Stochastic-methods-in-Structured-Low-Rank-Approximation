close all;
clear all;
clc;
% m = -1;
% m = 0;
% m = 1;
% m = 2;
% m = 3;
% Hankel_vector = [0, 3-2*m, 0, -1, 0, m, 0, -1, 0, 3-2*m, 0];
% L = 3;
% rank_required = 2;

Hankel_vector = [3,4,2,1,5,6,7,1,2];
L = 4;
rank_required = 3;

Hankel_matrix = Vec2Han(Hankel_vector,L);
%                     Alternate Projection
Hankel_Approx = AltProj(Hankel_matrix,rank_required);
New_Hankel_vector=Han2Vec(Hankel_Approx);
distance = Diff_bet2mat(Hankel_Approx,Hankel_matrix)
%                     Orthogonalized Alternate Projection
Orthogonalized_Hankel_Approx = OrthAltProj(Hankel_matrix,rank_required);
New_Ortho_Hankel_vector=Han2Vec(Orthogonalized_Hankel_Approx);
distance = Diff_bet2mat(Orthogonalized_Hankel_Approx,Hankel_matrix)