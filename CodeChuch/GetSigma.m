%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%                                                                         
% Fonction qui permet le calcul du param�tre de dispersion sigma associ� �
% chaque point en fonction de son r-ieme voisin.                          
% ref : Self-Tuning Spectral Clustering, Manor et Perona 
%
% INPUT:
% X : vecteur des donn�es � trier
% r : N� du voisin � consid�rer
%
% OUTPUT:
% Sigma : vecteur contenant les coefficients de dispertion de tous les
% points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ Sigma ] = GetSigma( X , r )

% X vecteur des donn�es � trier
% r N� du voisin
A = DistEucli( X );
[B,IX]=sort(A);

Sigma = B(r,:);


end

