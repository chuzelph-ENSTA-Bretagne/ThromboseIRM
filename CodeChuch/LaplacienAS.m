%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule le laplacien normalisé asymétrique de la matrice de
% voisinage W
%
% INPUT
% W : Matrice de voisinage
%
% OUTPUT
% L     : Laplacien de la matrice W
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ L ] = LaplacienAS( W )
[ D , degs] = DegreeFunction( W );
L = eye(length(W),length(W))-D^-1*W;
end

