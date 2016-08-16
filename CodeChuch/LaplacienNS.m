%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule le laplacien normalisé symétrique de la matrice de
% voisinage W
%
% INPUT
% W : Matrice de voisinage
%
% OUTPUT
% L     : Laplacien de la matrice W
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ L ] = LaplacienNS( W )
[ D , degs] = DegreeFunction( W );
D12 = D^(-1/2);
L = eye(length(W),length(W))-D12*W*D12;
end

