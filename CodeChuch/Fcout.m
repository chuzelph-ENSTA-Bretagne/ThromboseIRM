%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule la fonction de cout pour un nombre k fixe de
% classe pour la matrice Z donnée en argument.
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ J ] = Fcout( Z , k )
Zsum = sum(Z(:,1:k).^2,2);
M = max(Z(:,1:k).^2,[],2);
J = sum(Zsum./M);


end

