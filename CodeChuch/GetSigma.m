%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%                                                                         
% Fonction qui permet le calcul du paramètre de dispersion sigma associé à
% chaque point en fonction de son r-ieme voisin.                          
% ref : Self-Tuning Spectral Clustering, Manor et Perona 
%
% INPUT:
% X : vecteur des données à trier
% r : N° du voisin à considérer
%
% OUTPUT:
% Sigma : vecteur contenant les coefficients de dispertion de tous les
% points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ Sigma ] = GetSigma( X , r )

% X vecteur des données à trier
% r N° du voisin
A = DistEucli( X );
[B,IX]=sort(A);

Sigma = B(r,:);


end

