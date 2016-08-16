%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule le laplacien standard de la matrice de
% voisinage W
%
% INPUT
% W : Matrice de voisinage
%
% OUTPUT
% L     : Laplacien de la matrice W
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ L ] = LaplacienSTD( W )
[ D , degs] = DegreeFunction( W );
L = D-W;
end

