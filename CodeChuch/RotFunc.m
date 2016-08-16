%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui applique les rotations selon les axes i et j obtenue par
% la fonction CalculPaire(n)
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%
% INPUT
% x : vecteur des angles de rotation
%
% OUTPUT
% R : matrice de rotation calculée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ R ] = RotFunc( x )
nPaire = length(x);
n = (1+sqrt(1+8*nPaire))/2;
tab = CalculPaire(n);

R = eye(n,n);
for i = 1:1:(n*(n-1)/2)
    R=R*rotation( x(i),tab(1,i),tab(2,i),n );
end

end

